# My NixOS Rice

A reproducible Hyprland desktop + dev environment. Everything — window manager,
bar, theming, dotfiles, and dev tools — is declared here. Reinstalling on a new
machine is: install NixOS, clone this repo, rebuild.

## What's included

**Dev tools:** Firefox, VS Code, Neovim, Node.js, Python 3 + uv, PostgreSQL,
Docker + docker-compose, git, Ghostty.

**Desktop:** Hyprland, Waybar (status bar), Rofi (launcher), Dunst
(notifications), Thunar (file manager), Zathura (PDF reader), nm-applet +
blueman-applet (network / bluetooth GUIs), hyprlock (lockscreen), swww
(wallpaper), Stylix (system-wide theming, Catppuccin Mocha by default).

## First-time setup

1. **Boot a NixOS installer**, partition your disk, mount it, and generate a
   base hardware config as usual:
   ```
   sudo nixos-generate-config --root /mnt
   ```
2. **Get this repo onto the machine** (e.g. `git clone` from a USB stick or
   over network, since you won't have your rice yet to have a browser handy).
3. **Replace the placeholder** `hosts/nixos-rice/hardware-configuration.nix`
   with the one nixos-generate-config just made for you
   (`/mnt/etc/nixos/hardware-configuration.nix`).
4. **Edit the placeholders**, search the repo for these and change them:
   - `flake.nix` → `username = "me"` — your actual username
   - `modules/home/git.nix` → your name/email
   - `hosts/nixos-rice/configuration.nix` → `time.timeZone`
   - `hosts/nixos-rice/configuration.nix` → `system.stateVersion` — set to
     whatever release you're installing (check with `nixos-version`), then
     never change it again
   - `modules/home/default.nix` → `home.stateVersion` — match the above
5. **Build and switch:**
   ```
   sudo nixos-install --flake .#nixos-rice
   ```
   (or, on an already-installed system: `sudo nixos-rebuild switch --flake .#nixos-rice`)
6. Reboot into greetd/tuigreet, log in, type `Hyprland` if it's not
   auto-selected.

## Reinstalling on a new machine

1. Boot the installer, partition, mount.
2. `nixos-generate-config --root /mnt`, swap in the new hardware config as a
   new file under `hosts/<new-hostname>/`, copy `configuration.nix` there too
   and adjust `networking.hostName`.
3. Add a matching `nixosConfigurations.<new-hostname>` entry in `flake.nix`
   (or just reuse `nixos-rice` if the hostname doesn't matter to you).
4. `sudo nixos-install --flake .#<new-hostname>`.

That's the whole point — no manually reinstalling forty packages or
re-copying dotfiles from your last machine.

## GPU drivers (important, not included here on purpose)

GPU setup is genuinely machine-specific, so it's left out of this generic
template. Add a `modules/system/gpu.nix` and import it per-host:

- **AMD:** usually works out of the box; you mostly just want
  `hardware.graphics.enable = true;` (Mesa) and maybe
  `services.xserver.videoDrivers = [ "amdgpu" ];`.
- **Intel:** similar — `hardware.graphics.enable = true;` is often enough.
- **NVIDIA:** needs `services.xserver.videoDrivers = [ "nvidia" ];`,
  `hardware.nvidia.modesetting.enable = true;` (required for Wayland/Hyprland),
  and picking `hardware.nvidia.package` (proprietary vs open kernel module).
  Search the NixOS wiki's "Nvidia" and "Hyprland" pages when you get here —
  this is the part most likely to need machine-specific tweaking.

## Customizing

- **Colors/theme:** edit `modules/system/theme.nix` — swap
  `stylix.base16Scheme` for any scheme in `pkgs.base16-schemes`, or point
  `stylix.image` at your own wallpaper (a placeholder solid-color image is
  at `modules/home/assets/wallpaper.jpg` — replace it).
- **Keybindings:** `modules/home/hyprland.nix`, the `bind`/`bindm`/`bindl`
  lists.
- **Bar layout:** `modules/home/waybar.nix`.
- **Terminal look:** `modules/home/ghostty.nix`.
- **Neovim:** `modules/home/nvim.nix` is intentionally minimal. If you want a
  full IDE setup, swap it for [nixvim](https://github.com/nix-community/nixvim)
  or drop a LazyVim config in via `xdg.configFile."nvim"`.

## Updating

```
nix flake update          # bump all pinned inputs to their latest commits
sudo nixos-rebuild switch --flake .#nixos-rice
```

Roll back anytime from the boot menu, or with:
```
sudo nixos-rebuild switch --rollback
```

## Known rough edges to expect on first build

- **Ghostty** is only reliably packaged on `nixos-unstable`; if it's missing,
  pull it from its own flake (`github:ghostty-org/ghostty`) instead.
- **nerd-fonts** package names were restructured in nixpkgs at one point
  (`pkgs.nerd-fonts.<name>` vs the old `pkgs.nerdfonts.override {...}`) — if
  `hyprland.nix`/`theme.nix` errors on the font package, `nix search nixpkgs
  nerd-fonts` to find the current name on your pinned nixpkgs revision.
- **`docker compose` plugin vs `docker-compose` binary** — this config
  installs the standalone `docker-compose` binary; if you specifically want
  the `docker compose` subcommand, check whether your nixpkgs revision's
  `docker` package already bundles the compose plugin.
- The **Postgres auth** here uses `trust` for local connections for dev
  convenience — fine for a single-user laptop, not for a shared/networked box.
