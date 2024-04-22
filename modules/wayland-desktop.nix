{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        #Wayland
        xwayland
        wl-clipboard
        cliphist
        #WM
        hyprland
        xdg-desktop-portal-hyprland
        waybar
	wofi
    ];
    programs.hyprland.enable = true;
}
