{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        bluez
        bluez-tools
    ];
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = false;
        settings = {
            General = {
                Enable = "Source,Sink,Media,Socket";
                Experimental = true;
            };
        };
    };
    
    networking = {
    	hostname = "knife";
	proxy.noProxy = "127.0.0.1,localhost,internal.domain";
	networkmanager.enable = true;
    };
    services = {
    	blueman.enable = true;
	pipewire.wireplumber.configPackages = [
	(pkgs.writeTextDir "share/wireplumber/bluetooth.lua.d/51-bluez-config.lua" ''
		bluez_monitor.properties = {
			["bluez5.enable-sbc-xq"] = true,
			["bluez5.enable-msbc"] = true,
			["bluez5.enable-hw-volume"] = true,
			["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
		}
	'')
	];
    };
}
