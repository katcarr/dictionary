require("rspec")
require("definition")

describe(Definition) do
  describe("#definition") do
    it("returns the definition") do
      test_definition = Definition.new("a red fruit", "english")
      expect(test_definition.definition()).to(eq("a red fruit"))
    end
  end

  describe("#language") do
    it("returns the language") do
      test_definition = Definition.new("a red fruit", "english")
      expect(test_definition.language()).to(eq("english"))
    end
  end

  describe("#edit") do
    it("edits the definition") do
      test_definition = Definition.new("a red frut", "english")
      test_definition.edit("a red fruit")
      expect(test_definition.definition()).to(eq("a red fruit"))
    end
  end
end
