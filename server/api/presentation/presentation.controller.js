'use strict';

var _ = require('lodash');
var Presentation = require('./presentation.model');

// Get list of presentations
exports.index = function(req, res) {
  Presentation.find(function (err, presentations) {
    if(err) { return handleError(res, err); }
    return res.status(200).json(presentations);
  });
};

// Get a single presentation
exports.show = function(req, res) {
  Presentation.findById(req.params.id, function (err, presentation) {
    if(err) { return handleError(res, err); }
    if(!presentation) { return res.status(404).send('Not Found'); }
    return res.json(presentation);
  });
};

// Creates a new presentation in the DB.
exports.create = function(req, res) {
  Presentation.create(req.body, function(err, presentation) {
    if(err) { return handleError(res, err); }
    return res.status(201).json(presentation);
  });
};

// Updates an existing presentation in the DB.
exports.update = function(req, res) {
  if(req.body._id) { delete req.body._id; }
  Presentation.findById(req.params.id, function (err, presentation) {
    if (err) { return handleError(res, err); }
    if(!presentation) { return res.status(404).send('Not Found'); }
    var updated = _.merge(presentation, req.body);
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.status(200).json(presentation);
    });
  });
};

// Deletes a presentation from the DB.
exports.destroy = function(req, res) {
  Presentation.findById(req.params.id, function (err, presentation) {
    if(err) { return handleError(res, err); }
    if(!presentation) { return res.status(404).send('Not Found'); }
    presentation.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.status(204).send('No Content');
    });
  });
};

function handleError(res, err) {
  return res.status(500).send(err);
}