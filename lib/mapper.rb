module Mapper
  class Mapper
    attr_writer :target_class, :constructor

    def initialize
      @constructor = []
      @target_klass = nil
    end

    def from_hash(hash)
      params = @constructor.map do |attribute_name|
        hash[attribute_name]
      end

      @target_class.new(*params)
    end
  end

  class MapperDefinition
    def initialize(block)
      @block = block
      @mapper = Mapper.new
    end

    def target(klass)
      @mapper.target_class = klass
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
