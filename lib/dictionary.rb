class Term

  @@terms = []

  define_method(:initialize) do |word, definition|
    @words = []
    @words.push(word)
    @definitions = []
    @definitions.push(definition)
  end

  define_method(:words) do
    @words
  end

  define_method(:definitions) do
    @definitions
  end

  define_method(:save) do
    @@terms.push(self)
  end

  define_singleton_method(:all) do
    @@terms
  end

  define_singleton_method(:clear) do
    @@terms = []
  end

  define_singleton_method(:all_words) do
    words = []
    @@terms.each do |term|
      words.push(term.words())
    end
    words
  end

  define_method(:add_word) do |word_to_add|
    @words.push(word_to_add)
  end

  define_method(:edit_word) do |old_word,new_word|
    @words.each do |word_object|
      if old_word == word_object.word()
        word_object.edit(new_word)
      end
    end
  end

  define_method(:edit_definition) do |old_def, new_def|
    @definitions.each do |def_object|
      if old_def == def_object.definition()
        def_object.edit(new_def)
      end
    end
  end

  define_singleton_method(:delete_term) do |delete_word|
    @@terms.delete(self.search(delete_word))
  end

  define_singleton_method(:search) do |search_word|
    @@terms.each do |term|
      term.words().each() do |word_object|
        if search_word == word_object.word()
          return term
        end
      end
    end
  end


end
