env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './models/user'

DataMapper.finalize

DataMapper.auto_upgrade!