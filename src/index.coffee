
fs   = require 'fs'
sass = require 'node-sass'
ccss = require 'clean-css'

module.exports = (env, callback) ->

	class NodeSassPlugin extends env.ContentPlugin
		
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
				includePaths: includePaths,
				(err, css) ->
					if err
						callback new Error err
					if config.minify isnt false
						css = new ccss(env.config['clean-css']).minify(css.css)
						callback null, new Buffer css.styles
					else
						callback null, new Buffer css.css
		
		NodeSassPlugin.fromFile = (filepath, callback) ->
				plugin = new NodeSassPlugin filepath
				callback null, plugin
		
		env.registerContentPlugin 'styles', '**/[^_]*.scss', NodeSassPlugin
	
	callback()
