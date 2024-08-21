{pkgs, ...}: {
  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = pkgs.libfprint-tod.overrideAttrs (previousAttrs: {
        patches = (previousAttrs.patches or []) ++ [
          (pkgs.fetchpatch {
            url = "https://gitlab.freedesktop.org/libfprint/libfprint/-/merge_requests/469.patch";
            sha256 = "sha256-tZ+JPGmX4KiNfxiQu4fj+ve3T3PbIOXZrBqkAEBLfC4";
          })
        ];
      });
    };
  };
}
