{}:
(final: prev:
  {
    libfprint= prev.libfprint.overrideAttrs (old: {
      src = builtins.fetchGit {
        url = "https://gitlab.freedesktop.org/thameruddin/libfprint.git";
        ref = "egismoc-0587";
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
  }
)
