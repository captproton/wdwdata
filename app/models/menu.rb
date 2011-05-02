class Menu < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :eatery
end
