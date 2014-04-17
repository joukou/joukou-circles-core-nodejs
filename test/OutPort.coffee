chai = require( 'chai' )
expect = chai.expect

OutPort = require( '../dist/OutPort' )

describe 'OutPort', ->

  specify 'is defined', ->
    expect( OutPort ).to.exist

  describe 'constructor', ->

    specify 'is an instanceof stream.Readable', ->
      expect( new OutPort() ).to.be.instanceof( require( 'stream' ).Readable )

  describe 'getDatatype', ->

    specify 'returns the string "all" by default', ->
      expect( new OutPort().getDatatype() ).to.equal( 'all' )

    specify 'returns the string provided as an option', ->
      expect( new OutPort( datatype: 'csv' ).getDatatype() ).to.equal( 'csv' )

    specify 'does not return a boolean provided as an option', ->
      expect( new OutPort( datatype: true ).getDatatype() ).to.equal( 'all' )

  describe 'getDescription', ->

    specify 'returns the empty string by default', ->
      expect( new OutPort().getDescription() ).to.equal( '' )

    specify 'returns the string provided as an option', ->
      expect( new OutPort( description: 'Test' ).getDescription() ).to.equal( 'Test' )

    specify 'does not return a boolean provided as an option', ->
      expect( new OutPort( description: true ).getDescription() ).to.equal( '' )

  describe 'isRequired', ->

    specify 'returns boolean true by default', ->
      expect( new OutPort().isRequired() ).to.be.true

    specify 'returns the boolean provided as an option', ->
      expect( new OutPort( required: false ).isRequired() ).to.be.false

    specify 'does not return a string provided as an option', ->
      expect( new OutPort( required: 'Test' ).isRequired() ).to.be.true
