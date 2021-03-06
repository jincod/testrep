module.exports = (grunt) ->

    grunt.initConfig
        coffee:
            compile:
                files:
                    'src/src.js': ['src/*.coffee']
                    'specs/specs.js': ['specs/*.coffee']
            build:
                files:
                    'build/all.js': ['src/*.coffee']
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

    grunt.registerTask 'default', 'coffee'
    grunt.registerTask "tests", ["jasmine"]