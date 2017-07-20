namespace :docker do

  desc "docker-compose build"
  task :build do
    on roles(:app) do
      execute "docker-compose build"
    end
  end

  desc "docker-compose up -t"
  task :up do
    on roles(:app) do
      execute "docker-compose up"
    end
  end

  desc "Review running containners"
  task :review do
    on roles(:app) do
      execute "sudo docker ps"
    end
  end

  desc "Setup Database"
  task :setup_db do
    on roles(:app) do
      execute "docker-compose run app rake db:create"
      execute "docker-compose run app rake db:migrate"
      execute "docker-compose run app rake db:seed"
    end
  end

  desc "Reset Database"
  task :reset_db do
    on roles(:app) do
      execute "docker-compose run app rake db:drop"
      execute "docker-compose run app rake db:create"
      execute "docker-compose run app rake db:migrate"
      execute "docker-compose run app rake db:seed"
    end
  end

  desc "Rebuild containners"
  task :rebuild do
    on roles(:app) do
      execute "docker-compose stop"
      execute "docker-compose rm -v"
      execute "docker-compose build"
      execute "docker-compose up"
    end
  end

end
