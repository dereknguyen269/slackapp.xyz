unless User.find_by(email: 'quannguyen@bestcoder.info').present?
  print 'Seeding Admin...'
  User.create!(email: 'quannguyen@bestcoder.info', password: '123123123')
  puts ' Done'
end
