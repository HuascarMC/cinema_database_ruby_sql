

class Film
  def initialize(options)
    @title = options['name']
    @price = options['price'].to_i
  end

end
