# This file has been generated by node2nix 1.6.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {
    "ajv-6.7.0" = {
      name = "ajv";
      packageName = "ajv";
      version = "6.7.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ajv/-/ajv-6.7.0.tgz";
        sha512 = "RZXPviBTtfmtka9n9sy1N5M5b82CbxWIR6HIis4s3WQTXDJamc/0gpCWNGz6EWdWp4DOfjzJfhz/AS9zVPjjWg==";
      };
    };
    "array-differ-1.0.0" = {
      name = "array-differ";
      packageName = "array-differ";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/array-differ/-/array-differ-1.0.0.tgz";
        sha1 = "eff52e3758249d33be402b8bb8e564bb2b5d4031";
      };
    };
    "array-union-1.0.2" = {
      name = "array-union";
      packageName = "array-union";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/array-union/-/array-union-1.0.2.tgz";
        sha1 = "9a34410e4f4e3da23dea375be5be70f24778ec39";
      };
    };
    "array-uniq-1.0.3" = {
      name = "array-uniq";
      packageName = "array-uniq";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/array-uniq/-/array-uniq-1.0.3.tgz";
        sha1 = "af6ac877a25cc7f74e058894753858dfdb24fdb6";
      };
    };
    "arrify-1.0.1" = {
      name = "arrify";
      packageName = "arrify";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/arrify/-/arrify-1.0.1.tgz";
        sha1 = "898508da2226f380df904728456849c1501a4b0d";
      };
    };
    "asap-2.0.6" = {
      name = "asap";
      packageName = "asap";
      version = "2.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/asap/-/asap-2.0.6.tgz";
        sha1 = "e50347611d7e690943208bbdafebcbc2fb866d46";
      };
    };
    "asn1-0.2.4" = {
      name = "asn1";
      packageName = "asn1";
      version = "0.2.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/asn1/-/asn1-0.2.4.tgz";
        sha512 = "jxwzQpLQjSmWXgwaCZE9Nz+glAG01yF1QnWgbhGwHI5A6FRIEY6IVqtHhIepHqI7/kyEyQEagBC5mBEFlIYvdg==";
      };
    };
    "assert-plus-1.0.0" = {
      name = "assert-plus";
      packageName = "assert-plus";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/assert-plus/-/assert-plus-1.0.0.tgz";
        sha1 = "f12e0f3c5d77b0b1cdd9146942e4e96c1e4dd525";
      };
    };
    "asynckit-0.4.0" = {
      name = "asynckit";
      packageName = "asynckit";
      version = "0.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz";
        sha1 = "c79ed97f7f34cb8f2ba1bc9790bcc366474b4b79";
      };
    };
    "aws-sign2-0.7.0" = {
      name = "aws-sign2";
      packageName = "aws-sign2";
      version = "0.7.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/aws-sign2/-/aws-sign2-0.7.0.tgz";
        sha1 = "b46e890934a9591f2d2f6f86d7e6a9f1b3fe76a8";
      };
    };
    "aws4-1.8.0" = {
      name = "aws4";
      packageName = "aws4";
      version = "1.8.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/aws4/-/aws4-1.8.0.tgz";
        sha512 = "ReZxvNHIOv88FlT7rxcXIIC0fPt4KZqZbOlivyWtXLt8ESx84zd3kMC6iK5jVeS2qt+g7ftS7ye4fi06X5rtRQ==";
      };
    };
    "balanced-match-1.0.0" = {
      name = "balanced-match";
      packageName = "balanced-match";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.0.tgz";
        sha1 = "89b4d199ab2bee49de164ea02b89ce462d71b767";
      };
    };
    "bcrypt-pbkdf-1.0.2" = {
      name = "bcrypt-pbkdf";
      packageName = "bcrypt-pbkdf";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/bcrypt-pbkdf/-/bcrypt-pbkdf-1.0.2.tgz";
        sha1 = "a4301d389b6a43f9b67ff3ca11a3f6637e360e9e";
      };
    };
    "bluebird-2.11.0" = {
      name = "bluebird";
      packageName = "bluebird";
      version = "2.11.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/bluebird/-/bluebird-2.11.0.tgz";
        sha1 = "534b9033c022c9579c56ba3b3e5a5caafbb650e1";
      };
    };
    "brace-expansion-1.1.11" = {
      name = "brace-expansion";
      packageName = "brace-expansion";
      version = "1.1.11";
      src = fetchurl {
        url = "https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz";
        sha512 = "iCuPHDFgrHX7H2vEI/5xpz07zSHB00TpugqhmYtVmMO6518mCuRMoOYFldEBl0g187ufozdaHgWKcYFb61qGiA==";
      };
    };
    "caseless-0.12.0" = {
      name = "caseless";
      packageName = "caseless";
      version = "0.12.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/caseless/-/caseless-0.12.0.tgz";
        sha1 = "1b681c21ff84033c826543090689420d187151dc";
      };
    };
    "colors-1.3.3" = {
      name = "colors";
      packageName = "colors";
      version = "1.3.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/colors/-/colors-1.3.3.tgz";
        sha512 = "mmGt/1pZqYRjMxB1axhTo16/snVZ5krrKkcmMeVKxzECMMXoCgnvTPp10QgHfcbQZw8Dq2jMNG6je4JlWU0gWg==";
      };
    };
    "combined-stream-1.0.7" = {
      name = "combined-stream";
      packageName = "combined-stream";
      version = "1.0.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.7.tgz";
        sha512 = "brWl9y6vOB1xYPZcpZde3N9zDByXTosAeMDo4p1wzo6UMOX4vumB+TP1RZ76sfE6Md68Q0NJSrE/gbezd4Ul+w==";
      };
    };
    "concat-map-0.0.1" = {
      name = "concat-map";
      packageName = "concat-map";
      version = "0.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz";
        sha1 = "d8a96bd77fd68df7793a73036a3ba0d5405d477b";
      };
    };
    "core-js-2.6.2" = {
      name = "core-js";
      packageName = "core-js";
      version = "2.6.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/core-js/-/core-js-2.6.2.tgz";
        sha512 = "NdBPF/RVwPW6jr0NCILuyN9RiqLo2b1mddWHkUL+VnvcB7dzlnBJ1bXYntjpTGOgkZiiLWj2JxmOr7eGE3qK6g==";
      };
    };
    "core-util-is-1.0.2" = {
      name = "core-util-is";
      packageName = "core-util-is";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.2.tgz";
        sha1 = "b5fd54220aa2bc5ab57aab7140c940754503c1a7";
      };
    };
    "dashdash-1.14.1" = {
      name = "dashdash";
      packageName = "dashdash";
      version = "1.14.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/dashdash/-/dashdash-1.14.1.tgz";
        sha1 = "853cfa0f7cbe2fed5de20326b8dd581035f6e2f0";
      };
    };
    "del-2.2.2" = {
      name = "del";
      packageName = "del";
      version = "2.2.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/del/-/del-2.2.2.tgz";
        sha1 = "c12c981d067846c84bcaf862cff930d907ffd1a8";
      };
    };
    "delayed-stream-1.0.0" = {
      name = "delayed-stream";
      packageName = "delayed-stream";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz";
        sha1 = "df3ae199acadfb7d440aaae0b29e2272b24ec619";
      };
    };
    "ecc-jsbn-0.1.2" = {
      name = "ecc-jsbn";
      packageName = "ecc-jsbn";
      version = "0.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/ecc-jsbn/-/ecc-jsbn-0.1.2.tgz";
        sha1 = "3a83a904e54353287874c564b7549386849a98c9";
      };
    };
    "emitter-mixin-0.0.3" = {
      name = "emitter-mixin";
      packageName = "emitter-mixin";
      version = "0.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/emitter-mixin/-/emitter-mixin-0.0.3.tgz";
        sha1 = "5948cb286f2e48edc3b251a7cfc1f7883396d65c";
      };
    };
    "errno-0.1.7" = {
      name = "errno";
      packageName = "errno";
      version = "0.1.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/errno/-/errno-0.1.7.tgz";
        sha512 = "MfrRBDWzIWifgq6tJj60gkAwtLNb6sQPlcFrSOflcP1aFmmruKQ2wRnze/8V6kgyz7H3FF8Npzv78mZ7XLLflg==";
      };
    };
    "escape-string-regexp-1.0.5" = {
      name = "escape-string-regexp";
      packageName = "escape-string-regexp";
      version = "1.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz";
        sha1 = "1b61c0562190a8dff6ae3bb2cf0200ca130b86d4";
      };
    };
    "extend-1.2.1" = {
      name = "extend";
      packageName = "extend";
      version = "1.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/extend/-/extend-1.2.1.tgz";
        sha1 = "a0f5fd6cfc83a5fe49ef698d60ec8a624dd4576c";
      };
    };
    "extend-3.0.2" = {
      name = "extend";
      packageName = "extend";
      version = "3.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/extend/-/extend-3.0.2.tgz";
        sha512 = "fjquC59cD7CyW6urNXK0FBufkZcoiGG80wTuPujX590cB5Ttln20E2UB4S/WARVqhXffZl2LNgS+gQdPIIim/g==";
      };
    };
    "extsprintf-1.3.0" = {
      name = "extsprintf";
      packageName = "extsprintf";
      version = "1.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/extsprintf/-/extsprintf-1.3.0.tgz";
        sha1 = "96918440e3041a7a414f8c52e3c574eb3c3e1e05";
      };
    };
    "fast-deep-equal-2.0.1" = {
      name = "fast-deep-equal";
      packageName = "fast-deep-equal";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-2.0.1.tgz";
        sha1 = "7b05218ddf9667bf7f370bf7fdb2cb15fdd0aa49";
      };
    };
    "fast-json-stable-stringify-2.0.0" = {
      name = "fast-json-stable-stringify";
      packageName = "fast-json-stable-stringify";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.0.0.tgz";
        sha1 = "d5142c0caee6b1189f87d3a76111064f86c8bbf2";
      };
    };
    "forever-agent-0.6.1" = {
      name = "forever-agent";
      packageName = "forever-agent";
      version = "0.6.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/forever-agent/-/forever-agent-0.6.1.tgz";
        sha1 = "fbc71f0c41adeb37f96c577ad1ed42d8fdacca91";
      };
    };
    "form-data-2.3.3" = {
      name = "form-data";
      packageName = "form-data";
      version = "2.3.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/form-data/-/form-data-2.3.3.tgz";
        sha512 = "1lLKB2Mu3aGP1Q/2eCOx0fNbRMe7XdwktwOruhfqqd0rIJWwN4Dh+E3hrPSlDCXnSR7UtZ1N38rVXm+6+MEhJQ==";
      };
    };
    "fs.realpath-1.0.0" = {
      name = "fs.realpath";
      packageName = "fs.realpath";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz";
        sha1 = "1504ad2523158caa40db4a2787cb01411994ea4f";
      };
    };
    "getpass-0.1.7" = {
      name = "getpass";
      packageName = "getpass";
      version = "0.1.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/getpass/-/getpass-0.1.7.tgz";
        sha1 = "5eff8e3e684d569ae4cb2b1282604e8ba62149fa";
      };
    };
    "glob-7.1.3" = {
      name = "glob";
      packageName = "glob";
      version = "7.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/glob/-/glob-7.1.3.tgz";
        sha512 = "vcfuiIxogLV4DlGBHIUOwI0IbrJ8HWPc4MU7HzviGeNho/UJDfi6B5p3sHeWIQ0KGIU0Jpxi5ZHxemQfLkkAwQ==";
      };
    };
    "globby-5.0.0" = {
      name = "globby";
      packageName = "globby";
      version = "5.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/globby/-/globby-5.0.0.tgz";
        sha1 = "ebd84667ca0dbb330b99bcfc68eac2bc54370e0d";
      };
    };
    "graceful-fs-4.1.15" = {
      name = "graceful-fs";
      packageName = "graceful-fs";
      version = "4.1.15";
      src = fetchurl {
        url = "https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.1.15.tgz";
        sha512 = "6uHUhOPEBgQ24HM+r6b/QwWfZq+yiFcipKFrOFiBEnWdy5sdzYoi+pJeQaPI5qOLRFqWmAXUPQNsielzdLoecA==";
      };
    };
    "har-schema-2.0.0" = {
      name = "har-schema";
      packageName = "har-schema";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/har-schema/-/har-schema-2.0.0.tgz";
        sha1 = "a94c2224ebcac04782a0d9035521f24735b7ec92";
      };
    };
    "har-validator-5.1.3" = {
      name = "har-validator";
      packageName = "har-validator";
      version = "5.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/har-validator/-/har-validator-5.1.3.tgz";
        sha512 = "sNvOCzEQNr/qrvJgc3UG/kD4QtlHycrzwS+6mfTrrSq97BvaYcPZZI1ZSqGSPR73Cxn4LKTD4PttRwfU7jWq5g==";
      };
    };
    "hoek-4.2.1" = {
      name = "hoek";
      packageName = "hoek";
      version = "4.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/hoek/-/hoek-4.2.1.tgz";
        sha512 = "QLg82fGkfnJ/4iy1xZ81/9SIJiq1NGFUMGs6ParyjBZr6jW2Ufj/snDqTHixNlHdPNwN2RLVD0Pi3igeK9+JfA==";
      };
    };
    "http-signature-1.2.0" = {
      name = "http-signature";
      packageName = "http-signature";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/http-signature/-/http-signature-1.2.0.tgz";
        sha1 = "9aecd925114772f3d95b65a60abb8f7c18fbace1";
      };
    };
    "inflight-1.0.6" = {
      name = "inflight";
      packageName = "inflight";
      version = "1.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz";
        sha1 = "49bd6331d7d02d0c09bc910a1075ba8165b56df9";
      };
    };
    "inherits-2.0.3" = {
      name = "inherits";
      packageName = "inherits";
      version = "2.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/inherits/-/inherits-2.0.3.tgz";
        sha1 = "633c2c83e3da42a502f52466022480f4208261de";
      };
    };
    "is-path-cwd-1.0.0" = {
      name = "is-path-cwd";
      packageName = "is-path-cwd";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-path-cwd/-/is-path-cwd-1.0.0.tgz";
        sha1 = "d225ec23132e89edd38fda767472e62e65f1106d";
      };
    };
    "is-path-in-cwd-1.0.1" = {
      name = "is-path-in-cwd";
      packageName = "is-path-in-cwd";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-path-in-cwd/-/is-path-in-cwd-1.0.1.tgz";
        sha512 = "FjV1RTW48E7CWM7eE/J2NJvAEEVektecDBVBE5Hh3nM1Jd0kvhHtX68Pr3xsDf857xt3Y4AkwVULK1Vku62aaQ==";
      };
    };
    "is-path-inside-1.0.1" = {
      name = "is-path-inside";
      packageName = "is-path-inside";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-path-inside/-/is-path-inside-1.0.1.tgz";
        sha1 = "8ef5b7de50437a3fdca6b4e865ef7aa55cb48036";
      };
    };
    "is-typedarray-1.0.0" = {
      name = "is-typedarray";
      packageName = "is-typedarray";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-typedarray/-/is-typedarray-1.0.0.tgz";
        sha1 = "e479c80858df0c1b11ddda6940f96011fcda4a9a";
      };
    };
    "isemail-2.2.1" = {
      name = "isemail";
      packageName = "isemail";
      version = "2.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/isemail/-/isemail-2.2.1.tgz";
        sha1 = "0353d3d9a62951080c262c2aa0a42b8ea8e9e2a6";
      };
    };
    "isstream-0.1.2" = {
      name = "isstream";
      packageName = "isstream";
      version = "0.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/isstream/-/isstream-0.1.2.tgz";
        sha1 = "47e63f7af55afa6f92e1500e690eb8b8529c099a";
      };
    };
    "items-2.1.2" = {
      name = "items";
      packageName = "items";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/items/-/items-2.1.2.tgz";
        sha512 = "kezcEqgB97BGeZZYtX/MA8AG410ptURstvnz5RAgyFZ8wQFPMxHY8GpTq+/ZHKT3frSlIthUq7EvLt9xn3TvXg==";
      };
    };
    "joi-9.2.0" = {
      name = "joi";
      packageName = "joi";
      version = "9.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/joi/-/joi-9.2.0.tgz";
        sha1 = "3385ac790192130cbe230e802ec02c9215bbfeda";
      };
    };
    "jsbn-0.1.1" = {
      name = "jsbn";
      packageName = "jsbn";
      version = "0.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsbn/-/jsbn-0.1.1.tgz";
        sha1 = "a5e654c2e5a2deb5f201d96cefbca80c0ef2f513";
      };
    };
    "json-schema-0.2.3" = {
      name = "json-schema";
      packageName = "json-schema";
      version = "0.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-schema/-/json-schema-0.2.3.tgz";
        sha1 = "b480c892e59a2f05954ce727bd3f2a4e882f9e13";
      };
    };
    "json-schema-traverse-0.4.1" = {
      name = "json-schema-traverse";
      packageName = "json-schema-traverse";
      version = "0.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz";
        sha512 = "xbbCH5dCYU5T8LcEhhuh7HJ88HXuW3qsI3Y0zOZFKfZEHcpWiHU/Jxzk629Brsab/mMiHQti9wMP+845RPe3Vg==";
      };
    };
    "json-stringify-safe-5.0.1" = {
      name = "json-stringify-safe";
      packageName = "json-stringify-safe";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz";
        sha1 = "1296a2d58fd45f19a0f6ce01d65701e2c735b6eb";
      };
    };
    "jsprim-1.4.1" = {
      name = "jsprim";
      packageName = "jsprim";
      version = "1.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsprim/-/jsprim-1.4.1.tgz";
        sha1 = "313e66bc1e5cc06e438bc1b7499c2e5c56acb6a2";
      };
    };
    "junk-1.0.3" = {
      name = "junk";
      packageName = "junk";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/junk/-/junk-1.0.3.tgz";
        sha1 = "87be63488649cbdca6f53ab39bec9ccd2347f592";
      };
    };
    "maximatch-0.1.0" = {
      name = "maximatch";
      packageName = "maximatch";
      version = "0.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/maximatch/-/maximatch-0.1.0.tgz";
        sha1 = "86cd8d6b04c9f307c05a6b9419906d0360fb13a2";
      };
    };
    "mime-db-1.37.0" = {
      name = "mime-db";
      packageName = "mime-db";
      version = "1.37.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-db/-/mime-db-1.37.0.tgz";
        sha512 = "R3C4db6bgQhlIhPU48fUtdVmKnflq+hRdad7IyKhtFj06VPNVdk2RhiYL3UjQIlso8L+YxAtFkobT0VK+S/ybg==";
      };
    };
    "mime-types-2.1.21" = {
      name = "mime-types";
      packageName = "mime-types";
      version = "2.1.21";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-types/-/mime-types-2.1.21.tgz";
        sha512 = "3iL6DbwpyLzjR3xHSFNFeb9Nz/M8WDkX33t1GFQnFOllWk8pOrh/LSrB5OXlnlW5P9LH73X6loW/eogc+F5lJg==";
      };
    };
    "minimatch-3.0.4" = {
      name = "minimatch";
      packageName = "minimatch";
      version = "3.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimatch/-/minimatch-3.0.4.tgz";
        sha512 = "yJHVQEhyqPLUTgt9B83PXu6W3rx4MvvHvSUvToogpwoGDOUQ+yDrR0HRot+yOCdCO7u4hX3pWft6kWBBcqh0UA==";
      };
    };
    "minimist-0.0.8" = {
      name = "minimist";
      packageName = "minimist";
      version = "0.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimist/-/minimist-0.0.8.tgz";
        sha1 = "857fcabfc3397d2625b8228262e86aa7a011b05d";
      };
    };
    "minimist-1.2.0" = {
      name = "minimist";
      packageName = "minimist";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimist/-/minimist-1.2.0.tgz";
        sha1 = "a35008b20f41383eec1fb914f4cd5df79a264284";
      };
    };
    "mkdirp-0.5.1" = {
      name = "mkdirp";
      packageName = "mkdirp";
      version = "0.5.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.1.tgz";
        sha1 = "30057438eac6cf7f8c4767f38648d6697d75c903";
      };
    };
    "moment-2.23.0" = {
      name = "moment";
      packageName = "moment";
      version = "2.23.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/moment/-/moment-2.23.0.tgz";
        sha512 = "3IE39bHVqFbWWaPOMHZF98Q9c3LDKGTmypMiTM2QygGXXElkFWIH7GxfmlwmY2vwa+wmNsoYZmG2iusf1ZjJoA==";
      };
    };
    "nan-2.3.5" = {
      name = "nan";
      packageName = "nan";
      version = "2.3.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/nan/-/nan-2.3.5.tgz";
        sha1 = "822a0dc266290ce4cd3a12282ca3e7e364668a08";
      };
    };
    "oauth-sign-0.9.0" = {
      name = "oauth-sign";
      packageName = "oauth-sign";
      version = "0.9.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/oauth-sign/-/oauth-sign-0.9.0.tgz";
        sha512 = "fexhUFFPTGV8ybAtSIGbV6gOkSv8UtRbDBnAyLQw4QPKkgNlsH2ByPGtMUqdWkos6YCRmAqViwgZrJc/mRDzZQ==";
      };
    };
    "object-assign-4.1.1" = {
      name = "object-assign";
      packageName = "object-assign";
      version = "4.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/object-assign/-/object-assign-4.1.1.tgz";
        sha1 = "2109adc7965887cfc05cbbd442cac8bfbb360863";
      };
    };
    "once-1.4.0" = {
      name = "once";
      packageName = "once";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/once/-/once-1.4.0.tgz";
        sha1 = "583b1aa775961d4b113ac17d9c50baef9dd76bd1";
      };
    };
    "path-is-absolute-1.0.1" = {
      name = "path-is-absolute";
      packageName = "path-is-absolute";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz";
        sha1 = "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f";
      };
    };
    "path-is-inside-1.0.2" = {
      name = "path-is-inside";
      packageName = "path-is-inside";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-is-inside/-/path-is-inside-1.0.2.tgz";
        sha1 = "365417dede44430d1c11af61027facf074bdfc53";
      };
    };
    "performance-now-2.1.0" = {
      name = "performance-now";
      packageName = "performance-now";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/performance-now/-/performance-now-2.1.0.tgz";
        sha1 = "6309f4e0e5fa913ec1c69307ae364b4b377c9e7b";
      };
    };
    "pify-2.3.0" = {
      name = "pify";
      packageName = "pify";
      version = "2.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/pify/-/pify-2.3.0.tgz";
        sha1 = "ed141a6ac043a849ea588498e7dca8b15330e90c";
      };
    };
    "pinkie-2.0.4" = {
      name = "pinkie";
      packageName = "pinkie";
      version = "2.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/pinkie/-/pinkie-2.0.4.tgz";
        sha1 = "72556b80cfa0d48a974e80e77248e80ed4f7f870";
      };
    };
    "pinkie-promise-2.0.1" = {
      name = "pinkie-promise";
      packageName = "pinkie-promise";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/pinkie-promise/-/pinkie-promise-2.0.1.tgz";
        sha1 = "2135d6dfa7a358c069ac9b178776288228450ffa";
      };
    };
    "promise-7.3.1" = {
      name = "promise";
      packageName = "promise";
      version = "7.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/promise/-/promise-7.3.1.tgz";
        sha512 = "nolQXZ/4L+bP/UGlkfaIujX9BKxGwmQ9OT4mOt5yvy8iK1h3wqTEJCijzGANTCCl9nWjY41juyAn2K3Q1hLLTg==";
      };
    };
    "promise-streams-2.1.1" = {
      name = "promise-streams";
      packageName = "promise-streams";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/promise-streams/-/promise-streams-2.1.1.tgz";
        sha1 = "7309f1d3698330ea7fadab1922f13989229ac85a";
      };
    };
    "prr-1.0.1" = {
      name = "prr";
      packageName = "prr";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/prr/-/prr-1.0.1.tgz";
        sha1 = "d3fc114ba06995a45ec6893f484ceb1d78f5f476";
      };
    };
    "psl-1.1.31" = {
      name = "psl";
      packageName = "psl";
      version = "1.1.31";
      src = fetchurl {
        url = "https://registry.npmjs.org/psl/-/psl-1.1.31.tgz";
        sha512 = "/6pt4+C+T+wZUieKR620OpzN/LlnNKuWjy1iFLQ/UG35JqHlR/89MP1d96dUfkf6Dne3TuLQzOYEYshJ+Hx8mw==";
      };
    };
    "pty.js-0.3.1" = {
      name = "pty.js";
      packageName = "pty.js";
      version = "0.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/pty.js/-/pty.js-0.3.1.tgz";
        sha1 = "81f5bed332d6e5e7ab685688d1ba0373410d51b5";
      };
    };
    "punycode-1.4.1" = {
      name = "punycode";
      packageName = "punycode";
      version = "1.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/punycode/-/punycode-1.4.1.tgz";
        sha1 = "c0d5a63b2718800ad8e1eb0fa5269c84dd41845e";
      };
    };
    "punycode-2.1.1" = {
      name = "punycode";
      packageName = "punycode";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/punycode/-/punycode-2.1.1.tgz";
        sha512 = "XRsRjdf+j5ml+y/6GKHPZbrF/8p2Yga0JPtdqTIY2Xe5ohJPD9saDJJLPvp9+NSBprVvevdXZybnj2cv8OEd0A==";
      };
    };
    "qs-6.5.2" = {
      name = "qs";
      packageName = "qs";
      version = "6.5.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/qs/-/qs-6.5.2.tgz";
        sha512 = "N5ZAX4/LxJmF+7wN74pUD6qAh9/wnvdQcjq9TZjevvXzSUo7bfmw91saqMjzGS2xq91/odN2dW/WOl7qQHNDGA==";
      };
    };
    "recursive-copy-2.0.9" = {
      name = "recursive-copy";
      packageName = "recursive-copy";
      version = "2.0.9";
      src = fetchurl {
        url = "https://registry.npmjs.org/recursive-copy/-/recursive-copy-2.0.9.tgz";
        sha512 = "0AkHV+QtfS/1jW01z3m2t/TRTW56Fpc+xYbsoa/bqn8BCYPwmsaNjlYmUU/dyGg9w8MmGoUWihU5W+s+qjxvBQ==";
      };
    };
    "request-2.88.0" = {
      name = "request";
      packageName = "request";
      version = "2.88.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/request/-/request-2.88.0.tgz";
        sha512 = "NAqBSrijGLZdM0WZNsInLJpkJokL72XYjUpnB0iwsRgxh7dB6COrHnTBNwN0E+lHDAJzu7kLAkDeY08z2/A0hg==";
      };
    };
    "rimraf-2.6.3" = {
      name = "rimraf";
      packageName = "rimraf";
      version = "2.6.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/rimraf/-/rimraf-2.6.3.tgz";
        sha512 = "mwqeW5XsA2qAejG46gYdENaxXjx9onRNCfn7L0duuP4hCuTIi/QO7PDK07KJfp1d+izWPrzEJDcSqBa0OZQriA==";
      };
    };
    "rx-4.1.0" = {
      name = "rx";
      packageName = "rx";
      version = "4.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/rx/-/rx-4.1.0.tgz";
        sha1 = "a5f13ff79ef3b740fe30aa803fb09f98805d4782";
      };
    };
    "safe-buffer-5.1.2" = {
      name = "safe-buffer";
      packageName = "safe-buffer";
      version = "5.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.1.2.tgz";
        sha512 = "Gd2UZBJDkXlY7GbJxfsE8/nvKkUEU1G38c1siN6QP6a9PT9MmHB8GnpscSmMJSoF8LOIrt8ud/wPtojys4G6+g==";
      };
    };
    "safer-buffer-2.1.2" = {
      name = "safer-buffer";
      packageName = "safer-buffer";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz";
        sha512 = "YZo3K82SD7Riyi0E1EQPojLz7kpepnSQI9IyPbHHg1XXXevb5dJI7tpyN2ADxGcQbHG7vcyRHk0cbwqcQriUtg==";
      };
    };
    "slash-1.0.0" = {
      name = "slash";
      packageName = "slash";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/slash/-/slash-1.0.0.tgz";
        sha1 = "c41f2f6c39fc16d1cd17ad4b5d896114ae470d55";
      };
    };
    "split-1.0.1" = {
      name = "split";
      packageName = "split";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/split/-/split-1.0.1.tgz";
        sha512 = "mTyOoPbrivtXnwnIxZRFYRrPNtEFKlpB2fvjSnCQUiAA6qAZzqwna5envK4uk6OIeP17CsdF3rSBGYVBsU0Tkg==";
      };
    };
    "sshpk-1.16.0" = {
      name = "sshpk";
      packageName = "sshpk";
      version = "1.16.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/sshpk/-/sshpk-1.16.0.tgz";
        sha512 = "Zhev35/y7hRMcID/upReIvRse+I9SVhyVre/KTJSJQWMz3C3+G+HpO7m1wK/yckEtujKZ7dS4hkVxAnmHaIGVQ==";
      };
    };
    "stream-snitch-0.0.3" = {
      name = "stream-snitch";
      packageName = "stream-snitch";
      version = "0.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/stream-snitch/-/stream-snitch-0.0.3.tgz";
        sha1 = "897a78f13a2714fa844aa77be15477a896d852a9";
      };
    };
    "through-2.3.8" = {
      name = "through";
      packageName = "through";
      version = "2.3.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/through/-/through-2.3.8.tgz";
        sha1 = "0dd4c9ffaabc357960b1b724115d7e0e86a2e1f5";
      };
    };
    "topo-2.0.2" = {
      name = "topo";
      packageName = "topo";
      version = "2.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/topo/-/topo-2.0.2.tgz";
        sha1 = "cd5615752539057c0dc0491a621c3bc6fbe1d182";
      };
    };
    "tough-cookie-2.4.3" = {
      name = "tough-cookie";
      packageName = "tough-cookie";
      version = "2.4.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/tough-cookie/-/tough-cookie-2.4.3.tgz";
        sha512 = "Q5srk/4vDM54WJsJio3XNn6K2sCG+CQ8G5Wz6bZhRZoAe/+TxjWB/GlFAnYEbkYVlON9FMk/fE3h2RLpPXo4lQ==";
      };
    };
    "tunnel-agent-0.6.0" = {
      name = "tunnel-agent";
      packageName = "tunnel-agent";
      version = "0.6.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/tunnel-agent/-/tunnel-agent-0.6.0.tgz";
        sha1 = "27a5dea06b36b04a0a9966774b290868f0fc40fd";
      };
    };
    "tweetnacl-0.14.5" = {
      name = "tweetnacl";
      packageName = "tweetnacl";
      version = "0.14.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/tweetnacl/-/tweetnacl-0.14.5.tgz";
        sha1 = "5ae68177f192d4456269d108afa93ff8743f4f64";
      };
    };
    "urbit-runner-git://github.com/urbit/runner-js#ee24550" = {
      name = "urbit-runner";
      packageName = "urbit-runner";
      version = "1.0.0";
      src = fetchgit {
        url = "git://github.com/urbit/runner-js";
        rev = "ee2455015dc4ea243d0e0ec623975632c9249c4e";
        sha256 = "49912d11845139bd940063d4c4a34ed568fe992e975869f9d4c3d6c58fc8daa9";
      };
    };
    "uri-js-4.2.2" = {
      name = "uri-js";
      packageName = "uri-js";
      version = "4.2.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/uri-js/-/uri-js-4.2.2.tgz";
        sha512 = "KY9Frmirql91X2Qgjry0Wd4Y+YTdrdZheS8TFwvkbLWf/G5KNJDCh6pKL5OZctEW4+0Baa5idK2ZQuELRwPznQ==";
      };
    };
    "uuid-3.3.2" = {
      name = "uuid";
      packageName = "uuid";
      version = "3.3.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/uuid/-/uuid-3.3.2.tgz";
        sha512 = "yXJmeNaw3DnnKAOKJE51sL/ZaYfWJRl1pK9dr19YFCu0ObS231AB1/LbqTKRAQ5kw8A90rA6fr4riOUpTZvQZA==";
      };
    };
    "verror-1.10.0" = {
      name = "verror";
      packageName = "verror";
      version = "1.10.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/verror/-/verror-1.10.0.tgz";
        sha1 = "3a105ca17053af55d6e270c1f8288682e18da400";
      };
    };
    "wait-on-2.1.2" = {
      name = "wait-on";
      packageName = "wait-on";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/wait-on/-/wait-on-2.1.2.tgz";
        sha512 = "Jm6pzZkbswtcRUXohxY1Ek5MrL16AwHj83drgW2FTQuglHuhZhVMyBLPIYG0rL1wvr5rdC1uzRuU/7Bc+B9Pwg==";
      };
    };
    "wrappy-1.0.2" = {
      name = "wrappy";
      packageName = "wrappy";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz";
        sha1 = "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f";
      };
    };
  };
  args = {
    name = "vere-tests";
    packageName = "vere-tests";
    version = "1.0.0";
    src = ../src;
    dependencies = [
      sources."ajv-6.7.0"
      sources."array-differ-1.0.0"
      sources."array-union-1.0.2"
      sources."array-uniq-1.0.3"
      sources."arrify-1.0.1"
      sources."asap-2.0.6"
      sources."asn1-0.2.4"
      sources."assert-plus-1.0.0"
      sources."asynckit-0.4.0"
      sources."aws-sign2-0.7.0"
      sources."aws4-1.8.0"
      sources."balanced-match-1.0.0"
      sources."bcrypt-pbkdf-1.0.2"
      sources."bluebird-2.11.0"
      sources."brace-expansion-1.1.11"
      sources."caseless-0.12.0"
      sources."colors-1.3.3"
      sources."combined-stream-1.0.7"
      sources."concat-map-0.0.1"
      sources."core-js-2.6.2"
      sources."core-util-is-1.0.2"
      sources."dashdash-1.14.1"
      sources."del-2.2.2"
      sources."delayed-stream-1.0.0"
      sources."ecc-jsbn-0.1.2"
      sources."emitter-mixin-0.0.3"
      sources."errno-0.1.7"
      sources."escape-string-regexp-1.0.5"
      sources."extend-1.2.1"
      sources."extsprintf-1.3.0"
      sources."fast-deep-equal-2.0.1"
      sources."fast-json-stable-stringify-2.0.0"
      sources."forever-agent-0.6.1"
      sources."form-data-2.3.3"
      sources."fs.realpath-1.0.0"
      sources."getpass-0.1.7"
      sources."glob-7.1.3"
      sources."globby-5.0.0"
      sources."graceful-fs-4.1.15"
      sources."har-schema-2.0.0"
      sources."har-validator-5.1.3"
      sources."hoek-4.2.1"
      sources."http-signature-1.2.0"
      sources."inflight-1.0.6"
      sources."inherits-2.0.3"
      sources."is-path-cwd-1.0.0"
      sources."is-path-in-cwd-1.0.1"
      sources."is-path-inside-1.0.1"
      sources."is-typedarray-1.0.0"
      sources."isemail-2.2.1"
      sources."isstream-0.1.2"
      sources."items-2.1.2"
      sources."joi-9.2.0"
      sources."jsbn-0.1.1"
      sources."json-schema-0.2.3"
      sources."json-schema-traverse-0.4.1"
      sources."json-stringify-safe-5.0.1"
      sources."jsprim-1.4.1"
      sources."junk-1.0.3"
      sources."maximatch-0.1.0"
      sources."mime-db-1.37.0"
      sources."mime-types-2.1.21"
      sources."minimatch-3.0.4"
      sources."minimist-0.0.8"
      sources."mkdirp-0.5.1"
      sources."moment-2.23.0"
      sources."nan-2.3.5"
      sources."oauth-sign-0.9.0"
      sources."object-assign-4.1.1"
      sources."once-1.4.0"
      sources."path-is-absolute-1.0.1"
      sources."path-is-inside-1.0.2"
      sources."performance-now-2.1.0"
      sources."pify-2.3.0"
      sources."pinkie-2.0.4"
      sources."pinkie-promise-2.0.1"
      sources."promise-7.3.1"
      sources."promise-streams-2.1.1"
      sources."prr-1.0.1"
      sources."psl-1.1.31"
      sources."pty.js-0.3.1"
      sources."punycode-2.1.1"
      sources."qs-6.5.2"
      sources."recursive-copy-2.0.9"
      (sources."request-2.88.0" // {
        dependencies = [
          sources."extend-3.0.2"
        ];
      })
      sources."rimraf-2.6.3"
      sources."rx-4.1.0"
      sources."safe-buffer-5.1.2"
      sources."safer-buffer-2.1.2"
      sources."slash-1.0.0"
      sources."split-1.0.1"
      sources."sshpk-1.16.0"
      sources."stream-snitch-0.0.3"
      sources."through-2.3.8"
      sources."topo-2.0.2"
      (sources."tough-cookie-2.4.3" // {
        dependencies = [
          sources."punycode-1.4.1"
        ];
      })
      sources."tunnel-agent-0.6.0"
      sources."tweetnacl-0.14.5"
      sources."urbit-runner-git://github.com/urbit/runner-js#ee24550"
      sources."uri-js-4.2.2"
      sources."uuid-3.3.2"
      sources."verror-1.10.0"
      (sources."wait-on-2.1.2" // {
        dependencies = [
          sources."minimist-1.2.0"
        ];
      })
      sources."wrappy-1.0.2"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "Test harness for the Urbit runtime";
      license = "MIT";
    };
    production = true;
    bypassCache = false;
  };
in
{
  tarball = nodeEnv.buildNodeSourceDist args;
  package = nodeEnv.buildNodePackage args;
  shell = nodeEnv.buildNodeShell args;
}
