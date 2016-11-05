class Command < ActiveRecord::Base
  scoped_search on: [:name]
end
