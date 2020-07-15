class User < ApplicationRecord
  has_many :creator_events, class_name: 'Event', foreign_key: 'creator_id'
end
