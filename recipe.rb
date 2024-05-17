########################################################
# 1. Primeiro passo do MVC, model
########################################################

class Recipe
  attr_reader :name, :description

  # Recipe.new(name, description)

  def initialize(name, description)
    @name = name
    @description = description
  end
end
