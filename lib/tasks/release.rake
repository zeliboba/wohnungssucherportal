task :release => [:spec] do
  `git push && cap deploy:migrations`
end
