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
                var userSessionStorageResult = await _sessionStorage.GetAsync<UserSession>("UserSession");
                var userSession = userSessionStorageResult.Success ? userSessionStorageResult.Value : null;

                if (userSession == null)
                    return new AuthenticationState(_anonymous);
                
                var claimsPrincipal = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim>
                {
                    new Claim(ClaimTypes.NameIdentifier, userSession.ID.ToString()), // Usar ID em vez de UserId
                    new Claim(ClaimTypes.Name, userSession.Name ?? string.Empty),
                    new Claim(ClaimTypes.Role, userSession.Role ?? string.Empty)
                }, "ValhalaAuth"));

                return new AuthenticationState(claimsPrincipal);
            }
            catch (Exception)
            {
                return new AuthenticationState(_anonymous);
            }
        }

        public async Task UpdateAuthenticationState(UserSession userSession) {
            ClaimsPrincipal claimsPrincipal;

            if (userSession != null)
            {
                await _sessionStorage.SetAsync("UserSession", userSession);

                claimsPrincipal = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim>
                {
                    new Claim(ClaimTypes.NameIdentifier, userSession.ID.ToString()), // Usar ID em vez de UserId
                    new Claim(ClaimTypes.Name, userSession.Name ?? string.Empty),
                    new Claim(ClaimTypes.Role, userSession.Role ?? string.Empty)
                }, "ValhalaAuth"));
            }
            else
            {
                await _sessionStorage.DeleteAsync("UserSession");
                claimsPrincipal = _anonymous;
            }

            NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(claimsPrincipal)));
        }


        public async Task<UserSession> GetUserSession() {
            var userSessionStorageResult = await _sessionStorage.GetAsync<UserSession>("UserSession");
            if (!userSessionStorageResult.Success || userSessionStorageResult.Value == null)
                throw new Exception("UserSession not found.");
            
            return userSessionStorageResult.Value;
        }
    }
}
