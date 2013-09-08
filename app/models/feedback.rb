class Feedback < ActiveRecord::Base
  attr_accessible :customer_id, :contactno, :email, :feed, :name
  belongs_to :customer
end
