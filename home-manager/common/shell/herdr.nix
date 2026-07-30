{
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
