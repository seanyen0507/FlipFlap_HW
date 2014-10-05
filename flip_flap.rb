require_relative 'tsv_buddy'
require 'yaml'

class FlipFlap
  include TsvBuddy
  #attr_accessor :data

  # Do not create any initializers
  def take_yaml(yml)
    @data = YAML::load(yml)
    @data

  end
  def to_yaml
    @data.to_yaml

  end


end
