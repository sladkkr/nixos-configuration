{pkgs, ...}: {
	xdg.portal.enable = true;
	fonts.packages = import ./fonts.nix pkgs;
	environment = {
		systemPackages = import ./base.nix pkgs
			++ import ./development.nix pkgs
			++ import ./apps.nix pkgs
			++ import ./games.nix pkgs
			++ import gnome/main.nix pkgs;
			#++ import ./hyperland.nix pkgs;
			#++ import plasma/packages.nix pkgs;

		gnome.excludePackages = import gnome/exclude.nix pkgs;
		plasma6.excludePackages = import plasma/exclude.nix pkgs;
	};
}
