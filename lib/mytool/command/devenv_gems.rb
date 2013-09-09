require "thor"
require "fileutils"

module Mytool

  class DevenvGems < Thor
    include Thor::Actions
    namespace :gems

    desc 'install', "set up zsh"
    def install
      dir = File.join(ENV['HOME'], '.devenv_gems')
      if File.exist? dir
        say "devenv_gems is already exist! update...", :yellow
        invoke 'gems:update'
        return
      end

      if system("git clone git@github.com:n-sakuma/devtools_by_ruby.git ~/.devenv_gems")
        say "devenv gems: clone success!", :cyan, :bold
        system("bundle")
      else
        say "faild!", :red
      end
    end

    desc 'update', 'update setting'
    def update
      dir = File.join(ENV['HOME'], '.devenv_gems')
      unless File.exist? dir
        say "devenv_gems is not exist! install...", :yellow
        # say "devenv_gems setting update failed", :red
        invoke 'gems:install'
        return
      end
      FileUtils.chdir(dir) do
        git_status = `git status -s`
        if git_status.empty?
          system("git pull")
          system("bundle")
          say "devenv_gems: update success!", :cyan
        else
          say "devenv_gems is not clean", :yellow
          puts git_status
        end
      end
    end
  end

end
