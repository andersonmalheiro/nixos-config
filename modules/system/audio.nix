{ pkgs, ... }:
{
  # Modern audio stack, required for a working desktop experience.
  # rtkit lets pipewire request realtime scheduling.
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true; # PulseAudio-compatible interface for apps that expect it
  };
}
