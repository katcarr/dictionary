class Word

  define_method(:initialize) do |word,language|
    @word = word
    @language = language
  end

  define_method(:word) do
    @word
  end

  define_method(:language) do
    @language
  end

  define_method(:edit) do |new_word|
    @word = new_word
  end
end
