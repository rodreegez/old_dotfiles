require 'rake'
require 'fileutils'

PLUGINS = [
  "https://github.com/janx/vim-rubytest.git",
  "https://github.com/tpope/vim-rails.git",
  "https://github.com/pangloss/vim-javascript.git",
  "https://github.com/tpope/vim-fugitive.git",
  "https://github.com/tpope/vim-endwise.git",
  "https://github.com/kchmck/vim-coffee-script.git",
  "https://github.com/tpope/vim-bundler.git",
  "https://github.com/scrooloose/nerdcommenter.git"
]

DONTCOPY = ["Rakefile", ".git"]

desc "backup old files and install new ones"
task :install do
  Dir['*'].each do |file|
    next if DONTCOPY.include? file
    update_file(file)
  end
end

def existing_file(file)
  File.join(ENV['HOME'], ".#{file}")
end

def update_file(file)
  if File.exist?(existing_file(file))
    puts "backing up #{file}"
    mv existing_file(file), (existing_file(file) + ".old")
  end
  puts "Linking #{file}"
  symlink File.join((%x|pwd|).chomp, file), existing_file(file)
end

namespace "vim" do
  desc "install vim plugins"
  task :install do
    PLUGINS.each do |url|
      name = url.match(/.com\/.+\/(.+)\.git/)[1]
      puts "installing #{name}"
      %x{git submodule add -f #{url} ~/.dotfiles/vim/bundle/#{name}}
    end
  end

  desc "update all vim plugins"
  task :update do
    %x{git submodule foreach git pull}
  end
end
