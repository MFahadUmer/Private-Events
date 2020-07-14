class Event < ApplicationRecord
    belongs_to :user, foreign_key: 'id', class_name: 'User'
end
