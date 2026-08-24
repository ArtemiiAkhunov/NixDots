{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.ui;
in
{
  options.ui = {
    scale = lib.mkOption {
      type = lib.types.float;
      default = 1.0;
      example = 0.7;
      description = ''
        Interface scale for this machine. Sizes in the WM chrome and in the
        apps configured here are written at their 1.0 value and passed through
        {option}`ui.px`, so lowering this shrinks the whole desktop at once.
        Drop it on small or low-DPI panels, raise it on large or high-DPI ones.
      '';
    };

    browserScale = lib.mkOption {
      type = lib.types.nullOr lib.types.float;
      default = null;
      example = 0.9;
      description = ''
        Firefox's `layout.css.devPixelsPerPx`. Kept separate from
        {option}`ui.scale` because Firefox starts from its own sensible default
        rather than from the sizes in this repo, and because this scales page
        content as well as chrome — so it wants a much gentler factor.

        `null` leaves Firefox unmanaged entirely. Note that 1.0 is *not* the
        same as null: Firefox defaults this pref to -1.0 ("follow the display"),
        so pinning it to 1.0 would disable automatic HiDPI scaling.
      '';
    };

    firefoxPackage = lib.mkOption {
      type = lib.types.package;
      internal = true;
      readOnly = true;
      default =
        if cfg.browserScale == null then
          pkgs.firefox
        else
          pkgs.firefox.override {
            # autoconfig, baked into the wrapper: applies to every profile and
            # touches no profile state, so profiles.ini stays entirely ours.
            # defaultPref (not lockPref) leaves it adjustable in about:config.
            extraPrefs = ''
              defaultPref("layout.css.devPixelsPerPx", "${toString cfg.browserScale}");
            '';
          };
      defaultText = lib.literalExpression "pkgs.firefox, wrapped with ui.browserScale when it is set";
      description = "Firefox with this host's interface scale baked into the wrapper.";
    };

    px = lib.mkOption {
      type = lib.types.functionTo lib.types.int;
      internal = true;
      readOnly = true;
      default = size: builtins.floor (size * cfg.scale + 0.5);
      defaultText = lib.literalExpression "size: round (size * config.ui.scale)";
      description = "Scales a base size by {option}`ui.scale`, rounded to a whole pixel.";
    };
  };
}
