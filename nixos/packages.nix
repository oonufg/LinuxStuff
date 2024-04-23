{ pkgs, ... }: {
    nixpkgs.config = {
        allowUnfree = true;
    };
    environment.systemPackages = with pkgs; [
        #Desktop
        librewolf
        telegram-desktop
        alacritty

        #Coding
        gcc
        gdb
        llvm
        clang
        lldb
        go
        cmake

        #CLI
        fastfetch
        wget
        git
        neovim
        btop
        unzip
        zip
        ranger
        ntfs3g
        brightnessctl
    ];
}
