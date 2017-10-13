

class Film
  attr_reader :id
  attr_accessor :title, :price
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    results = SqlRunner.run(sql, values)
    films = results.map {|result| Film.new(result)}
    return films
  end

  def self.update

  end
end
