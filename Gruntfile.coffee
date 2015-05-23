path = require('path')
escapeChar = process.platform.match(/^win/) ? '^' : '\\'
cwd = process.cwd().replace(/( |\(|\))/g, escapeChar + '$1')

module.exports = (grunt) ->

  grunt.initConfig

    pkg:
      grunt.file.readJSON 'package.json'

    # grunt clean
    clean: [
      '.tmp/**/*'
      'build/'
    ]

    # grunt concat
    concat:
      css:
        src:  [
          '.tmp/naut_src.css'
          '.tmp/flair.css'
        ]
        dest: '.tmp/concat/production.css'
 
    # grunt sass
    sass:
      dist:
        files:
          '.tmp/naut_src.css': 'src/naut_src.scss'
          '.tmp/flair.css'   : 'src/flair.scss'

    # grunt cssmin
    cssmin:
      dist:
        src: ['.tmp/concat/production.css']
        dest: 'build/production.min.css'
 
  # load plugins
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-sass'

  # tasks
  grunt.registerTask 'default', [
    'clean'
    'sass'
    'concat'
    'cssmin'
  ]