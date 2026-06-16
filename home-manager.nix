{ inputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.gregorywpower = {
    programs = {
      zellij = {
        enable = true;
        enableBashIntegration = true;
      };
    };
  };
}
