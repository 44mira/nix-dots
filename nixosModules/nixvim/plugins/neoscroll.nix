{
  programs.nixvim.plugins.neoscroll = {
    enable = true;

    settings = {
      hide_cursor = false;
      easing_function = "quadratic";
    };
  };
}
