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
              theme = "Adwaita Dark";
            };
          };
          bash = {
            enable = true;
            bashrcExtra =''eval "$(devenv hook bash)"'';
          };
          zellij = {
            enable = true;
            settings = {
              # Reference https://github.com/zellij-org/zellij/issues/4649#issuecomment-3901565014 for fix.
              # Reference https://github.com/zellij-org/zellij/issues/5191 for upstream reason for fix.
              support_kitty_keyboard_protocol = false;
            };
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
