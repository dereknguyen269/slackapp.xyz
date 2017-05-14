unless User.find_by(email: 'admin@slack-bot.com').present?
  print 'Seeding Admin...'
  User.create!(email: 'admin@slack-bot.com', password: '123123123')
  puts ' Done'
end
