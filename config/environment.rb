# Load the rails application
require File.expand_path('../application', __FILE__)

config.gem "rmagick",
:lib => "RMagick" 

# Initialize the rails application
Dumpster::Application.initialize!
