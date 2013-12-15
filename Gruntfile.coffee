module.exports = (grunt)->
  coffee_source =
    'source/javascripts/'

  grunt.initConfig
    docco:
      debug:
        src: [ coffee_source + '**/*.coffee']
        options:
          output: 'source/docs/'

    watch:
      docco:
        tasks:
          "docco"
        files:
          coffee_source + "/**/*.coffee"

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-docco'
  grunt.loadNpmTasks 'grunt-newer'

  grunt.registerTask 'default', [ 'watch' ]

