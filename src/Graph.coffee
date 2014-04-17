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
@class joukou-circles-core/Graph
@classdesc Defines the structure of a flow-based programming graph.
@author Isaac Johnston <isaac.johnston@joukou.com>
###

{ EventEmitter } = require( 'events' )

module.exports = class extends EventEmitter

  Q = require( 'q' )

  constructor: ->
    super()

  @loadJSON = ( definition, metadata = {} ) ->
    definition.properties = {} unless definition.properties
    definition.processes = {} unless definition.processes
    definition.connections = [] unless definition.connections

    graph = new self( definition.properties.name )