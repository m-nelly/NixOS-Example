{ lib, config, pkgs, inputs, ... }:
let 
  cfg = config.homeManager;
in
{
  imports = [ inputs.home-manager.nixosModules.default ];

  options.homeManager = {
    userName = lib.mkOption {
      type = lib.types.str;
	  default = "mnelly";
	  description = "username";
    };
	
	gitUser = lib.mkOption {
	  type = lib.types.str;
	  default = "m-nelly";
	  description = "git username";
	};

	gitEmail = lib.mkOption {
	  type = lib.types.str;
	  default = "mnelly.sec@gmail.com";
	  description = "git email";
	};
  };

  config = {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = "hunter2";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.zsh;
    };
	
	programs.zsh.enable = true;

    home-manager = {
      useGlobalPkgs = true;
      users.${cfg.userName} = {
        home.file = {
          ".zshrc".source = ../dotfiles/zshrc;
        };
        
		programs.zsh.enable = true;
		
		programs.git = {
		  enable = true;
		  userName = "${cfg.gitUser}";
		  userEmail = "${cfg.gitEmail}";
		};

        programs.neovim = {
          enable = true;
          plugins = with pkgs.vimPlugins; [ gruvbox nvim-treesitter ];
          extraConfig = builtins.concatStringsSep "\n" [ (lib.strings.fileContents ../dotfiles/init.vim) ];
        };
		
		home.packages = with pkgs; [
		  bat btop eza file fzf neofetch ripgrep toybox tmux
		  zsh-autosuggestions
		  zsh-fzf-history-search
		  zsh-fzf-tab
		  zsh-syntax-highlighting	
		];

        home.sessionVariables = { EDITOR = "nvim"; };
        home.stateVersion = "23.11";
      };
    };
  };
}
