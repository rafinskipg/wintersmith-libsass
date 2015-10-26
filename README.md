# wintersmith-libsass

Updated to use latest versions of `node-sass` and `clean-css`.

[![Build Status](https://travis-ci.org/rafinskipg/wintersmith-libsass.svg?branch=master)](https://travis-ci.org/rafinskipg/wintersmith-libsass)
[![Dependency Status](https://www.versioneye.com/user/projects/552f7b8210e71490660008d6/badge.svg?style=flat)](https://www.versioneye.com/user/projects/552f7b8210e71490660008d6)
[![npm package](http://img.shields.io/npm/v/wintersmith-libsass.svg?style=flat)](https://www.npmjs.org/package/wintersmith-libsass)

[Wintersmith](https://github.com/jnordberg/wintersmith) plugin that compiles
[sass](http://sass-lang.com) files using
[node-sass](https://github.com/andrew/node-sass) and optionally minifies them
using [clean-css](https://github.com/GoalSmashers/clean-css).


This plugin is a fork of [wintersmith-node-sass](https://github.com/semfact/wintersmith-node-sass) but mantained up to date


## Installing

Install globally or locally using npm

```
npm install [-g] wintersmith-libsass
```

and add `wintersmith-libsass` to your config.json

```json
{
	"plugins": [
		"wintersmith-libsass"
	]
}
```
## Imports and Templates

The plugin will compile each `.scss` file in the contents folder to a `.css`
file in the build folder. If you want to include files without compiling them
just place the `.scss` files in the template directory instead of the contents
directory.

## Configuration

### Minifying

Minifying of css files can be turned off using the config.json

```
{
	"node-sass": {
		"minify": false
	}
}
```

Extra [options for clean-css](https://github.com/GoalSmashers/clean-css#how-to-use-clean-css-programmatically)
can also be set using the config.json

```
{
	"clean-css": {
		"keepBreaks": true,
		"removeEmpty": true
	}
}
```

### Includes

If you want to add include directories for `node-sass` add them in the
`includePaths` property

```
{
	"node-sass": {
		"includePaths": [
			"./styles"
		]
	}
}
```
