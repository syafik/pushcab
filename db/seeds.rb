driver = Driver.new(email: "user1@pushcab.com", phone_no: "081809159141", police_no: "D 1264 ER", username: "user1")
driver.password = "123456"
driver.password_confirmation = "123456"
driver.save!
