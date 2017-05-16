10.times do |index|
  unless User.find_by(email: "user#{index}@email.com")
    User.create!(email: "user#{index}@email.com", password: '123123123')
  end
end

5.times do |index|
  if ChatRoom.find_by(id: index + 1).nil?
    ChatRoom.create!(name: "ChatRoom#{index+1}")
  end
end

unless Bot.find_by(email: 'bot@email.com')
  Bot.create!(email: "bot@email.com", password: '123123123', user_type: 'bot')
end

puts "Done"
