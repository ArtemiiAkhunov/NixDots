{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/voidwalker/.config/sops/age/keys.txt";

    secrets = {
      # Add secrets
    };
  };
}
