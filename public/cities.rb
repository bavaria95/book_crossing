f = File.readlines("cities.dat")
cities = []
f.each { |e| cities<<e.strip  }
p cities