require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @csv = csv_file_path
    @recipes = [] # contient des recipe (instances)
    load_csv
  end

  def load_csv
    CSV.foreach(@csv) do |row|
      name = row[0]
      description = row[1]
      rating = row[2]
      done = row[3] == "true"
      prep_time = row[4]
      @recipes << Recipe.new(name: name, description: description, rating: rating, done: done, prep_time: prep_time)
    end
  end

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv, 'wb', csv_options) do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.done?, recipe.prep_time]
      end
    end
  end

  def all
    return @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  def mark_as_done!(index)
    @recipes[index].done = true
    save_csv
  end
end
