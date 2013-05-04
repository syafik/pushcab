[Driver, User].each(&:destroy_all)

p "creating drivers"
(1..5).each do |driver|
  Driver.create!(email: "driver#{driver}@pushcab.com",
                password: "password",
                phone_no: "08180915914#{driver}",
                police_no: "D126#{driver}ER",
                username: "user#{driver}")
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