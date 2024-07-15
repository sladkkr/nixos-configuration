{...}: {
	users.users.karol = {
		isNormalUser = true;
		description = "Karol Klimczak";
		extraGroups = [ "networkmanager" "wheel" ];
	};

	home-manager.users.karol = {
		home.stateVersion = "24.05";
	};
}
