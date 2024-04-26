{ pkgs, ... }: {
    environment.systemPackages = with pkgs [
        catppuccin-gtk
        catppuccin-qt5ct
    ]

    gtk = {
        enable = true;
        theme = {
            name = 
        };
    };
}