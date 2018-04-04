class Suit < ActiveRecord::Base
  attr_accessor :appid, :gender, :description, :size, :status
  
  validates :appid, presence: true, uniqueness: {case_sensitive: false}
  validates :gender, presence: true
  validates :description, presence: true
  validates :size, presence: true
  validates :status, presence: true
    
end
