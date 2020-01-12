directory "#{ENV['HOME']}/bin" do
  owner node[:user]
end

include_cookbook 'functions'
include_cookbook 'symboliclinks'
include_cookbook 'git'
include_cookbook 'fzf'
include_cookbook 'vim'
include_cookbook 'terraform'
include_cookbook 'ghq'

include_cookbook 'ruby'
include_cookbook 'golang'
include_cookbook 'python'

ln '.bash_profile'

include_cookbook 'tmux'
include_cookbook 'fish'
