# wintersmith-node-sass

[![Dependency Status](https://www.versioneye.com/user/projects/53ab11a5d043f9e6a0000038/badge.svg?style=flat)](https://www.versioneye.com/user/projects/53ab11a5d043f9e6a0000038)

[Wintersmith](https://github.com/jnordberg/wintersmith) plugin that compiles
[sass](http://sass-lang.com) files using
[node-sass](https://github.com/andrew/node-sass) and optionally minifies them
using [clean-css](https://github.com/GoalSmashers/clean-css).

## Installing

Install globally or locally using npm

```
npm install [-g] wintersmith-node-sass
```

and add `wintersmith-sass` to your config.json

```json
{
	"plugins": [
		"wintersmith-node-sass"
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
	"node-sass": [
		"minify": false
	]
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
