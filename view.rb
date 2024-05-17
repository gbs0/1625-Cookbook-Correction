########################################################
# 2. Segundo passo do MVC, a View
########################################################
class View
  def display_list(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_user_for(stuff) # "Name"|| "Description"
    puts "What is the Recipe #{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end

  def ask_user_for_index
    puts "Index?"
    print "> "
    return gets.chomp.to_i - 1
  end
end
