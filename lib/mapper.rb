require 'mapper/mapper'

module Mapper
  class MapperDefinition
    def initialize(block)
      @block = block
      @mapper = Mapper.new
    end

    def target(klass)
      @mapper.target_class = klass
    end

    def attribute(name, options)
      @mapper.add_attribute(name, options)
    end

    def constructor(attributes_list)
      @mapper.constructor = attributes_list
    end

    def call
      instance_eval(&@block)
      @mapper
    end
  end

  def self.create(&block)
    MapperDefinition.new(block).call
  end
end
