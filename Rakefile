require 'rake'
require 'erb'
require 'psych'
$LOAD_PATH << '.'
Dir['lib/*.rb'].each { |lib| require lib }

# Shorthand for darwin platform
OSX = RUBY_PLATFORM.downcase.include?('darwin')

task :default => :install
task :install => ['install:all']

namespace :install do

  task :node do
    install_node
  end

  task :homebrew do
    install_homebrew
  end

  task :rvm do
    install_rvm
  end

  task :all => %w(
    homebrew
    node
    rvm
  ) do
  end



end






def install_homebrew
    require 'English'
  rval = `pkgutil --pkg-info=com.apple.pkg.CLTools_Executables`
  if rval.include?('does not exist')
    system 'xcode-select --install'
    #system 'sudo xcodebuild -license'
  end
  `which brew`
  unless $CHILD_STATUS.success?
    LOGGER.info "\n======================================================".blue
    LOGGER.info "Installing Homebrew, the OSX package manager...If it's".blue
    LOGGER.info "already installed, this will do nothing.".blue
    LOGGER.info "======================================================".blue
    system 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  end
end

def install_node
  LOGGER.info "\nInstall node, npm, nvm".blue
  install_nvm
  # Needs a shell refresh here
  system %(zsh -lc 'nvm install node --reinstall-packages-from=node')
  system %(zsh -lc 'nvm alias default node; nvm use default')
  system %(zsh -lc 'curl https://npmjs.org/install.sh | sh')
  install_node_packages
end

def install_node_packages
  packages = Psych.load_file('Nodefile')
  local = packages['local'] || []
  global = packages['global'] || []
  system %(npm install -g #{global.join(' ')}) unless global.empty?
  system %(npm install #{local.join(' ')}) unless local.empty?
end

def install_nvm
  nvm_dir = File.join(ENV['HOME'], '.nvm')
  if File.exist?(nvm_dir)
    LOGGER.info "=> NVM is already installed in #{nvm_dir}, trying to update".blue
    system %(cd #{nvm_dir} && git fetch origin)
  else
    system %(git clone https://github.com/creationix/nvm.git #{nvm_dir})
  end
  system %(cd #{nvm_dir} && git checkout `git describe --abbrev=0 --tags` && . #{nvm_dir}/nvm.sh)
end
