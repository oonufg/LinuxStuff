{ pkgs, ... }: {
    programs.zsh.enable = true;
    users = {
        defaultUserShell = pkgs.zsh;
        users.pablo = {
            isNormalUser = true;
            description = "Pablo BlackMetal";
            extraGroups = ["wheel"];
            packages = with pkgs; [];
        };
    };
}
