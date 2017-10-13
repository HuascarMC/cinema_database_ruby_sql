require_relative('./models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')
require('pry-byebug')

customer1 = Customer.new({'name' => 'Andre', 'funds' => '1000'})
customer1.save()
customer2 = Customer.new({'name' => 'Miguel', 'funds' => '700'})
customer2.save()


film1 = Film.new({'title' => 'Guardians of the Galaxy', 'price' => '200'})
film1.save()
film2 = Film.new({'title' => 'Ex-machina', 'price' => '210'})
film2.save()


ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save()


binding.pry
nil
