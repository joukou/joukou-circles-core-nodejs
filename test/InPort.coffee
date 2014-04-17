chai = require( 'chai' )
expect = chai.expect

InPort = require( '../dist/InPort' )

describe 'InPort', ->

  specify 'is defined', ->
    expect( InPort ).to.exist

  describe 'constructor', ->

    specify 'is an instanceof stream.Writable', ->
      expect( new InPort() ).to.be.instanceof( require( 'stream' ).Writable )

  describe 'getDatatype', ->

    specify 'returns the string "all" by default', ->
      expect( new InPort().getDatatype() ).to.equal( 'all' )

    specify 'returns the string provided as an option', ->
      expect( new InPort( datatype: 'csv' ).getDatatype() ).to.equal( 'csv' )

    specify 'does not return a boolean provided as an option', ->
      expect( new InPort( datatype: true ).getDatatype() ).to.equal( 'all' )

  describe 'getDescription', ->

    specify 'returns the empty string by default', ->
      expect( new InPort().getDescription() ).to.equal( '' )

    specify 'returns the string provided as an option', ->
      expect( new InPort( description: 'Test' ).getDescription() ).to.equal( 'Test' )

    specify 'does not return a boolean provided as an option', ->
      expect( new InPort( description: true ).getDescription() ).to.equal( '' )

  describe 'isRequired', ->

    specify 'returns boolean true by default', ->
      expect( new InPort().isRequired() ).to.be.true

    specify 'returns the boolean provided as an option', ->
      expect( new InPort( required: false ).isRequired() ).to.be.false

    specify 'does not return a string provided as an option', ->
      expect( new InPort( required: 'Test' ).isRequired() ).to.be.true
