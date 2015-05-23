path = require('path')
escapeChar = process.platform.match(/^win/) ? '^' : '\\'
cwd = process.cwd().replace(/( |\(|\))/g, escapeChar + '$1')

banner = """
/*
 * /r/twentyonepilots CSS theme
 * Based on /r/Naut, modified by /u/schneidmaster
 * See https://github.com/schneidmaster/r-twentyonepilots for source.
*/
"""

module.exports = (grunt) ->

  grunt.initConfig

    pkg:
      grunt.file.readJSON 'package.json'

    # grunt clean
    clean: [
      '.tmp/**/*'
      'build/'
    ]
 
    # grunt sass
    sass:
      dist:
        files:
          '.tmp/naut_src.css': 'src/naut_src.scss'
          '.tmp/custom.css'  : 'src/custom.scss'
          '.tmp/flair.css'   : 'src/flair.scss'
      test:
        files:
          '.tmp/naut_src.css': 'src/naut_src.scss'
          '.tmp/custom.css'  : 'src/custom.scss'
          '.tmp/flair.css'   : 'src/test-flair.scss'

    # grunt string-replace
    'string-replace':
      dist:
        files:
          '.tmp/naut_src.css': '.tmp/naut_src.css'
          '.tmp/custom.css'  : '.tmp/custom.css'
          '.tmp/flair.css'   : '.tmp/flair.css'
        options:
          replacements: [{
            pattern: '@charset "UTF-8";'
            replacement: ''
          }]

    # grunt cssmin
    cssmin:
      target:
        options:
          banner: banner
        files:
          'build/production.min.css': [
            '.tmp/naut_src.css'
            '.tmp/custom.css'
            '.tmp/flair.css'
          ]

    # grunt watch
    watch:
      scripts:
        files: 'src/*.scss'
        tasks: ['test']
 
  # load plugins
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-string-replace'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  # tasks
  grunt.registerTask 'default', [
    'clean'
    'sass:dist'
    'string-replace'
    'cssmin'
  ]

  grunt.registerTask 'test', [
    'clean'
    'sass:test'
    'string-replace'
    'cssmin'
  ]