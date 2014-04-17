###*
@author Isaac Johnston <isaac.johnston@joukou.co>
@copyright 2014 Joukou Ltd. All rights reserved.
###

gulp      = require( 'gulp' )
path      = require( 'path' )
lazypipe  = require( 'lazypipe' )
plugins   = require( 'gulp-load-plugins' )( lazy: false )

coffee = lazypipe()
  .pipe( plugins.sourcemaps.init )
  .pipe( plugins.coffee, bare: true )
  .pipe( plugins.sourcemaps.write )
  .pipe( gulp.dest, 'dist' )

mocha = lazypipe()
  .pipe( plugins.mocha,
    ui: 'bdd'
    reporter: 'spec'
    colors: true
    compilers: 'coffee:coffee-script/register'
  )

#
# Build related tasks.
#

gulp.task( 'sloc', ->
  gulp.src( 'src/**/*.coffee' )
    .pipe( plugins.sloc( ) )
)

gulp.task( 'clean', ->
  gulp.src( 'dist', read: false )
    .pipe( plugins.clean( force: true ) )
    .on( 'error', plugins.util.log )
)

gulp.task( 'coffeelint', [ 'sloc' ], ->
  gulp.src( 'src/**/*.coffee' )
    .pipe( plugins.coffeelint( optFile: 'coffeelint.json' ) )
    .pipe( plugins.coffeelint.reporter() )
    .pipe( plugins.coffeelint.reporter( 'fail' ) )
    .on( 'error', plugins.util.log )
)

gulp.task( 'coffee', [ 'clean' ], ->
  gulp.src( 'src/**/*.coffee' )
    .pipe( coffee() )
    .on( 'error', plugins.util.log )

)

gulp.task( 'build', [ 'sloc', 'coffeelint', 'coffee' ] )

gulp.task( 'default', [ 'build' ] )

#
# Test related tasks.
# 

gulp.task( 'cover', [ 'build' ], ->
  gulp.src( 'dist/**/*.js' )
    .pipe( plugins.istanbul() )
    .on( 'error', plugins.util.log )
)

gulp.task( 'test', [ 'cover' ], ->
  gulp.src( 'test/**/*.coffee')
    .pipe( mocha() )
    .pipe( plugins.istanbul.writeReports( './coverage' ) )
    .on( 'error', plugins.util.log )
)

gulp.task( 'ci', [ 'test' ], ->
  gulp.src( 'coverage/lcov.info' )
    .pipe( plugins.coveralls() )
)

#
# Watch related tasks.
#

gulp.task( 'coffeewatch', [ 'coffee' ], ->
  changes = gulp.src( 'src/**/*.coffee', read: false )
    .pipe( plugins.watch( ) )

  changes
    .pipe( plugins.changed( 'dist' ) )
    .pipe( coffee() )
    .on( 'error', plugins.util.log )


  changes
    .pipe( plugins.coffeelint( optFile: 'coffeelint.json' ) )
    .pipe( plugins.coffeelint.reporter( ) )
)

gulp.task( 'mochawatch', [ 'coffee' ], ->
  gulp.src( [ 'dist/**/*.js', 'test/**/*.coffee' ], read: false )
    .pipe( plugins.watch( emit: 'all', ( files ) ->
      files
        .pipe( plugins.grepStream( '**/test/**/*.coffee' ) )
        .pipe( mocha() )
        .on( 'error', plugins.util.log )
    ) )
)

gulp.task( 'develop', [ 'coffeewatch', 'mochawatch' ] )
