## Map hash to any PORO

## Usage

```ruby
class MultiJsonProcessor
  def load(value)
    MultiJson.load(value)
  end
end

mapper = Mapper.create do
  target Entity

  attribute :name

  value\_object :company do
    attribute :name, from: :company_name

    value\_object :markets, type: :array, preprocess: MultiJsonMapper do
      attribute :angellist_id
      attribute :name
    end
  end

  constructor [:name, :company]
end

class Entity
  attr\_reader :name, :company

  def initialize(name, company)
    # ...
  end
end

class Company
  attr\_reader :name, :markets

  def initialize(name, markets)
    # ...
  end
end

mapper.from\_hash(hash)
#=> Entity
```
