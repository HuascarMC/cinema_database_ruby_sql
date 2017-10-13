

class Ticket
  def initialize(options)
    @user_id = options['user_id'].to_i
    @customer_id = options['customer_id'].to_i
  end
end
