task :release => [:spec] do
  sh "git push && cap deploy:migrations"
end
