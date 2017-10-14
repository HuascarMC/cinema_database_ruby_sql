
class Screenings
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @start_time = options['start_time']
  end

  def save()
    sql = "INSERT INTO screenings (title, start_time)
           VALUES ($1, $2) RETURNING id"
    values = [@title, @start_time]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end
end
