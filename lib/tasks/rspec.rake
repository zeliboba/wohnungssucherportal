namespace :spec do
  RSpec::Core::RakeTask.new(:smoke) do |t|
    t.rspec_opts = %w{--tag type:smoke}
  end
end

desc "Run all specs with rcov"
RSpec::Core::RakeTask.new("spec:coverage") do |t|
  t.rcov = true
  t.rcov_opts = %w{--rails --include views -Ispec --exclude gems\/,spec\/,features\/,seeds\/}
  t.spec_opts = ["-c"]
end