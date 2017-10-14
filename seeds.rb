require_relative('./models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')
require_relative('models/screenings')
require('pry-byebug')

customer1 = Customer.new({'name' => 'Andre', 'funds' => '1000'})
customer1.save()
customer2 = Customer.new({'name' => 'Miguel', 'funds' => '700'})
customer2.save()


film1 = Film.new({'title' => 'Guardians of the Galaxy', 'price' => '200', 'start_time' => '20:00'})
film1.save()
film2 = Film.new({'title' => 'Ex-machina', 'price' => '210', 'start_time' => '21:30'})
film2.save()


ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save()

screenings1 = Screenings.new({'title' => film1.title, 'start_time' => film1.start_time })
screenings1.save()
screenings2 = Screenings.new({'title' => film2.title, 'start_time' => film2.start_time })
screenings2.save()

binding.pry
nil
