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

tickets_banner = """
/*
 * /r/toptickets CSS theme
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
          '.tmp/custom-main.css'  : 'src/custom-main.scss'
          '.tmp/flair.css'   : 'src/flair.scss'
      test:
        files:
          '.tmp/naut_src.css': 'src/naut_src.scss'
          '.tmp/custom.css'  : 'src/custom.scss'
          '.tmp/custom-main.css'  : 'src/custom-main.scss'
          '.tmp/flair.css'   : 'src/test-flair.scss'
      tickets:
        files:
          '.tmp/naut_src.css': 'src/naut_src.scss'
          '.tmp/custom.css'  : 'src/custom.scss'
          '.tmp/custom-tickets.css'  : 'src/custom-tickets.scss'
          '.tmp/flair.css'   : 'src/tickets-flair.scss'

    # grunt string-replace
    'string-replace':
      dist:
        files:
          '.tmp/naut_src.css': '.tmp/naut_src.css'
          '.tmp/custom.css'  : '.tmp/custom.css'
          '.tmp/custom-main.css'  : '.tmp/custom-main.css'
          '.tmp/custom-tickets.css'  : '.tmp/custom-tickets.css'
          '.tmp/flair.css'   : '.tmp/flair.css'
          '.tmp/tickets-flair.css'  : '.tmp/tickets-flair.css'
        options:
          replacements: [{
            pattern: '@charset "UTF-8";'
            replacement: ''
          }]

    # grunt cssmin
    cssmin:
      dist:
        options:
          banner: banner
        files:
          'build/production.min.css': [
            '.tmp/naut_src.css'
            '.tmp/custom.css'
            '.tmp/custom-main.css'
            '.tmp/flair.css'
          ]
      tickets:
        options:
          banner: tickets_banner
        files:
          'build/production.min.css': [
            '.tmp/naut_src.css'
            '.tmp/custom.css'
            '.tmp/custom-tickets.css'
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
    'cssmin:dist'
  ]

  grunt.registerTask 'tickets', [
    'clean'
    'sass:tickets'
    'string-replace'
    'cssmin:tickets'
  ]

  grunt.registerTask 'test', [
    'clean'
    'sass:test'
    'string-replace'
    'cssmin:dist'
  ]