{pkgs, ...}: {
	xdg.portal.enable = true;
	fonts.packages = import ./fonts.nix pkgs;
	environment = {
		systemPackages = let
			base = import ./base.nix pkgs;
			development = import ./development.nix pkgs;
			apps = import ./apps.nix pkgs;
			games = import ./games.nix pkgs;
			gnome = import ./gnome/main.nix pkgs;
			#hyperland = import ./hyperland.nix pkgs;
		in base ++ gnome ++ apps ++ games ++ development;

		gnome.excludePackages = import ./gnome/exclude.nix pkgs;
	};
}
