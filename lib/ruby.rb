require_relative 'common'


# Method to install RVM (Ruby Version Manager)
def install_rvm
    %x{which rvm}
    unless $?.success?
        LOGGER.info "\nInstalling RVM".blue
        autolibs = OSX ? 'homebrew' : 'packages'
        system %Q{curl -L https://get.rvm.io | bash -s stable --autolibs=#{autolibs} --ruby --with-gems="rails"}
        system 'rvm autolibs homebrew' if OSX
    end
end

def uninstall_rvm
    `/usr/bin/sudo rm -rf $HOME/.rvm $HOME/.rvmrc /etc/rvmrc /etc/profile.d/rvm.sh /usr/local/rvm /usr/local/bin/rvm`
    `/usr/bin/sudo /usr/sbin/groupdel rvm`
    LOGGER.info 'RVM is removed. Please check all .bashrc|.bash_profile|.profile|.zshrc for RVM source lines and delete or comment out if this was a Per-User installation.'.blue
end
