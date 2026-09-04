{
  description = "Reproducible NixOS rice: Hyprland + dev environment";

  inputs = {
    # nixos-unstable tracks recent packages (needed for e.g. ghostty, latest hyprland).
    # Swap to a release branch like nixos-24.11 if you want more stability.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
    let
      system = "x86_64-linux"; # change to "aarch64-linux" on ARM
      hostname = "nixos-rice"; # must match the folder name under ./hosts
      username = "me";         # <-- CHANGE to your actual username
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs username; };
        modules = [
          ./hosts/${hostname}/configuration.nix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs username; };
            home-manager.users.${username} = import ./modules/home/default.nix;
            # lets stylix theme Home-Manager-managed apps too (waybar, gtk, etc.)
            home-manager.sharedModules = [ stylix.homeManagerModules.stylix ];
          }
        ];
      };
    };
}
