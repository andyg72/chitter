class Reply

  include DataMapper::Resource

  property :id, Serial
  property :reply_text, Text
  property :reply_timestamp, Time

  belongs_to :peep
  belongs_to :user

end