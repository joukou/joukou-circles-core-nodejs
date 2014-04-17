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
@class joukou-circle-core/OutPort
@classdesc Base class for output ports.
@extends stream.Readable
@requires lodash


Architecture:


  graph-uuid

      nodeUuid>outPort --------- inPort>nodeUuid
    

      packetUuid packetUUid packetUUid 


  outPort is a stream that produces information packets
  if chunk is not an info packet, it will be automatically wrapped with one
  outPort.pipe( amqp-stream )
  amqp reciever = outPort uuid maps to inPort uuid
       Note: outPort uuid ==== inPort uuid ?
  all data on outPort is automatically written to Raik outPortUuid/ipUUid
       


 

###

{ Readable } = require( 'stream' )

module.exports = class extends Readable

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