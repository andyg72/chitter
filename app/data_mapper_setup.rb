env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './models/user'
require './models/peep'
require './models/response'

DataMapper.finalize

DataMapper.auto_upgrade!
