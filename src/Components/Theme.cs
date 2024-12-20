using MudBlazor;

public class Theme : MudTheme {
    
    public Theme() {
        PaletteLight = new PaletteLight()
        {
            Primary = "#0094d8",
            Secondary = Colors.Green.Darken2,
            Background = "#F5F5F5",
            AppbarBackground = "#97EFAB",
            DrawerBackground = "#FFF",
            DrawerText = "#0D051B",
            Success = "#06d79c",
            White = "#ffff",
            TextPrimary = "#0D051B",
            TextSecondary = "#0D051B",
            DrawerIcon = "#0D051B",
        };

        Typography = new Typography()
        {
            Default = new Default()
            {
                FontFamily = new[] { "Noto Sans", "Helvetica", "Arial", "sans-serif" }
            },
            H1 = new H1()
            {
                FontSize = "28px",
                FontWeight = 500,
                LineHeight = 1.6,
                LetterSpacing = ".0075em"
            }
        };
    }
}