

class Ticket
  def initialize(options)
    @id = options('id').to_i if options['id']
    @user_id = options['user_id'].to_i
    @customer_id = options['customer_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (user_id, customer_id) VALUES ($1, $2)"
    values = [@user_id, @customer_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i

  end
end
