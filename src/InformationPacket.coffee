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


###
graph-uuid

      nodeUuid>outPort --------- inPort>nodeUuid
    

      packetUuid packetUUid packetUUid

MySqlQuery
  inPorts
    query
  outPorts
    row


MySqlInsert
  inPorts
    row
    table
    database
    hostname
  outPorts
    success
    fail


###



###*
@class joukou-circle-core.Datum
@requires node-uuid
@requires bignum

A Datum is the smallest unit of data; i.e.,

- a row for SQL
- an object for key/value stores
- a request/response for an API

Every instance has a UUID for uniqueness and a sequence number for ordering. The
UUID and sequence number are created at the time the original source data enters
Joukou and persisted throughout the graph.



- no headers/column/field names = auto A/B/C/D
- schema vs all strings, assumption is string


###

module.exports = class

  ###*
  @private
  @static
  @property {Csv2Joukou} self
  ###
  self = @

  ###*
  @private
  @static
  @property {lodash} _
  ###
  _ = require( 'lodash' )

  ###*
  @private
  @static
  @property {node-uuid} uuid
  ###
  uuid = require( 'node-uuid' )

  ###*
  @private
  @static
  @property {bignum} bignum
  ###
  bignum = require( 'bignum' )

  ###*
  @method constructor
  ###
  constructor: ( @json ) ->


  ###*
  @static
  @method fromJson
  @param {Object} Joukou JSON datum interchange format
  ###
  @fromJson = ( json ) ->
    instance = new self()
    instance.json = json
    instance

  ###*
  @static
  @method factory
  ###
  @factory = ( datum ) ->


  getSequenceNumber: ->
    @json.sequence

  getUuid: ->
    @json.uuid

