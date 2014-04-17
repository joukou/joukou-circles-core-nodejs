"use strict"

###*
Copyright 2014 Joukou Ltd

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
###

###*
@class joukou-circle-core.InPort
@extends stream.Writable
@requires lodash
###

{ Writable } = require( 'stream' )

module.exports = class extends Writable

  ###*
  @private
  @static
  @property {Object} self
  ###
  self = @

  ###*
  @private
  @static
  @property {lodash} _
  ###
  _ = require( 'lodash' )

  ###*
  @property {String} datatype
  ###
  datatype: 'all'

  ###*
  @property {String} description
  ###
  description: ''

  ###*
  @property {Boolean} required
  ###
  required: true

  ###*
  @method constructor
  ###
  constructor: ( options = {} ) ->
    super( options )

    @datatype = options.datatype if _.isString( options.datatype )
    @description = options.description if _.isString( options.description )
    @required = options.required if _.isBoolean( options.required )

  ###*
  @method getDatatype
  @return {String}
  ###
  getDatatype: ->
    @datatype

  ###*
  @method getDescription
  @return {String}
  ###
  getDescription: ->
    @description

  ###*
  @method isRequired
  @return {Boolean}
  ###
  isRequired: ->
    @required