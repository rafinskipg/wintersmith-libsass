vows = require 'vows'
assert = require 'assert'
wintersmith = require 'wintersmith'

suite = vows.describe 'Plugin'

suite.addBatch
  'wintersmith environment':
    topic: -> wintersmith './example/config.json'
    'loaded ok': (env) ->
      assert.instanceOf env, wintersmith.Environment
    'contents':
      topic: (env) -> env.load @callback
      'loaded ok': (result) ->
        assert.instanceOf result.contents, wintersmith.ContentTree
      'has plugin instances': (result) ->
        assert.instanceOf result.contents['index.json'], wintersmith.ContentPlugin
        assert.instanceOf result.contents['main.scss'], wintersmith.ContentPlugin
        assert.isArray result.contents._.styles
        assert.isArray result.contents._.pages
      'it has the index jade': (result) ->
        for item in result.contents._.pages
          assert.equal item.metadata.template, 'index.jade'
      'has the main.scss': (result) ->
        console.log result.contents._.styles[0]
        assert.equal result.contents._.styles[0].filepath.relative, 'main.scss'

suite.export module
