include_cookbook 'symboliclinks'
include_cookbook 'yay'
include_cookbook 'git'
include_cookbook 'vim'
include_cookbook 'fzf'

if ask 'install Ruby'
  include_cookbook 'ruby'
end

if ask 'install Golang'
  include_cookbook 'golang'
end

if ask 'install Python'
  include_cookbook 'python'
end

include_cookbook 'tmux'
include_cookbook 'fish'
include_cookbook 'alacritty'

yay 'ttf-cica' do
  action :install
end
