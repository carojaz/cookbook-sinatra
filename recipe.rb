class Recipe
  attr_writer :done

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @rating = attributes[:rating] || "0"
    @done = attributes[:done] || false
    @prep_time = attributes[:prep_time] || ""
  end

  def name
    return @name
  end

  def description
    return @description
  end

  def rating
    return @rating
  end

  def done?
    return @done
  end

  def prep_time
    return @prep_time
  end
end
