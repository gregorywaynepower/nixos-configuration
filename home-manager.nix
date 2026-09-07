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
          tmux = {
            enable = true;
            mouse = true;
            clock24 = true;
            keyMode = "vi";
            extraConfig = ''
              # Split panes with | and -
              bind | split-window -h
              bind - split-window -v
              # Move between panes with Prefix h,j,k,l​
              bind h select-pane -L
              bind j select-pane -D
              bind k select-pane -U
              bind l select-pane -R
              # Pane resizing with Prefix H, J, K, L
              bind -r H resize-pane -L 5
              bind -r J resize-pane -D 5
              bind -r K resize-pane -U 5
              bind -r L resize-pane -R 5
              # Quick window selection
              bind -r C-h select-window -t :-
              bind -r C-l select-window -t :+
              # Set default terminal mode to 256color mode
              set -g default-terminal "tmux-256color"
              # Enable activity alerts
              set -w -g monitor-activity on
              set -w -g visual-activity on
             '';
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
