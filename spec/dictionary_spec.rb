require("rspec")
require("dictionary")
require("definition")
require("word")

describe(Term) do

  before() do
    Term.clear()
  end

  describe("#words") do
    it("returns the words") do
      test_word = Word.new("carrot", "english")
      test_def = Definition.new("an orange vegetable", "english")
      test_term = Term.new(test_word,test_def)
      expect(test_term.words()).to(eq([test_word]))
    end
  end

  describe("#definitions") do
    it("returns the definitions") do
      test_word = Word.new("carrot", "english")
      test_def = Definition.new("an orange vegetable", "english")
      test_term = Term.new(test_word, test_def)
      expect(test_term.definitions()).to(eq([test_def]))
    end
  end

  describe("#save") do
    it("saves the instance to the array") do
      test_word = Word.new("carrot", "english")
      test_def = Definition.new("an orange vegetable", "english")
      test_term = Term.new(test_word, test_def)
      test_term.save()
      expect(Term.all()).to(eq([test_term]))
    end
  end

  describe(".all") do
    it("is empty to begin") do
      test_word = Word.new("carrot", "english")
      test_def = Definition.new("an orange vegetable", "english")
      test_term = Term.new(test_word, test_def)
      expect(Term.all()).to(eq([]))
    end

    it("shows all instances in Term class") do
      test_word = Word.new("carrot", "english")
      test_def = Definition.new("an orange vegetable", "english")
      test_term = Term.new(test_word, test_def)
      test_term.save()
      test_word2 = Word.new("zanahoria", "spanish")
      test_def2 = Definition.new("szdlgkjhzdfghk", "spanish")
      test_term2 = Term.new(test_word2, test_def2)
      test_term2.save()
      expect(Term.all()).to(eq([test_term, test_term2]))
    end
  end

  describe(".clear") do
    it("clears all instances in the class") do
      test_word = Word.new("carrot", "english")
      test_def = Definition.new("an orange vegetable", "english")
      test_term = Term.new(test_word, test_def)
      Term.clear()
      expect(Term.all()).to(eq([]))
    end
  end

  describe('.all_words') do
    it("lists all words in the Term class") do
      test_word = Word.new("carrot", "english")
      test_def = Definition.new("an orange vegetable", "english")
      test_term = Term.new(test_word, test_def)
      new_word = Word.new("zanahoria", "spanish")
      test_term.add_word(new_word)
      test_term.save()
      test_word2 = Word.new("apple","english")
      test_def2 = Definition.new("a red fruit", "english")
      test_term2 = Term.new(test_word2, test_def2)
      test_term2.save()
      expect(Term.all_words()).to(eq([[test_word, new_word], [test_word2]]))
    end
  end

  describe("#add_word") do
    it("adds a new word to the word instance") do
      test_word = Word.new("carrot", "english")
      test_def = Definition.new("an orange vegetable", "english")
      test_term = Term.new(test_word, test_def)
      new_word = Word.new("karoti", "swahili")
      test_term.add_word(new_word)
      expect(test_term.words()).to(eq([test_word, new_word]))
    end
  end

  describe("#edit_word") do
    it("finds the correct word to edit") do
      test_word = Word.new("carot", "english")
      test_def = Definition.new("an orange vegetable", "english")
      test_term = Term.new(test_word, test_def)
      new_word = Word.new("zanahoria", "spanish")
      test_term.add_word(new_word)
      test_term.edit_word("carot", "carrot")
      expect(test_term.words().at(0).word()).to(eq("carrot"))
    end

    it("finds the correct word to edit") do
      test_word = Word.new("carot", "english")
      test_def = Definition.new("an orange vegetable", "english")
      test_term = Term.new(test_word, test_def)
      new_word = Word.new("zana", "spanish")
      test_term.add_word(new_word)
      test_term.edit_word("zana", "zanahoria")
      expect(test_term.words().at(1).word()).to(eq("zanahoria"))
    end
  end

  describe("#edit_definition") do
    it("edits the defintion of the instance") do
      test_word = Word.new("carrot", "english")
      test_def = Definition.new("a blue vegetable", "english")
      test_term = Term.new(test_word, test_def)
      new_word = Word.new("zanahoria", "spanish")
      test_term.add_word(new_word)
      test_term.edit_definition("a blue vegetable", "an orange vegetable")
      expect(test_term.definitions().at(0).definition()).to(eq("an orange vegetable"))
    end
  end

  describe(".delete_term") do
    it("deletes the word from the Term class") do
      test_word = Word.new("carot", "english")
      test_def = Definition.new("an orange vegetable", "english")
      test_term = Term.new(test_word, test_def)
      new_word = Word.new("zanahoria", "spanish")
      test_term.add_word(new_word)
      test_term.save()
      test_word2 = Word.new("apple","english")
      test_def2 = Definition.new("a red fruit", "english")
      test_term2 = Term.new(test_word2, test_def2)
      test_term2.save()
      Term.delete_term('zanahoria')
      expect(Term.all()).to(eq([test_term2]))
    end
  end

  describe(".search") do
    it("returns the words and defintions that matches the word searched for") do
        test_word = Word.new("carot", "english")
        test_def = Definition.new("an orange vegetable", "english")
        test_term = Term.new(test_word, test_def)
        new_word = Word.new("zanahoria", "spanish")
        test_term.add_word(new_word)
        test_term.save()
        test_word2 = Word.new("apple","english")
        test_def2 = Definition.new("a red fruit", "english")
        test_term2 = Term.new(test_word2, test_def2)
        test_term2.save()
      expect(Term.search("apple")).to(eq(test_term2))
    end
  end

end
