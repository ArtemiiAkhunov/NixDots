{
  pkgs,
  ...
}:
let
  microphoneStatus = (import ./scripts/microphoneStatus.nix { inherit pkgs; });
  monitorConnect = (import ./scripts/monitorConnect.nix { inherit pkgs; });
  retroarchWithCores = (
    pkgs.retroarch.withCores (
      cores: with cores; [
        mgba
        melonds
        ppsspp
      ]
    )
  );
  customPackages = [
    microphoneStatus
    monitorConnect
    retroarchWithCores
  ];
in
{
  environment.systemPackages =
    with pkgs;
    [
      # Desktop Apps

      # General Apps

      audacity
      blender
      teamspeak6-client
      (bottles.override {
        removeWarningPopup = true;
      })
      alsa-scarlett-gui
      qbittorrent
      glaxnimate
      makemkv
      crosspipe
      sushi
      yubioath-flutter
      darktable
      tigervnc
      postman

      # Audio Effects
      carla
      guitarix
      gxplugins-lv2
      calf
      lsp-plugins
      x42-plugins
      zam-plugins
      dragonfly-reverb
      ir-lv2

      # Gaming

      heroic
      prismlauncher

      # CLI stuff

      cava
      openseeface
      sherlock
      gvfs
      yt-dlp
      qemu

      # GPU utilities

      lshw
    ]
    ++ customPackages;
}
