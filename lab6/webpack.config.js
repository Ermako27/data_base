const path = require('path');

module.exports = {
	watch: true,
	watchOptions: {
		ignored: /node_modules/
	},
	entry: {
		main: './script.js'
	},

	output: {
		filename: '[name].bundle.js',
		path: path.resolve(__dirname, 'dist')
	},

	module: {
		rules : [
					{ 
						test: /\.xml$/, 
						use: {
							loader: 'xml-loader'
						}
					}
		  ]
	},
};
