chai = require( 'chai' )
expect = chai.expect

Circle = require( '../dist/Circle' )

describe 'Circle', ->
  
  specify 'is defined', ->
    expect( Circle ).to.exist

  describe 'getDescription', ->

    specify 'returns a string', ->
      expect( new Circle().getDescription() ).to.be.a.string

    specify 'returns the string provided as an option', ->
      expect( new Circle( description: 'Test' ).getDescription() ).to.equal( 'Test' )

    specify 'does not return a boolean provided as an option', ->
      expect( new Circle( description: true ).getDescription() ).to.equal( '' )

  describe 'isReady', ->

    specify 'returns boolean true', ->
      expect( new Circle().isReady() ).to.be.true

  describe 'isSubgraph', ->

    specify 'returns boolean false', ->
      expect( new Circle().isSubgraph() ).to.be.false

  describe 'setIcon', ->

    specify 'sets the icon to the given string', ->
      expect( new Circle().setIcon( 'test').getIcon() ).to.equal( 'test' )

  describe 'getIcon', ->

    specify 'returns null by default', ->
      expect( new Circle().getIcon() ).to.be.null