{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  cmake,
  pipewire,
  alsa-lib,
  dbus,
  openssl,
  libGL,
  libxkbcommon,
  wayland,
  xorg,
  nix-update-script,
}:
let
  # eframe dlopens these at runtime; rfd dlopens libdbus for the file-chooser portal
  guiLibs = [
    dbus
    libGL
    libxkbcommon
    wayland
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
  ];
in
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "pwsp";
  version = "1.16.5";

  src = fetchFromGitHub {
    owner = "arabianq";
    repo = "pipewire-soundpad";
    tag = "v${finalAttrs.version}";
    hash = "sha256-0wzWdJKaq5QQxadfYlsYY3GafZC0VGyxvt172vdR+ps=";
  };

  cargoHash = "sha256-UJ81/pTmA1gyWupljqs6gN1g+EqX4Cu7Qyv5b3v3VfQ=";

  nativeBuildInputs = [
    pkg-config
    cmake # opusic-sys builds bundled libopus
    rustPlatform.bindgenHook
  ];

  buildInputs = [
    pipewire
    alsa-lib
    dbus
    openssl
  ];

  # tests write config under $HOME
  preCheck = ''
    export HOME=$(mktemp -d)
  '';

  postInstall = ''
    install -Dm644 pwsp-gui/assets/pwsp-gui.desktop -t $out/share/applications
    install -Dm644 pwsp-gui/assets/icon.png $out/share/icons/hicolor/256x256/apps/pwsp.png
    install -Dm644 pwsp-daemon/assets/pwsp-daemon.service -t $out/lib/systemd/user

    substituteInPlace $out/share/applications/pwsp-gui.desktop \
      --replace-fail "/usr/bin/pwsp-gui" "pwsp-gui"
    substituteInPlace $out/lib/systemd/user/pwsp-daemon.service \
      --replace-fail "/usr/bin/pwsp-daemon" "$out/bin/pwsp-daemon"
  '';

  postFixup = ''
    patchelf --add-rpath ${lib.makeLibraryPath guiLibs} $out/bin/pwsp-gui
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Play audio files through your microphone via PipeWire";
    homepage = "https://github.com/arabianq/pipewire-soundpad";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    mainProgram = "pwsp-gui";
  };
})
