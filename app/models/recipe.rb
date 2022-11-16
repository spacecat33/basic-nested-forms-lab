class Recipe < ActiveRecord::Base
  has_many :ingredients 
  # accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredients_attributes) #Magic of nested forms
    # the shortcut would expect:
    #  ingredients_attributes = [
    #   {:ingredient_1_name => "Ingredient 1 Name", :ingredient_1_quantity => "Quantity"},
    #   {:ingredient_2_name => "Ingredient 2 Name", :ingredient_2_quantity => "Quantity"}
    # ]

    # but the full method typed up gets this - when used with fields_for rails will generae these:
    # ingredients_attributes = {
    #   0 => {:ingredient_1_name => "Ingredient 1 Name", :ingredient_1_quantity => "Quantity"},
    #   1 => {:ingredient_2_name => "Ingredient 2 Name", :ingredient_2_quantity => "Quantity"}
    # }
    # raise ingredients_attributes.inspect
    ingredients_attributes.each do |i, ingredient_attributes|    #i is the amount of attributes being made and the second one is ingredient attirbutes 
        self.ingredients.build(ingredient_attributes)
    end
  end
end
