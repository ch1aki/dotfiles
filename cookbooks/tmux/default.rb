package 'tmux'

case node[:platform]
when 'darwin'
  package 'reattach-to-user-namespace'
when 'ubuntu', 'arch'
  package 'xsel'
end

ln '.tmux.conf'

git "#{ENV['HOME']}/.tmux/plugins/tpm" do
  repository 'https://github.com/tmux-plugins/tpm.git'
end