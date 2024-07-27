{pkgs, ...}: {
	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [
			xdg-desktop-portal-wlr
			xdg-desktop-portal-gtk
		];
	};

	fonts.packages = import ./fonts.nix pkgs;
	environment = {
		systemPackages = import ./base.nix pkgs
			++ import ./development.nix pkgs
			++ import ./apps.nix pkgs
			++ import ./games.nix pkgs
			++ import ./themes.nix pkgs
			#++ import gnome/packages/main.nix pkgs;
			#++ import ./hyperland.nix pkgs;
			++ import plasma/packages.nix pkgs;

		gnome.excludePackages = import gnome/exclude.nix pkgs;
		plasma6.excludePackages = import plasma/exclude.nix pkgs;
	};
}
