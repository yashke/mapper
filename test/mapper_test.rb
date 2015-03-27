require 'minitest/autorun'
require 'mapper'

class SimpleObject
  attr_reader :name, :count

  def initialize(name, count)
    @name = name
    @count = count
  end
end

class MapperTest < Minitest::Test
  def test_mapping_simple_attributes
    mapper = Mapper.create do
      target SimpleObject

      constructor [:name, :count]
    end

    hash = {
      name: "John Doe",
      count: 5
    }

    object = mapper.from_hash(hash)
    assert_kind_of(SimpleObject, object)
  end
end
