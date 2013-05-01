module.exports = (grunt) ->

    grunt.initConfig
        coffee:
            compile:
                files:
                    'src/src.js': ['src/*.coffee']
                    'specs/specs.js': ['specs/*.coffee']
        jasmine:
            src: ['src/**/*.js']
            options:
                specs: "./specs/**/*.js"
        watch:
            specs:
                files: ["src/**/*.coffee", "specs/**/*.coffee"]
                tasks: ["coffee", "jasmine"]

    grunt.loadNpmTasks 'grunt-contrib-jasmine'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-coffee'

    grunt.registerTask 'default', 'concat'
    grunt.registerTask "tests", ["jasmine"]