'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var PresentationSchema = new Schema({
  title: String,
  tags: [{type: String}],
  slides: [{type: String}]
});

module.exports = mongoose.model('Presentation', PresentationSchema);