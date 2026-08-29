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
          ghostty = {
            enable = true;
            systemd = {
              enable = true;
            };
            settings = {
              theme = "adwaita-dark";
            };
          };
          bash = {
            enable = true;
            bashrcExtra =''eval "$(devenv hook bash)"'';
          };
          zellij = {
            enable = true;
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
            theme = "adwaita-dark";
            };
          };
        };
      };
    };
  };
}
