class Customer < ActiveRecord::Base
  has_many :feedback
  attr_accessible :name
  validates :name, presence: true
end
