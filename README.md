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
3. Research Home Manager
4. Research Flakes
5. [Set up and migrate Postgres database](https://nixos.org/manual/nixos/stable/#module-postgresql)
6. Keep tabs on SELinux implementation


[NixOS Manual](https://nixos.org/manual/nixos/stable/)
[Nixpkgs Manual](https://nixos.org/manual/nixpkgs/stable/)
[Nix.dev](https://nix.dev/)
[Nix Best Practices](https://nix.dev/guides/best-practices)
[Nix Flakes, An introduction and tutorial](https://www.tweag.io/blog/2020-05-25-flakes/)
[NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/introduction/)
[Ayats.org](https://ayats.org/)
[On Nix's Language: Introduction](https://tales.mbivert.com/on-nix-language/)
[Some notes on nix flakes - Julia Evans](https://jvns.ca/blog/2023/11/11/notes-on-nix-flakes/)
[Tour of Nix](https://nixcloud.io/tour/?id=introduction%2Fnix)
