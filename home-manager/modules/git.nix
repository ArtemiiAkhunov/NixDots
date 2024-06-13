{
  programs.git = {
    enable = true;
    userName = "ArtemiiAkhunov";
    userEmail = "artemii13052003@gmail.com";
    extraConfig = {
      credential.helper = "oauth";
    };
  };
  programs.git-credential-oauth = {
    enable = true;
  };
}
