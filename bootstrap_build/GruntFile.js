var request = require('request');

module.exports = function(grunt) {

    // show elapsed time at the end
    require('time-grunt')(grunt);
    // load all grunt tasks
    require('load-grunt-tasks')(grunt);

    grunt.initConfig({

        pkg: grunt.file.readJSON('package.json'),

        sass: {
            dist: {
                options: {
                    style: 'compact', // Can be nested, compact, compressed, expanded.
                    sourcemap: 'none'
                },
                files: [{
                    expand: true, // Recursive Output style.
                    cwd: "bootstrap/scss/", // The startup directory
                    src: ["**/*.scss"], // Source files
                    dest: "../oods/sphinxtheme/static/bootstrap-4.0.0/css/", // Destination
                    ext: ".css" // File extension
                }]
            }
        }

    });
    grunt.registerTask('default', ['sass']);
}
