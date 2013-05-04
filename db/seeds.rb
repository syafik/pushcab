[Cab, User].each(&:destroy_all)

p "creating cabs"
(1..5).each do |cab|
  Cab.create!(email: "cab#{cab}@pushcab.com",
                password: "password",
                phone_no: "08180915914#{cab}",
                police_no: "D126#{cab}ER",
                username: "cab#{cab}")
end

p "creating passenger"
(1..5).each do |passenger|
  User.create!(email: "passenger#{passenger}@pushcab.com",
              password: "password",
              phone_no: "12345#{passenger}",
              username: "passenger#{passenger}")
end

#update all passenger confirmation account
User.update_all(:confirmed_at => Time.now)