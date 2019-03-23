git "clone fzf" do
  repository "https://github.com/junegunn/fzf.git"
  destination "#{ENV['HOME']}/.fzf"
end

execute 'install fzf' do
  command "#{ENV['HOME']}/.fzf/install --all"
end
