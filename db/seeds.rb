10.times do |index|
  User.create!(email: "user#{index}@email.com", password: '123123123')
end
