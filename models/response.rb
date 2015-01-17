class Response

  include DataMapper::Resource

  property :id, Serial
  property :response_text, Text
  property :response_timestamp, Time

  belongs_to :peep

end