namespace :tmp do
  task :clear_additional do
    rm_r "coverage" rescue nil
    rm_r "tmp/capybara" rescue nil
  end
  # append the above to orig. rails task
  task "clear" => 'clear_additional'
end