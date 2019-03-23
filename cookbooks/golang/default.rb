case node[:platform]
when 'darwin'
  package 'go'
when 'ubuntu'
  # `golang-go` package installs TOO OLD version of go.
  # So following `package` is commented out.
  package 'golang-go'
when 'arch'
  package 'go'
end

# Make directory for golang
directory "#{ENV['HOME']}/go/src/github.com/ch1aki" do
  action :create
  not_if "test -d #{ENV['HOME']}/go/src/github.com/ch1aki"
end

# Install and make directory for ghq
execute "go get ghq" do
  command "go get github.com/motemen/ghq"
  not_if "test -d #{ENV['HOME']}/go/src/github.com/motemen/ghq"
end

directory "#{ENV['HOME']}/ghq/github.com/ch1aki" do
  action :create
  not_if "test -d #{ENV['HOME']}/ghq/github.com/ch1aki"
end

execute "go get hub" do
  command "go get github.com/github/hub"
  not_if "test -d #{ENV['HOME']}/go/src/github.com/github/hub"
end

if node[:platform] == 'arch'
  include_cookbook 'yaourt'
  yaourt 'peco'
else
  package 'peco'
end
ln '.peco'
