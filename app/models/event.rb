class Event < ApplicationRecord
  validates :title, presence: true
  validates :start_time, presence: true
end
