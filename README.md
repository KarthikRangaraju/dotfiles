1. git clone dotfiles in home directory. 
2. echo "source ~/dotfiles/tmux/.tmux.conf" > ~/.tmux.conf
3. echo "source ~/dotfiles/zsh/.zshrc" > ~/.zshrc
4. echo "source ~/dotfiles/vim/.vimrc" > ~/.vimrc

Install tmux: 
brew install https://raw.githubusercontent.com/Homebrew/brew/2d2034afc6e4dfab0a1c48f5edd2c5478576293b/Formula/tmux.rb
installs an older tmux version which is compatible with tmuxinator


Install oh-my-zsh via curl: sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

To install zsh-autosuggestions plugin 

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

To install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

To make sure tmux buffer gets copied to system clipboard, install: 
sudo apt-get install --assume-yes xclip

Refer: http://www.rushiagr.com/blog/2016/06/16/everything-you-need-to-know-about-tmux-copy-pasting-ubuntu/

Installing powerlevel9k theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

Install the SourceCodePro PowerlineAwesomeRegular font included in this repo into your OS.
Make sure you choose SoureCodePro PowerlineAwesomeRegular font in your terminal.

Note:
brew install reattach-to-user-namespace 
to make sure pbcopy works on MacOS Sierra

IntelliJ & Iterm: Use Menlo font. Size 12. 
To make intellij's IdeaVim use the same vim configuration, do echo "source ~/dotfiles/vim/.vimrc" > ~/.ideavimrc

Install fuzzy finder + setup useful keybindings and fuzzy completions:
brew install fzf
$(brew --prefix)/opt/fzf/install

TODO list:
- Vim select is messed up when inside tmux pane. 
- Vim copy to clipboard directly instead of vim buffer. 
- Tmux setup for ssh-ing to different environments. 
