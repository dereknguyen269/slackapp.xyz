namespace :prepare do

  desc "Coppy files"
  task :files do
    on roles(:app) do
      execute "cp /var/www/#{fetch(:application)}_#{fetch(:stage)}/application.yml #{current_path}/config/application.yml"
      execute "cp #{current_path}/docker-compose.yml.postgres.development #{current_path}/docker-compose.yml"
    end
  end
end
