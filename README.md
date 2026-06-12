# NixOS Configuration Goals

1. Get Oracle VirtualBox working
    a. VirtualBox does not work with Linux Kernel until version VirtualBox 2.6.8
    b. Either rollback kernel driver, pull and customize package, or use other drive.

```
  # Install VirtualBox
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.guest.clipboard = true;
  users.extraGroups.vboxusers.members = [ "gregorywpower" ];
```

2. Evaluate nixpkgs-unstable as software source
3. Research Flakes
4. Research Home Manager
5. [Set up and migrate Postgres database](https://nixos.org/manual/nixos/stable/#module-postgresql)
6. Keep tabs on SELinux implementation


- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Nixpkgs Manual](https://nixos.org/manual/nixpkgs/stable/)
- [Nix.dev](https://nix.dev/)
- [Nix Best Practices](https://nix.dev/guides/best-practices)
- [Nix Flakes, An introduction and tutorial](https://www.tweag.io/blog/2020-05-25-flakes/)
- [NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/introduction/)
- [Ayats.org](https://ayats.org/)
- [On Nix's Language: Introduction](https://tales.mbivert.com/on-nix-language/)
- [Some notes on nix flakes - Julia Evans](https://jvns.ca/blog/2023/11/11/notes-on-nix-flakes/)
- [Tour of Nix](https://nixcloud.io/tour/?id=introduction%2Fnix)

## How do I investigate more into this?

```
man 5 configuration.nix <-- NixOS man page for all module options
man 5 home-configuration.nix <-- Same for Home-Manager (both work offline)

nix eval examples:

$ nix eval .#nixosConfigurations.(hostname).config.services.openssh.enable
true

$ nix eval .#homeConfigurations.($env.USER)@(hostname).config.programs.nushell.enable
true

```

## How do I remove older generations from the bootloader in using channels (not flakes)?

First, remove some system generations of your system, then rebuild. The rebuild script will remove stale boot entries.

The first command, in the example below, removes system generations older than 14 days.

```
sudo nix-env --delete-generations --profile /nix/var/nix/profiles/system 14d
sudo nixos-rebuild boot
```

## Flake specific notes

### Nix Flake tldr Docs

  nix flake

  Manage Nix flakes.
  Some subcommands such as `init`, `show`, `info` have their own usage documentation.
  More information: https://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake.html.

  - Update all inputs (dependencies) of the flake in the current directory:
    nix flake update

  - Update a specific input (dependency) of the flake in the current directory:
    nix flake update input

  - Clone a GitHub repository containing a flake:
    nix flake clone github:owner/repo#attributes

  - Create missing lock file entries for a flake in a specified directory:
    nix flake lock path/to/flake

  - Display help:
    nix flake --help


### How to a test an environment via flakes using `nh`?

```
# from inside the directory with the flake.nix and lock.nix
nh os test .
```

### How do I create a new boot entry?

```
nh os boot .
```

