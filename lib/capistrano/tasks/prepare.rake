namespace :prepare do

  desc "Coppy files"
  task :files do
    on roles(:app) do
      execute "cp ../common/application.yml config/application.yml"
      execute "cp docker-compose.yml.postgres.development docker-compose.yml"
    end
  end
end
