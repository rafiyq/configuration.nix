{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "rafiyq";
  home.homeDirectory = "/home/rafiyq";
  
  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.aria
    pkgs.bat
    pkgs.neovim
    pkgs.mpv
    pkgs.tmux
    pkgs.yt-dlp
    
    # Fonts
    pkgs.roboto-mono
    pkgs.fira-code
    pkgs.jetbrains-mono
  ];
  
  # Raw configuration files (didn't work!)
  #home.file.".tmux.conf".source = ./tmux.conf;
  #home.file.true.recursive.".config/nvim".source = ./raw/editor/nvim;
  #xdg.configFile."nvim".source= ./raw/editor/nvim;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  programs.git = {
    enable = true;
    userName = "rafiyq";
    userEmail = "rafiyq@protonmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  
  programs.helix = {
    enable = true;
    settings =
    {
      theme = "solarized_dark";
      editor.cursor-shape.insert = "bar";
      keys.insert = {
        j.k = "normal_mode";
      };
    };
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    history.path = "$ZDOTDIR/.zsh_history";
    localVariables = { 
      DEFAULT_USER = "rafiyq";
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=23";
      AUTOSUGGESTION_HIGHLIGHT_COLOR = "fg=23";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "history"];
      theme = "agnoster";
    };

    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
    ];
  };
}
