class MenuItem < ActiveRecord::Base
  belongs_to :menu
  belongs_to :food
  
  def food_name
    food.name if food
  end
  
  def food_name=(name)
    self.food = Food.find_or_create_by_name(name) unless name.blank?
  end
end
