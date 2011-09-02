namespace :spec do
  RSpec::Core::RakeTask.new(:smoke) do |t|
    t.rspec_opts = %w{--tag type:smoke}
  end
end