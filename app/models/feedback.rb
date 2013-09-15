class Feedback < ActiveRecord::Base
  attr_accessible :customer_id, :contactno, :email, :feed, :name
  validates :feed, presence:true
  belongs_to :customer
end
