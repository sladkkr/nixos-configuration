{...}: {
	users.users.karol = {
		isNormalUser = true;
		description = "Karol Klimczak";
		extraGroups = [ "networkmanager" "wheel" ];
	};

	environment.localBinInPath = true;
}
