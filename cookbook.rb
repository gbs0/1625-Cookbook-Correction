########################################################
# 2,5. Nosso "banco de dados", responsavel por manipular a variavel @recipes que é a memoria do app
########################################################
require 'csv'

class Cookbook

  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  # Adicionar elementos na array
  def create(recipe)
    @recipes.push(recipe)
    save_csv
  end

  # Retornar a propria array (quais são os valores)
  def all
    return @recipes
  end

  # Remover elementos da Array
  def destroy(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      # 1. Separar a array que representa a linha do CSV
      name = row[0]
      description = row[1]
      # 2. Criar uma instancia de receita
      recipe = Recipe.new(name, description)
      # 3. Adicionar a receita ao array
      @recipes.push(recipe)
    end
  end

  def save_csv
    # 1. Primeiro, precisamos abrir o arquivo csv com a opção de 'wb' -> write binary (escreve o arquivo do zero)
    CSV.open(@csv_file, 'wb') do |line|
      # 2. Vamos iterar por cada registro do CSV, passando por cada instância em memória da variável @recipes
      @recipes.each do |recipe|
        register = [recipe.name, recipe.description]
        line << register
      end
    end
  end

end
