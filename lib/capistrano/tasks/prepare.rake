namespace :prepare do

  desc "Coppy files development"
  task :development do
    on roles(:app) do
      execute "cp /var/www/#{fetch(:application)}_#{fetch(:stage)}/application.yml #{current_path}/config/application.yml"
      execute "cp #{current_path}/docker-compose.yml.postgres.development #{current_path}/docker-compose.yml"
      execute "cp #{current_path}/containers/common/development.nginx.config #{current_path}/containers/nginx/nginx.conf"
    end
  end

  desc "clear and npm install"
  task :npm_install do
    on roles(:app) do
      execute "cd #{current_path} && rake tmp:cache:clear"
      execute "cd #{current_path} && rm -rf ./tmp"
      execute "cd #{current_path} && npm install"
    end
  end

  desc "Coppy files staging"
  task :staging do
    on roles(:app) do
      execute "cp /var/www/#{fetch(:application)}_#{fetch(:stage)}/application.yml #{current_path}/config/application.yml"
      execute "cp #{current_path}/docker-compose.yml.postgres.staging #{current_path}/docker-compose.yml"
      execute "cp #{current_path}/containers/common/development.nginx.config #{current_path}/containers/nginx/nginx.conf"
    end
  end
end
