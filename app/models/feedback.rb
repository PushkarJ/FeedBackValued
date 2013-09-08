class Feedback < ActiveRecord::Base
  attr_accessible :client_id, :contactno, :email, :feed, :name
  belongs_to :customer
end
