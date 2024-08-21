{pkgs, ...}: {
  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = pkgs.libfprint-tod.overrideAttrs (previousAttrs: {
        patches = (previousAttrs.patches or []) ++ [
          (pkgs.fetchpatch {
            url = "https://gitlab.freedesktop.org/libfprint/libfprint/-/merge_requests/469.patch";
            hash = "";
          })
        ];
      });
    };
  };
}
