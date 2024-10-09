{outputs, inputs}: {
  modifications = final: prev: {
    libfprint= prev.libfprint.overrideAttrs (old: {
      src = builtins.fetchGit {
        url = "https://gitlab.freedesktop.org/libfprint/libfprint";
        ref = "refs/heads/master";
        rev = "e57bab2f1ef3583158d2e6e2b5bb4182629ebe35";
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
  };
}
