if Rails.env.development?

  print 'Seeding commands...'
  Command.find_or_create_by!(name: 'test', message: 'This is test message!')
  Command.find_or_create_by!(name: 'helloworld', message: 'Hello World :big-smile:')
  puts ' Done!'

  print 'Seeding photo keywords...'
  PhotoKeyword.find_or_create_by!(keyword: 'sea')
  PhotoKeyword.find_or_create_by!(keyword: 'rose')
  PhotoKeyword.find_or_create_by!(keyword: 'sky')
  PhotoKeyword.find_or_create_by!(keyword: 'flower')
  PhotoKeyword.find_or_create_by!(keyword: 'mountai')
  PhotoKeyword.find_or_create_by!(keyword: 'universe')
  PhotoKeyword.find_or_create_by!(keyword: 'fashion')
  PhotoKeyword.find_or_create_by!(keyword: 'japan')
  PhotoKeyword.find_or_create_by!(keyword: 'hot')
  PhotoKeyword.find_or_create_by!(keyword: 'art')
  PhotoKeyword.find_or_create_by!(keyword: 'animal')
  puts 'Done'
end
