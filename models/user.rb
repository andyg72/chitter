require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true, message: 'This email already has an account'
  property :name, String
  property :username, String, unique: true, message: 'This username already has an account'
  property :password_digest, Text

  has n, :peeps
  has n, :replies #, through :peep

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end