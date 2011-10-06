# When you generate a scaffold, Rails will create a matching helper file. 
# If you're using decorators, this is probably unnecessary. 
Wohnungssucherportal::Application.config.generators do |g|
  g.helper false
  g.orm :decorator, :invoke_after_finished => "active_record:model"
end