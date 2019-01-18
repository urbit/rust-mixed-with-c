'use strict';

var stream       = require('stream');
var streamSnitch = require('stream-snitch');
var colors       = require('colors');
var escapeRegexp = require('escape-string-regexp');
var pty          = require('pty.js');

var ERROR = /((ford|warn): |\r\x1b\[K\/~)/;

function repeatString$(str, n){
  for (var r = ''; n > 0; (n >>= 1) && (str += str)) if (n & 1) r += str;
  return r;
}

function Urbit(args){
  var this$ = this;

  // overridable
  this.stdout = process.stdout;

  console.log("starting vere with the following arguments:");
  console.log(args);
  this.pty = pty.spawn('urbit', args);

  // XX pipe?
  this.pty.on('data', function(it){
    return this$.stdout.write(it);
  });

  this.lastOutput = Date.now();
  this.pty.on('data', function(){
    return this$.lastOutput = Date.now();
  });

  this.resetListeners();

  process.on('exit', function(){
    // send ^D (EOF) to gracefully checkpoint
    return this$.pty.write('\x04');
  });

  this.pty.on('exit', function(code, signal){
    if ( 0 !== code ) {
      return process.exit(code);
    }
    if ( 0 !== signal ) {
      return process.exit(128 + signal);
    }

    // XX report if unexpected exit?
  });
}

Urbit.prototype.note = function(){
  var args = Array.prototype.slice.call(arguments);
  var header = ("\n" + repeatString$('_', 40) + "\nnode:").blue;
  return console.log.apply(console, [header].concat(args));
};

Urbit.prototype.warn = function(){
  var args = Array.prototype.slice.call(arguments);
  var header = ("\n" + repeatString$('!', 40) + "\nnode:").red;
  return console.log.apply(console, [header].concat(args));
};

Urbit.prototype.waitSilent = function(){
  var this$ = this;
  return new Promise(function(resolve){
    var a;
    return a = setInterval(function(){
      if (Date.now() > this$.lastOutput + 1000) {
        clearInterval(a);
        return resolve(this$.lastOutput);
      }
    }, 200);
  });
};

Urbit.prototype.resetListeners = function(){
  this.pty.socket.unpipe(this.listeners);
  this.pty.socket.pipe(this.listeners = new stream.PassThrough);
  return this;
};

Urbit.prototype.every = function(re, cb){
  return this.listeners.pipe(new streamSnitch(re).on("match", cb));
};

Urbit.prototype.expect = function(re){
  var this$ = this;
  return new Promise(function(resolve){
    return this$.listeners.pipe(new streamSnitch(re).once("match", resolve));
  });
};

Urbit.prototype.expectImmediate = function(re){
  return Promise.race([
    this.expect(re), this.waitSilent().then(function(){
      throw Error("Expected " + re + " during event");
    })
  ]);
};

Urbit.prototype.line = function(s){
  var this$ = this;
  this.pty.write(s);
  return this.waitSilent().then(function(){
    this$.stdout.write("\n");
    return this$.pty.write("\r");
  });
};

Urbit.prototype.expectEcho = function(s){
  var this$ = this;
  return this.line(s).then(function(){
    return this$.expect(new RegExp(escapeRegexp(s)));
  });
};

Urbit.prototype.exit = function(code){
  this.pty.on('exit', function(){
    return process.exit(code);
  });

  // ^C running event
  // this.pty.write("\x03");

  // ^E^U to clear prompt
  this.pty.write("\x05\x15");

  // ^D to checkpoint
  return this.pty.write("\x04");
};

module.exports = {
  ERROR: ERROR,
  Urbit: Urbit
};
