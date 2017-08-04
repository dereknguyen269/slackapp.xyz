namespace :docker do

  desc "Export ENV"
  task :export_env  do
    on roles(:app) do
      execute "cd #{current_path} && export DATABASE_URL=#{ENV['DATABASE_URL']}"
      execute "cd #{current_path} && export DATABASE_REMOTE=true"
      execute "cd #{current_path} && export ENABLED_BOT=true"
    end
  end

  desc "docker-compose build --no-cache"
  task :build do
    on roles(:app) do
      execute "cd #{current_path} && docker-compose build --force-rm "
    end
  end

  desc "Docker create volums"
  task :create_volums do
    on roles(:app) do
      execute "docker volume create --name=data_volume && docker volume create --name=public_data_volume"
    end
  end

  desc "docker-compose up -d --force-recreate"
  task :up do
    on roles(:web) do
      execute "cd #{current_path} && docker-compose up -d"
    end
  end

  desc "docker-compose stop"
  task :stop do
    on roles(:web) do
      execute "cd #{current_path} && docker-compose stop"
    end
  end

  desc "Review running containners"
  task :review do
    on roles(:app) do
      execute "cd #{current_path} docker ps"
    end
  end

  desc "Setup Database"
  task :setup_db do
    on roles(:app) do
      execute "cd #{current_path} && docker-compose run app rake db:create db:migrate db:seed"
    end
  end

  desc "Run assets:precompile"
  task :assets do
    on roles(:app) do
      execute "cd #{current_path} && docker-compose run app rake assets:clean"
      # execute "cd #{current_path} && docker-compose run app node --max-old-space-size=8192 $(which npm) install --unsafe-perm"
      execute "cd #{current_path} && docker-compose run app rake assets:precompile"
    end
  end

  desc "Reset Database"
  task :reset_db do
    on roles(:app) do
      execute "cd #{current_path} && docker-compose run app rake db:drop db:create db:migrate db:seed"
    end
  end

  desc "Rebuild containners"
  task :rebuild do
    on roles(:app) do
      execute "cd #{current_path} && docker-compose stop && docker-compose rm --force && docker-compose build"
    end
  end

  # Danger
  desc "Destroy all containners and images"
  task :destroy do
    on roles(:app) do
      execute "docker stop $(docker ps -a -q)"
      execute "docker rm $(docker ps -a -q)"
      execute "docker rmi -f $(docker images -q)"
    end
  end

end
