{
  description = "initial flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel/release";
    };
  };

  outputs = { self, ... } @inputs: {

  nixosConfigurations.bonobo-ws = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
       inherit inputs;
    };
    modules = [./configuration.nix];
  };

  };
}
