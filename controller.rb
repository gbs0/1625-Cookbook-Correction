########################################################
# 3. Terceira parte, o nosso "Back-end" da aplicação
########################################################

require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  # CRUD - As acões performadas pelo Usuário

  # Create: Adiciona uma nova receita
  def add
    # 1. Pedir ao user, as infos da receita
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("description")
    # 2. Criamos uma nova receita com os params passados
    recipe = Recipe.new(name, description)
    # 3. Adicionar a receita no Repo
    @cookbook.create(recipe)
  end

  # Read: Lista as receitas
  def list
    # 1. Saber quais são todas as receitas disponiveis => @recipes
    # @cookbook.all
    # 2. Mostrar ao usuário, quais são as receitas
    @view.display_list(@cookbook.all)
  end

  # Destroy: Remover receita
  def remove
    # 1. Mostrar quais os registros a remover
    list
    # 2. Perguntar ao user qual indice remover
    index = @view.ask_user_for_index
    # 3. Passa o indice ao repositorio, assim removendo-o definitivamente
    @cookbook.destroy(index)
  end
end
