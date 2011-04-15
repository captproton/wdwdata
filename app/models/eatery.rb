class Eatery < ActiveRecord::Base
  validates_presence_of :permalink
  validates_presence_of :name
  validates_uniqueness_of :permalink
end
