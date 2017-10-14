require_relative('../db/sqlrunner.rb')

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    results = SqlRunner.run(sql, values)
    customers = results.map {|customer| Customer.new(customer)}
    return customers
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [name, funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets
          ON tickets.film_id = films.id WHERE customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    films = results.map {|film| Film.new(film)}
    return films
  end

  def buy_ticket(title)
    sql = "SELECT films.price FROM films INNER JOIN tickets
          ON tickets.film_id = films.id WHERE films.title = $1"
    values = [title]
    price = (SqlRunner.run(sql, values)[0]["price"]).to_i
    @funds -= price
  end
end
