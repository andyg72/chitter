class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep_text, Text
  property :peep_timestamp, Time

  belongs_to :user
  has n, :replies

end