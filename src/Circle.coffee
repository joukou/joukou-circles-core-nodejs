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
@class joukou-circle-core/Circle
@extends events.EventEmitter
@requires lodash
###

{ EventEmitter } = require( 'events' )

module.exports = class extends EventEmitter

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
  @property {String} description
  ###
  description: ''

  icon: null

  ###*
  @method constructor
  ###
  constructor: ( options = {} ) ->
    options.inPorts = {} unless options.inPorts
    options.outPorts = {} unless options.outPorts
    @description = options.description if _.isString( options.description )
    @
    
  ###*
  @method getDescription
  @return {String}
  ###
  getDescription: ->
    @description

  ###*
  @method isReady
  @return {Boolean}
  ###
  isReady: ->
    true

  ###*
  @method isSubgraph
  @return {Boolean}
  ###
  isSubgraph: ->
    false

  ###*
  @method setIcon
  @param {String} icon
  @return {joukou-circle-core.Circle}
  ###
  setIcon: ( @icon ) ->
    @emit( 'icon', @icon )
    @

  ###*
  @method getIcon
  @return {String}
  ###
  getIcon: ->
    @icon