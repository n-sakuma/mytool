require "thor"

module Mytool

  class Vim < Thor
    include Thor::Actions
    namespace :vim

    desc 'install', "set up vim"
    def install
      if File.directory? File.join(ENV['HOME'], '.vim')
        say "Vim confif is already exist!", :yellow
      else
        if system("git clone git@github.com:n-sakuma/dot.vim.git ~/.vim")
          say "clone success!", :cyan, :bold
        else
          say "faild!", :red
        end
      end
    end

  end

end
