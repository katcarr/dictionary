require("rspec")
require("word")

describe(Word) do
  describe("#word") do
    it("returns the word") do
      test_word = Word.new("manza","spanish")
      expect(test_word.word()).to(eq("manza"))
    end
  end

  describe("#language") do
    it("returns the language") do
      test_word = Word.new("manza", "spanish")
      expect(test_word.language()).to(eq("spanish"))
    end
  end

  describe("#edit") do
    it("changes word to the new word") do
      test_word = Word.new("mza", "spanish")
      test_word.edit("manza")
      expect(test_word.word()).to(eq("manza"))
    end
  end

end
