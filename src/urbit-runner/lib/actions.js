'use strict';

var fs = require('fs');

var ERROR = require('./runner.js').ERROR

function safeBoot(urb){
  urb.note("Booting urbit");

  return Promise.race([
    urb.expect(ERROR).then(function(){
      urb.warn("Boot error detected");
      throw Error("Stack trace while booting");
    }), urb.expect(/dojo> /).then(function(){
      return urb.expectEcho("%dojo-booted").then(function(){
        return urb.resetListeners();
      });
    })
  ]);
}

function test(urb){
  var errs;
  urb.note("Running /===/tests");
  errs = "";
  urb.every(/((FAILED|CRASHED)\s+\/[ -~]*)/, function(arg){
    var result = arg[1];
    if (!errs) {
      urb.warn("First error");
    }
    return errs += "\n  " + result;
  });
  return urb.line("+test, =defer |, =seed `@uvI`(shaz %reproducible)").then(function(){
    return urb.expectEcho("%ran-tests").then(function(){
      if (errs) {
        throw Error(errs);
      }
      return urb.resetListeners();
    });
  });
}

function testCores(urb){
  var errs, cur;
  urb.note("Testing compilation");
  errs = {};
  cur = "init";
  urb.every(/>> (\/[ -~]+)/, function(arg$){
    var _, path;
    _ = arg$[0], path = arg$[1];
    return cur = path;
  });
  urb.every(ERROR, function(){
    if (!errs[cur]) {
      errs[cur] = true;
      return urb.warn("Compile error detected");
    }
  });
  return urb.line("|start %test").then(function(){
    return urb.line(":test [%cores /]").then(function(){
      return urb.expectEcho("%compilation-tested").then(function(){
        errs = Object.keys(errs);
        if (errs.length) {
          throw Error("in " + errs);
        }
        return urb.resetListeners();
      });
    });
  });
}

function testRenderers(urb){
  var errs, cur;
  urb.note("Testing renderers");
  errs = {};
  cur = "init";
  urb.every(/>> (\[[ -~]+)/, function(arg$){
    var _, ren;
    _ = arg$[0], ren = arg$[1];
    return cur = ren;
  });
  urb.every(ERROR, function(){
    if (!errs[cur]) {
      errs[cur] = true;
      return urb.warn("Renderer error detected");
    }
  });
  return urb.line(":test [%renders /]").then(function(){
    return urb.expectEcho("%renderers-tested").then(function(){
      errs = Object.keys(errs);
      if (errs.length) {
        throw Error("in " + errs);
      }
      return urb.resetListeners();
    });
  });
}

function mountDesk(desk) {
  desk = desk || 'home';

  return function(urb){
    return urb.expect(/dojo> /)
    .then(function(){
      return urb.line("|mount /=" + desk + "=")
    })
    .then(function(){
      return urb.expectEcho("%complete-mounting")
    })
    .then(function(){
      return urb.resetListeners();
    });
  }
}

function oauth2(domain, id, secret){
  return function(urb) {
    return urb.expect(/dojo> /)
    .then(function(arg){
      return urb.line("|init-oauth2")
    })
    .then(function(){
      return urb.expect(/api hostname/)
      .then(function(){
        return urb.line(domain)
      })
    })
    .then(function(){
      return urb.expect(/client id: /)
      .then(function(){
        return urb.line(id)
      })
    })
    .then(function(){
      return urb.expect(/client secret: /)
      .then(function(){
        return urb.line(secret)
      })
    })
    .then(function(){
      return urb.resetListeners();
    });
  }
}

function dnsAuthority(domain, project, zone){
  return function(urb){
    return urb.expect(/dojo> /)
    .then(function(){
      return urb.line(":dns|authority")
    })
    .then(function(){
      return urb.expect(/dns domain: /)
      .then(function(){
        return urb.line(domain)
      })
    })
    .then(function(){
      return urb.expect(/gcloud project: /)
      .then(function(){
        return urb.line(project)
      })
    })
    .then(function(){
      return urb.expect(/dns zone: /)
      .then(function(){
        return urb.line(zone)
      })
    })
    .then(function(){
      return urb.resetListeners();
    });
  }
}

function setIp(addr) {
  return function(urb){
    return urb.expect(/dojo> /)
    .then(function(){
      return urb.line(":dns|ip")
    })
    .then(function(){
      return urb.expect(/ipv4 address: /)
      .then(function(){
        return urb.line(addr)
      })
    })
    .then(function(){
      return urb.resetListeners();
    });
  }
}

function savePillUrl(path){
  return function(urb){
    return urb.expect(/https.*git-.{10}\.pill/)
    .then(function(arg){
      return new Promise(function(resolve, reject) {
        fs.writeFile(path, arg[0], function(err){
          if (err) reject(err);
          else resolve();
        });
      })
    })
    .then(function(){
      return urb.resetListeners();
    });
  }
}

function saveWrappedUrl(path){
  return function(urb){
    // XX stricter regex
    return urb.expect(/\\\/(.*\s)+(?=\\\/)/)
    .then(function(arg){
      // unwrap lines
      var url = arg[0].match(/\S+/g);
      url[0] = url[0].slice(2, -2);
      url = url.join('').slice(0, -2);

      return new Promise(function(resolve, reject) {
        fs.writeFile(path, url, function(err){
          if (err) reject(err);
          else resolve();
        });
      })
    }).then(function(){
      return urb.resetListeners();
    });
  }
}

function saveCode(path) {
  return function(urb){
    return urb.line("+code")
    .then(function(){
      return urb.expect(/([a-z]{6}\-){3}[a-z]{6}/g)
      .then(function(arg){

        // match a code and save it to a file
        return new Promise(function(resolve, reject) {
          fs.writeFile(path, arg[0], function(err){
            if (err) reject(err);
            else resolve();
          });
        });
      })
      .then(function(){
        return urb.resetListeners();
      });
    });
  }
}

module.exports = {
  safeBoot:      safeBoot,
  test:          test,
  testCores:     testCores,
  testRenderers: testRenderers,
  mountDesk:     mountDesk,
  oauth2:        oauth2,
  dnsAuthority:  dnsAuthority,
  setIp:         setIp,
  savePillUrl:   savePillUrl,
  saveWrappedUrl: saveWrappedUrl,
  saveCode:      saveCode
}
