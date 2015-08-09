'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var PresentationSchema = new Schema({
	title: String,
	tags: [{type: String}],
	slides: [{
  		text: [{
			style: {type: String},
			content: {type: String}
		}],
		pictures: [{
			style: {type: String},
			content: {type: String}
		}],
		videos: [{
			style: {type: String},
			content: {type: String}
		}],
		shapes: [{
			style: {type: String},
			content: {type: String}
		}]
	}]
});

module.exports = mongoose.model('Presentation', PresentationSchema);