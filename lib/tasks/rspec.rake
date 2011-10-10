namespace :spec do
  desc "Run only the fast smoke test suite"
  RSpec::Core::RakeTask.new(:smoke) do |t|
    t.rspec_opts = %w{--tag type:smoke}
  end
  
  desc "Run all specs with rcov"
  RSpec::Core::RakeTask.new(:coverage) do |t|
    t.rcov = true
    t.rcov_opts = %w{--rails --include views -Ispec --exclude gems\/,spec\/,features\/,seeds\/}
    t.spec_opts = ["-c"]
  end
  
  desc "Run all specs with spork"
  RSpec::Core::RakeTask.new(:spork) do |t|
    t.spec_opts = ["--drb"]
  end
end

