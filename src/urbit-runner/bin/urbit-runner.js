#!/usr/bin/env node
'use strict';

var split   = require('split');
var through = require('promise-streams').through;

var runner = require('../index.js');
var Urbit = runner.Urbit;

var args = process.argv.slice(2);
var urbit = new Urbit(args);

urbit.expect(runner.ERROR)
.then(function(){
  return process.exit(1);
});

urbit.expect(/dojo> /)
.then(function(){
  return process.stdin
  .pipe(split())
  .pipe(through(function(arg){
    // environment variable or value
    var val = arg.trim()
      .replace(/\$[a-zA-Z0-9_]+/g, function(match){
        var env = process.env[match.slice(1)];
        return ( env != null ) ? env : '__unknown-var__';
      });

    return urbit.line(val);
  }))
  .wait()
  .then(function(){
    return urbit.exit(0);
  });
});
