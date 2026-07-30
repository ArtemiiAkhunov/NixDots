{
  # herdr writes this file itself on first run; force replaces the app-written
  # copy, and runtime commands that edit it (channel set, reset-keys) won't work
  xdg.configFile."herdr/config.toml" = {
    force = true;
    text = ''
      onboarding = false

      [theme]
      name = "terminal"

      [keys]
      prefix = "ctrl+a"
    '';
  };
}
