#Dictionary

A Ruby app that creates a Term class composed of a number of term objects, each including words and definitions. Each term object is capable of handling multiple words and definitions in a variety of languages.

##Code Example
Assuming you have ruby installed, in the terminal:

`test_word = Word.new("apple","english")`

`test_definition = Definition.new("a red fruit","english")`

`test_term = Term.new(test_word,test_term)`

`word_to_add = Word.new("manaza", "spanish")`

`test_term.add_word(word_to_add)`

##Tests
Testing the ruby methods can be done via rspec.

`gem install rspec`

`rspec`

##Motivation

To practice creating Classes in Ruby and to create a Class that took other user
defined Class objects as arguments.

##License

MIT License, copyright 2015. Created by Kathryn Carr and Christopher Joy-Webb
