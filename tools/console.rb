require_relative '../config/enviornment.rb'

# Zones
dt = 'Downtown'
sp = 'Seaport / Drydock'
bb = 'Back Bay'

# Clients

# Downtown == dt
rubin = Client.new('Rubin and Rudman','50 Rowes Wharf',dt)
marsh = Client.new('Marsh Moriarty','18 Tremont Street',dt)
goulston = Client.new('Goulston and Storrs','401 Atlantic Ave',dt)
mccarter = Client.new('McCarter and English','265 Franklin Streer',dt)
keegan = Client.new('Keegan Werlin','99 High Street',dt)
sally = Client.new('Sally and Fitch','1 Beacon Street',dt)

# Seaport / Drydock == sp
fideity = Client.new('Fidelity Investments','200 Seaport Blvd',sp)
lawson = Client.new('Lawson and Weitzon','88 Black Falcon Ave',sp)
bernkopf = Client.new('Bernkopf Goodman','2 Seaport Ln',sp)
vertex = Client.new('Vertex Pharmaceuticals','50 Seaprort Blvd',sp)

# Back Bay == bb
bostonprop = Client.new('Boston Properties','800 Boylston Street',bb)
deloitte = Client.new('Deloitte','200 Berkley St',bb)


# Couriers
misshell = Courier.new('Miss Hell',Time.new(1989,01,16),2013)

# Jobs
keegan.delivery_request('101 Federal St','copy box','standar')
keegan.delivery_request('1 Federal St','envelope','standard')
keegan.delivery_request('1 South Station','5 copy boxes','standard')
keegan.delivery_request('2 Seaport Ln','flat','rush')
vertex.delivery_request('Post Office','mail tub','standard')
lawson.delivery_request('800 Boylston St','envelope','standard')

binding.pry

puts 'Exiting...'
