require 'dummy_helper'
require 'rspec'
require 'abstract_graph'

# below already coded inside the rakefile
=begin
RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = 'documentation'
end
=end

RSpec.configure do |config|
  config.alias_it_should_behave_like_to :it_has_method, 'has method:'
end

