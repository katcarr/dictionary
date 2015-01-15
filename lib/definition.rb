class Definition

  define_method(:initialize) do |definition, language|
    @definition = definition
    @language = language
  end

  define_method(:definition) do
    @definition
  end

  define_method(:language) do
    @language
  end

  define_method(:edit) do |new_definition|
    @definition = new_definition
  end
end
