class Album < ApplicationRecord
  validates :artist, presence: true
  validates :album, presence: true
  validates :title, presence: true
  validates :year, presence: true
  validates :record_condition, presence: true
end