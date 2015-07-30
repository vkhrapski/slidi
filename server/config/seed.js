/**
 * Populate DB with sample data on server start
 * to disable, edit config/environment/index.js, and set `seedDB: false`
 */

'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var Thing = require('../api/thing/thing.model');
var User = require('../api/user/user.model');
var Presentation = require('../api/presentation/presentation.model');

User.find({}).remove(function() {
  User.create({
    provider: 'local',
    name: 'Test User',
    email: 'test@test.com',
    password: 'test',
    presentations: []
  }, {
    provider: 'local',
    role: 'admin',
    name: 'Admin',
    email: 'admin@admin.com',
    password: 'admin'
  }, function() {
      console.log('finished populating users');
    }
  );
});

Presentation.find({}).remove(function() {
  Presentation.create({
    title: '(1)Title',
    tags: ['(1)Tag'],
    slides: ['<h1>(1)Hello</h1>']
  }, {
    title: '(2)Title',
    tags: ['(2)Tag'],
    slides: ['<h1>(2)Hello</h1>']
  });
});