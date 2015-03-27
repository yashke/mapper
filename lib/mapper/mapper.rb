require 'mapper/attribute'

module Mapper
  class Mapper
    attr_writer :target_class, :constructor

    def initialize
      @constructor = []
      @target_klass = nil
      @attributes = []
    end

    def add_attribute(name, options)
      @attributes << Attribute.new(name, options)
    end

    def from_hash(hash)
      params = @constructor.map do |attribute_name|
        attribute = @attributes.find{|x| x.name == attribute_name}
        if attribute.nil?
          hash[attribute_name]
        else
          hash[attribute.hash_key]
        end
      end

      @target_class.new(*params)
    end
  end

end
