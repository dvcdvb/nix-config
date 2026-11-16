# NixOS Configuration

My personal NixOS configuration using Nix Flakes and Home Manager.

>
> This configuration is a work in progress.
> Things may change as I continue improving my setup.

## Setup

- **OS:** NixOS
- **Window Manager:** SwayFX
- **Terminal:** Foot
- **Status Bar:** Waybar
- **Launcher:** Wofi
- **Theme:** Catppuccin

## Structure

```text
.
├── flake.nix
├── flake.lock
├── configuration.nix
├── hardware-configuration.nix
├── home.nix
└── home/
    └── programs/
        ├── git.nix
        ├── foot.nix
        ├── waybar.nix
        └── waybar/
            ├── config.jsonc
            └── style.css
```

## Usage

Apply the configuration:

```bash
sudo nixos-rebuild switch --flake .#nixos
```

Test changes without activating them:

```bash
sudo nixos-rebuild dry-build --flake .#nixos
```

Update flake dependencies:

```bash
nix flake update
```