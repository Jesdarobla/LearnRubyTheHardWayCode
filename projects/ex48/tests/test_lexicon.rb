require "./lib/lexicon.rb"
require "test/unit"
require "./lib/ex48/parser.rb"

class TestLexicon < Test::Unit::TestCase

=begin

  def test_directions()
    assert_equal(Lexicon.scan("north"), [['direction', 'north']])
    result = Lexicon.scan("north south east")
    assert_equal(result, [['direction','north'],
            ['direction', 'south'],
            ['direction', 'east']])
    result = Lexicon.scan("north south east up down left right")
    assert_equal(result, [['direction','north'],
            ['direction', 'south'],
            ['direction', 'east'],
            ['direction', 'up'],
            ['direction', 'down'],
            ['direction', 'left'],
            ['direction', 'right']])
  end

  def test_verbs()
    assert_equal(Lexicon.scan("go"), [['verb', 'go']])
    result = Lexicon.scan("go kill eat sleep play talk")
    assert_equal(result, [['verb','go'],
            ['verb', 'kill'],
            ['verb', 'eat'],
            ['verb', 'sleep'],
            ['verb', 'play'],
            ['verb', 'talk'],])
  end

  def test_stops()
    assert_equal(Lexicon.scan("the"), [['stop','the']])
    result = Lexicon.scan("the in of")
    assert_equal(result, [['stop','the'],
          ['stop', 'in'],
          ['stop','of']])
          result = Lexicon.scan("the in of a an at")
          assert_equal(result, [['stop','the'],
                ['stop', 'in'],
                ['stop','of'],
                ['stop','a'],
                ['stop', 'an'],
                ['stop','at']])
  end

  def test_nouns()
    assert_equal(Lexicon.scan("bear"),[['noun','bear']])
    result = Lexicon.scan("bear princess")
    assert_equal(result, [['noun','bear'],
            ['noun','princess']])
            result = Lexicon.scan("bear princess knife table man")
            assert_equal(result, [['noun','bear'],
                    ['noun','princess'],
                    ['noun','knife'],
                    ['noun','table'],
                    ['noun','man']])
  end

  def test_numbers()
    assert_equal(Lexicon.scan("1234"),[['number', 1234]])
    result = Lexicon.scan("3 91234")
    assert_equal(result, [['number', 3],
         ['number', 91234]])
  end

  def test_errors()
      assert_equal(Lexicon.scan("ASDFADFASDF"), [['error', 'ASDFADFASDF']])
      result = Lexicon.scan("bear IAS princess")
      assert_equal(result, [['noun', 'bear'],
            ['error', 'IAS'],
            ['noun','princess']])
  end

  def test_capitalization()
    assert_equal(Lexicon.scan("NoRth"), [['direction', 'north']])
    result = Lexicon.scan("NorTh SoUth Erh aN A At UP")
    assert_equal(result, [['direction', 'north'],
            ['direction', 'south'],
            ['error', 'Erh'],
            ['stop', 'an'],
            ['stop', 'a'],
            ['stop', 'at'],
            ['direction', 'up']])
  end

=end

=begin

Below you can find tests done by me regarding my own version of the parser.

  def test_pairs()

    pairs = Lexicon.scan("run east kill bear")
    assert_equal(SentencePrep.separate(pairs), [["run", "east"],["kill", "bear"]])

  end

  def test_parseException()

    pairs = Lexicon.scan("run kill bear")
    assert_equal(SentencePrep.separate(pairs), "Please input a verb and a noun/direction correctly.")

  end

  def test_sentence()

    pairs = Lexicon.scan("run east kill bear")
    sentences = SentencePrep.separate(pairs)
    sentence1 = Sentence.new(sentences[0])
    assert_equal(sentence1.verb, "run")
    assert_equal(sentence1.object, "east")

  end
=end

  def test_parser()

    assert_equal(ParserMethods.skip(["stop","the"], "stop"), nil)
    assert_equal(ParserMethods.peek([["verb", "run"]]), "verb")
    assert_equal(ParserMethods.match([["verb", "run"]], 'verb'), ["verb", "run"])
    assert_equal(ParserMethods.parse_verb([["verb", "run"]]), ["verb", "run"] )
    assert_equal(ParserMethods.parse_object([["noun", "north"]]), ["noun", "north"])
    assert_equal(ParserMethods.parse_subject([["verb", "kill"]]), ["noun", "player"])
    assert_equal(ParserMethods.parse_sentence([["verb", "kill"], ["noun", "north"]]).verb, "kill")
    assert_equal(ParserMethods.parse_sentence([["verb", "kill"], ["noun", "north"]]).subject, "player")
    assert_equal(ParserMethods.parse_sentence([["verb", "kill"], ["noun", "north"]]).object, "north")

  end

  def test_parserException()

        assert_raise ParserError do
           ParserMethods.parse_verb([["noun", "north"]])
         end
  end


end
