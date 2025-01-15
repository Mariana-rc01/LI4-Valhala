using System.Security.Claims;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Components.Server.ProtectedBrowserStorage;

namespace Valhala.Authentication {
    public class ValhalaAuthStateProvider : AuthenticationStateProvider {
        private readonly ProtectedSessionStorage _sessionStorage;
        private ClaimsPrincipal _anonymous = new ClaimsPrincipal(new ClaimsIdentity());

        public ValhalaAuthStateProvider(ProtectedSessionStorage sessionStorage) {
            _sessionStorage = sessionStorage;
        }

        public override async Task<AuthenticationState> GetAuthenticationStateAsync() {
            try
            {
                // Recupera o UserSession do armazenamento protegido
                var userSessionStorageResult = await _sessionStorage.GetAsync<UserSession>("UserSession");
                var userSession = userSessionStorageResult.Success ? userSessionStorageResult.Value : null;

                if (userSession == null)
                    return new AuthenticationState(_anonymous);
                
                // Criar o ClaimsPrincipal com base no UserSession
                var claimsPrincipal = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim>
                {
                    new Claim(ClaimTypes.NameIdentifier, userSession.ID.ToString() ?? string.Empty), // Usar ID como NameIdentifier
                    new Claim(ClaimTypes.Name, userSession.Name ?? string.Empty),
                    new Claim(ClaimTypes.Role, userSession.Role ?? string.Empty)
                }, "ValhalaAuth"));

                return new AuthenticationState(claimsPrincipal);
            }
            catch (Exception)
            {
                return new AuthenticationState(_anonymous); // Em caso de erro, retorna um usuário anônimo
            }
        }

        // Atualiza o estado de autenticação e armazena a sessão no armazenamento protegido
        public async Task UpdateAuthenticationState(UserSession userSession) {
            ClaimsPrincipal claimsPrincipal;

            if (userSession != null)
            {
                // Armazenar o UserSession de forma protegida
                await _sessionStorage.SetAsync("UserSession", userSession);

                // Criação do ClaimsPrincipal com as informações de UserSession
                claimsPrincipal = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim>
                {
                    new Claim(ClaimTypes.NameIdentifier, userSession.ID.ToString() ?? string.Empty), // Usar ID em vez de UserId
                    new Claim(ClaimTypes.Name, userSession.Name ?? string.Empty),
                    new Claim(ClaimTypes.Role, userSession.Role ?? string.Empty)
                }, "ValhalaAuth"));
            }
            else
            {
                // Caso a sessão seja nula, remove a sessão do armazenamento
                await _sessionStorage.DeleteAsync("UserSession");
                claimsPrincipal = _anonymous; // Usuário anônimo
            }

            // Notifica que o estado de autenticação mudou
            NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(claimsPrincipal)));
        }

        // Recupera o UserSession do armazenamento protegido
        public async Task<UserSession> GetUserSession() {
            var userSessionStorageResult = await _sessionStorage.GetAsync<UserSession>("UserSession");
            
            // Verifica se o UserSession não existe ou está nulo
            if (!userSessionStorageResult.Success || userSessionStorageResult.Value == null)
                throw new Exception("UserSession not found.");
            
            return userSessionStorageResult.Value;
        }
    }
}
