module Mapper
  class Attribute
    attr_reader :name

    def initialize(name, options)
      @name = name
      @options = options
    end

    def hash_key
      if @options.has_key?(:from)
        @options[:from]
      else
        @name
      end
    end
  end
end
