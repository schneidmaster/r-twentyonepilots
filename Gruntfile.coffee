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
          '.tmp/flair.css'   : 'src/flair.scss'

    # grunt cssmin
    cssmin:
      target:
        options:
          banner: banner
        files:
          'build/production.min.css': ['.tmp/naut_src.css', '.tmp/flair.css']
 
  # load plugins
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-sass'

  # tasks
  grunt.registerTask 'default', [
    'clean'
    'sass'
    'cssmin'
  ]