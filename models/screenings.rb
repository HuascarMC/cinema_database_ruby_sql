require_relative('../db/sqlrunner.rb')

class Screenings
  attr_reader :id
  attr_accessor :title, :start_time, :available_tickets
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @start_time = options['start_time']
    @available_tickets = options['available_tickets'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (title, start_time, available_tickets)
           VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @start_time, @available_tickets]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def availability()
    sql = "SELECT * FROM screenings WHERE id = $1"
    values = [@id]
    (SqlRunner.run(sql, values)[0]['available_tickets'].to_i)
  end
end
