{
  lib,
  config,
  systemSettings,
  ...
}:
{

  programs.git.settings = {
    user = {
      name = "Kevin Stone";
      email = "kevinastone@gmail.com";
    };
    color = {
      ui = true;
      # prompt = false;
    };
    core = {
      quotepath = false;
    };
    difftool = {
      prompt = false;
    };
    mergetool = {
      keepBackup = true;
      prompt = false;
    };
    alias = {
      ignored = "ls-files --others -i --exclude-standard";
      # Log Aliases
      ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%an]\" --decorate";
      ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%an]\" --decorate --numstat";
      lds = "log --pretty=format:\"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%an]\" --decorate --date=short";
      ld = "log --pretty=format:\"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%an]\" --decorate --date=relative";
      lgv = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --numstat";

      # Shortcuts
      co = "checkout";
      ci = "commit";
      st = "status -sb";
      r = "reset";
      r1 = "reset HEAD^";

      # Unadd
      unadd = "reset HEAD";

      # History
      diverges = "!sh -c 'git rev-list --boundary $1...$2 | grep ^- | cut -c2-'";

      # Force Push
      fpush = "push --force-with-lease";

      # Branch Age
      # ages = "!sh -c 'for k in `git branch -r`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort'";
    };
    init.defaultBranch = "main";
    push = {
      autoSetupRemote = true;
      default = "upstream";
      followTags = true;
    };
  };

  programs.git.ignores = [ ".DS_Store" ];
}
