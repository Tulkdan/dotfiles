{
  description = "NixOS configuration";

  outputs = {
    self,
      nixpkgs
  }: let
    system = "x86_64-linux";
    hostname = "nixos";
    pkgs = import nixpkgs {inherit system;};
  in {

    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit pkgs system;

      modules = [ ./configuration.nix ];
    };

  };
}
