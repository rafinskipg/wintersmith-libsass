
fs   = require 'fs'
sass = require 'node-sass'
ccss = require 'clean-css'

module.exports = (env, callback) ->

	class LibSassPlugin extends env.ContentPlugin
		
		constructor: (@filepath) ->
		
		getFilename: ->
			@filepath.relative.replace /scss$/, 'css'
		
		getView: -> (env, locals, contents, templates, callback) ->
			config = env.config['node-sass'] or {}
			includePaths  = config.includePaths or []
			includePaths.push env.config.templates
			includePaths.push env.config.contents
			sass.render
				file: @filepath.full
				includePaths: includePaths
				success: (css) ->
					callback null, new Buffer css
				error: (err) ->
					callback new Error err
		
		LibSassPlugin.fromFile = (filepath, callback) ->
				plugin = new LibSassPlugin filepath
				callback null, plugin
		
		env.registerContentPlugin 'styles', '**/*.scss', LibSassPlugin
	
	callback()
