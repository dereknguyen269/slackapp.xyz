if Rails.env.development?
  print 'Seeding super admin...'
  user = User.find_or_create_by!(email: 'quannguyen@bestcoder.info') do |u|
    u.password = 123123123
  end
  user.sadmin!
  puts ' Done!'
end
