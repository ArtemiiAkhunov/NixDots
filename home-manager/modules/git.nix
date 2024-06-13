{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "ArtemiiAkhunov";
    userEmail = "artemii13052003@gmail.com";
  };
  programs.git-credential-oauth = {
    enable = true;
  };
}
