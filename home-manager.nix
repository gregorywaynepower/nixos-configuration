{ inputs, config, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    overwriteBackup = true;
    users = {
      gregorywpower = {
        home.stateVersion = config.system.stateVersion;
        programs = {
          zellij = {
            enable = true;
            enableBashIntegration = true;
          };
        };
      };
    };
  };
}
