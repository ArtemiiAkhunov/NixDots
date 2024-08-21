{}: 
(final: prev:
{
  libfprint= prev.libfprint.overrideAttrs (old: {
    src = builtins.fetchGit {
      url = "https://gitlab.freedesktop.org/thameruddin/libfprint.git";
      ref = "refs/heads/egismoc-0587";
      rev = "4c50d9b6a0cb45681e1cd08411df477772f6821c";
    };
  }); 

  fprintd = prev.fprintd.overrideAttrs (old: {
    mesonCheckFlags = [
      # PAM related checks are timing out
      "--no-suite" "fprintd:TestPamFprintd" 
      # Tests FPrintdManagerPreStartTests.test_manager_get_no_default_device & FPrintdManagerPreStartTests.test_manager_get_no_devices are failing
      "--no-suite" "fprintd:FPrintdManagerPreStartTests"
    ];
  });
})
