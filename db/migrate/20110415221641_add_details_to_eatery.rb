class AddDetailsToEatery < ActiveRecord::Migration
  def self.up
    add_column :eateries, :when_to_go, :string
    add_column :eateries, :child_lunch_menu_url, :string
    add_column :eateries, :adult_dinner_menu_url, :string
    add_column :eateries, :wine_list, :string
    add_column :eateries, :dinner_hours, :string
    add_column :eateries, :child_breakfast_menu_url, :string
    add_column :eateries, :breakfast_hours, :string
    add_column :eateries, :adult_breakfast_menu_url, :string
    add_column :eateries, :requires_pre_payment, :string
    add_column :eateries, :dress, :string
    add_column :eateries, :overall_rating, :string
    add_column :eateries, :counter_quality_rating, :string
    add_column :eateries, :awards, :string
    add_column :eateries, :requires_credit_card, :string
    add_column :eateries, :category_code, :string
    add_column :eateries, :phone_number, :string
    add_column :eateries, :parking, :string
    add_column :eateries, :lunch_hours, :string
    add_column :eateries, :counter_value_rating, :string
    add_column :eateries, :child_dinner_menu_url, :string
    add_column :eateries, :cuisine, :string
    add_column :eateries, :bar, :string
    add_column :eateries, :thumbs_up, :string
    add_column :eateries, :table_quality_rating, :string
    add_column :eateries, :service_rating, :string
    add_column :eateries, :house_specialties, :string
    add_column :eateries, :extinct_on, :string
    add_column :eateries, :entree_range, :string
    add_column :eateries, :cost_code, :string
    add_column :eateries, :adult_lunch_menu_url, :string
    add_column :eateries, :table_value_rating, :string
    add_column :eateries, :opened_on, :string
    add_column :eateries, :friendliness_rating, :string
  end

  def self.down
    remove_column :eateries, :when_to_go
    remove_column :eateries, :child_lunch_menu_url
    remove_column :eateries, :adult_dinner_menu_url
    remove_column :eateries, :wine_list
    remove_column :eateries, :dinner_hours
    remove_column :eateries, :child_breakfast_menu_url
    remove_column :eateries, :breakfast_hours
    remove_column :eateries, :adult_breakfast_menu_url
    remove_column :eateries, :requires_pre_payment
    remove_column :eateries, :dress
    remove_column :eateries, :overall_rating
    remove_column :eateries, :counter_quality_rating
    remove_column :eateries, :awards
    remove_column :eateries, :requires_credit_card
    remove_column :eateries, :category_code
    remove_column :eateries, :phone_number
    remove_column :eateries, :parking
    remove_column :eateries, :lunch_hours
    remove_column :eateries, :counter_value_rating
    remove_column :eateries, :child_dinner_menu_url
    remove_column :eateries, :cuisine
    remove_column :eateries, :bar
    remove_column :eateries, :thumbs_up
    remove_column :eateries, :table_quality_rating
    remove_column :eateries, :service_rating
    remove_column :eateries, :house_specialties
    remove_column :eateries, :extinct_on
    remove_column :eateries, :entree_range
    remove_column :eateries, :cost_code
    remove_column :eateries, :adult_lunch_menu_url
    remove_column :eateries, :table_value_rating
    remove_column :eateries, :opened_on
    remove_column :eateries, :friendliness_rating
  end
end
