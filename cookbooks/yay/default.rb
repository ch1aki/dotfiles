# https://github.com/k0kubun/dotfiles/blob/master/cookbooks/yaourt/default.rb
define :yay do
  name = params[:name].shellescape
  execute "yay -S --noconfirm #{name}" do
    not_if "yay -Q #{name} || yay -Qg #{name}"
    if ENV['SUDO_USER']
      user ENV['SUDO_USER']
    end
  end
end
