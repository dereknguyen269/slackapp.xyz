module Rails
  class Application
    class Configuration < ::Rails::Engine::Configuration

      def database_configuration
        path = paths["config/database"].existent.first
        yaml = Pathname.new(path) if path

        # Customize database config (Should only development mode)
        # Delete ENV['DATABASE_URL'] first
        ENV.delete('DATABASE_URL')

        config = if yaml && yaml.exist?
          require "yaml"
          require "erb"
          YAML.load(ERB.new(yaml.read).result) || {}
        elsif ENV['DATABASE_URL']
          # Value from ENV['DATABASE_URL'] is set to default database connection
          # by Active Record.
          {}
        else
          raise "Could not load database configuration. No such file - #{paths["config/database"].instance_variable_get(:@paths)}"
        end

        # Customize database config (Should only development mode)
        default_development = config['development']
        database_remote = ENV['DATABASE_REMOTE'] || 'false'
        if database_remote == 'true' || database_remote == true
          STDERR.puts "Use DATABASE_URL"
          require "yaml"
          application_yml = YAML::load_file(File.join(__dir__, 'application.yml'))
          puts "-------DATABASE_URL---------"
          if application_yml && application_yml['DATABASE_URL']
            ENV['DATABASE_URL'] = application_yml['DATABASE_URL']
            puts application_yml['DATABASE_URL']
            opts = {
              'url' => application_yml['DATABASE_URL']
            }
            config['development'] = default_development.merge(opts)
          else
            raise 'Please put DATABASE_URL with remote database url at config/application.yml. '
          end
        else
          STDERR.puts "Don't use DATABASE_URL"
          opts = {
            'database' => "#{ENV['DATABASE_NAME'] || 'db_name'}_development"
          }
          default_development.delete('url') if default_development.has_key?('url')
          default_development.delete('username') if default_development.has_key?('username')
          default_development.delete('password') if default_development.has_key?('password')
          config['development'] = default_development.merge(opts)
        end

        default_test = config['test']
        default_test.delete('url') if default_test.has_key?('url')
        default_test.delete('username') if default_test.has_key?('username')
        default_test.delete('password') if default_test.has_key?('password')
        opts = {
          'database' => "#{ENV['DATABASE_NAME'] || 'db_name'}_test"
        }
        config['test'] = default_test.merge(opts)

        puts "----DEVVELOPMENT DBCONFIG-------"
        puts config['development'].inspect
        puts "----TEST DBCONFIG-------"
        puts config['test'].inspect
        puts "----DBCONFIG-------"
        config
      rescue Psych::SyntaxError => e
        raise "YAML syntax error occurred while parsing #{paths["config/database"].first}. " \
              "Please note that YAML must be consistently indented using spaces. Tabs are not allowed. " \
              "Error: #{e.message}"
      rescue => e
        raise e, "Cannot load `Rails.application.database_configuration`:\n#{e.message}", e.backtrace
      end

    end
  end
end
