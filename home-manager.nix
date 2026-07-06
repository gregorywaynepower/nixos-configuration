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
          helix = {
            enable = true;
            settings = {
              editor = {
                line-number = "relative";
                soft-wrap = {
                  enable = true;
                };
                whitespace = {
                  render = "all";
                };
              };
            theme = "dark_high_contrast";
            };
          };
        };
      };
    };
  };
}
