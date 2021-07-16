{ nodeEnv, fetchurl }:

let
  sources = {
    "ajv-6.12.6" = {
      name = "ajv";
      packageName = "ajv";
      version = "6.12.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/ajv/-/ajv-6.12.6.tgz";
        sha512 = "j3fVLgvTo527anyYyJOGTYJbG+vnnQYvE0m5mmkc1TK+nxAppkCLMIL0aZ4dblVCNoGShhm+kzE4ZUykBoMg4g==";
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
    "aws4-1.11.0" = {
      name = "aws4";
      packageName = "aws4";
      version = "1.11.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/aws4/-/aws4-1.11.0.tgz";
        sha512 = "xh1Rl34h6Fi1DC2WWKfxUTVqRsNnr6LsKz2+hfwDxQJWmrx8+c7ylaqBMcHfl1U1r2dsifOvKX3LQuLNZ+XSvA==";
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
    "buffer-crc32-0.2.13" = {
      name = "buffer-crc32";
      packageName = "buffer-crc32";
      version = "0.2.13";
      src = fetchurl {
        url = "https://registry.npmjs.org/buffer-crc32/-/buffer-crc32-0.2.13.tgz";
        sha1 = "0d333e3f00eac50aa1454abd30ef8c2a5d9a7242";
      };
    };
    "buffer-from-1.1.1" = {
      name = "buffer-from";
      packageName = "buffer-from";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.1.tgz";
        sha512 = "MQcXEUbCKtEo7bhqEs6560Hyd4XaovZlO/k9V3hjVUF/zwW7KBVdSK4gIt/bzwS9MbR5qob+F5jusZsb0YQK2A==";
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
    "combined-stream-1.0.8" = {
      name = "combined-stream";
      packageName = "combined-stream";
      version = "1.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz";
        sha512 = "FQN4MRfuJeHf7cBbBMJFXhKSDq+2kAArBlmRBvcvFE5BB1HZKXtSFASDhdlz9zOYwxh8lDdnvmMOe/+5cdoEdg==";
      };
    };
    "concat-stream-1.6.2" = {
      name = "concat-stream";
      packageName = "concat-stream";
      version = "1.6.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/concat-stream/-/concat-stream-1.6.2.tgz";
        sha512 = "27HBghJxjiZtIk3Ycvn/4kbJk/1uZuJFfuPEns6LaEvpvG1f0hTea8lilrouyo9mVc2GWdcEZ8OLoGmSADlrCw==";
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
    "debug-2.6.9" = {
      name = "debug";
      packageName = "debug";
      version = "2.6.9";
      src = fetchurl {
        url = "https://registry.npmjs.org/debug/-/debug-2.6.9.tgz";
        sha512 = "bC7ElrdJaJnPbAP+1EotYvqZsb3ecl5wi6Bfi6BJTUcNowp6cvspg0jXznRTKDjm/E7AdgFBVeAPVMNcKGsHMA==";
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
    "es6-promise-4.2.8" = {
      name = "es6-promise";
      packageName = "es6-promise";
      version = "4.2.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/es6-promise/-/es6-promise-4.2.8.tgz";
        sha512 = "HJDGx5daxeIvxdBxvG2cb9g4tEvwIk3i8+nhX0yGrYmZUzbkdg8QbDevheDB8gd0//uPj4c1EQua8Q+MViT0/w==";
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
    "extract-zip-1.7.0" = {
      name = "extract-zip";
      packageName = "extract-zip";
      version = "1.7.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/extract-zip/-/extract-zip-1.7.0.tgz";
        sha512 = "xoh5G1W/PB0/27lXgMQyIhP5DSY/LhoCsOyZgb+6iMmRtCwVBo55uKaMoEYrDCKQhWvqEip5ZPKAc6eFNyf/MA==";
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
    "fast-deep-equal-3.1.3" = {
      name = "fast-deep-equal";
      packageName = "fast-deep-equal";
      version = "3.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz";
        sha512 = "f3qQ9oQy9j2AhBe/H9VC91wLmKBCCU/gDOnKNAYG5hswO7BLKj09Hc5HYNz9cGI++xlpDCIgDaitVs03ATR84Q==";
      };
    };
    "fast-json-stable-stringify-2.1.0" = {
      name = "fast-json-stable-stringify";
      packageName = "fast-json-stable-stringify";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz";
        sha512 = "lhd/wF+Lk98HZoTCtlVraHtfh5XYijIjalXck7saUtuanSDyLMxnHhSXEDJqHxD7msR8D0uCmqlkwjCV8xvwHw==";
      };
    };
    "fd-slicer-1.1.0" = {
      name = "fd-slicer";
      packageName = "fd-slicer";
      version = "1.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fd-slicer/-/fd-slicer-1.1.0.tgz";
        sha1 = "25c7c89cb1f9077f8891bbe61d8f390eae256f1e";
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
    "fs-extra-1.0.0" = {
      name = "fs-extra";
      packageName = "fs-extra";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fs-extra/-/fs-extra-1.0.0.tgz";
        sha1 = "cd3ce5f7e7cb6145883fcae3191e9877f8587950";
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
    "graceful-fs-4.2.6" = {
      name = "graceful-fs";
      packageName = "graceful-fs";
      version = "4.2.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.6.tgz";
        sha512 = "nTnJ528pbqxYanhpDYsi4Rd8MAeaBA67+RZ10CM1m3bTAVFEDcd5AuA4a6W5YkGZ1iNXHzZz8T6TBKLeBuNriQ==";
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
    "har-validator-5.1.5" = {
      name = "har-validator";
      packageName = "har-validator";
      version = "5.1.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/har-validator/-/har-validator-5.1.5.tgz";
        sha512 = "nmT2T0lljbxdQZfspsno9hgrG3Uir6Ks5afism62poxqBM6sDnMEuPmzTq8XN0OEwqKLLdh1jQI3qyE66Nzb3w==";
      };
    };
    "hasha-2.2.0" = {
      name = "hasha";
      packageName = "hasha";
      version = "2.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/hasha/-/hasha-2.2.0.tgz";
        sha1 = "78d7cbfc1e6d66303fe79837365984517b2f6ee1";
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
    "inherits-2.0.4" = {
      name = "inherits";
      packageName = "inherits";
      version = "2.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz";
        sha512 = "k/vGaX4/Yla3WzyMCvTQOXYeIHvqOKtnqBduzTHpzpQZzAskKMhZ2K+EnBiSM9zGSoIFeMpXKxa4dYeZIQqewQ==";
      };
    };
    "is-stream-1.1.0" = {
      name = "is-stream";
      packageName = "is-stream";
      version = "1.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-stream/-/is-stream-1.1.0.tgz";
        sha1 = "12d4a3dd4e68e0b79ceb8dbc84173ae80d91ca44";
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
    "isarray-1.0.0" = {
      name = "isarray";
      packageName = "isarray";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz";
        sha1 = "bb935d48582cba168c06834957a54a3e07124f11";
      };
    };
    "isexe-2.0.0" = {
      name = "isexe";
      packageName = "isexe";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz";
        sha1 = "e8fbf374dc556ff8947a10dcb0572d633f2cfa10";
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
    "jsonfile-2.4.0" = {
      name = "jsonfile";
      packageName = "jsonfile";
      version = "2.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsonfile/-/jsonfile-2.4.0.tgz";
        sha1 = "3736a2b428b87bbda0cc83b53fa3d633a35c2ae8";
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
    "kew-0.7.0" = {
      name = "kew";
      packageName = "kew";
      version = "0.7.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/kew/-/kew-0.7.0.tgz";
        sha1 = "79d93d2d33363d6fdd2970b335d9141ad591d79b";
      };
    };
    "klaw-1.3.1" = {
      name = "klaw";
      packageName = "klaw";
      version = "1.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/klaw/-/klaw-1.3.1.tgz";
        sha1 = "4088433b46b3b1ba259d78785d8e96f73ba02439";
      };
    };
    "mime-db-1.48.0" = {
      name = "mime-db";
      packageName = "mime-db";
      version = "1.48.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-db/-/mime-db-1.48.0.tgz";
        sha512 = "FM3QwxV+TnZYQ2aRqhlKBMHxk10lTbMt3bBkMAp54ddrNeVSfcQYOOKuGuy3Ddrm38I04If834fOUSq1yzslJQ==";
      };
    };
    "mime-types-2.1.31" = {
      name = "mime-types";
      packageName = "mime-types";
      version = "2.1.31";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-types/-/mime-types-2.1.31.tgz";
        sha512 = "XGZnNzm3QvgKxa8dpzyhFTHmpP3l5YNusmne07VUOXxou9CqUqYa/HBy124RqtVh/O2pECas/MOcsDgpilPOPg==";
      };
    };
    "minimist-1.2.5" = {
      name = "minimist";
      packageName = "minimist";
      version = "1.2.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimist/-/minimist-1.2.5.tgz";
        sha512 = "FM9nNUYrRBAELZQT3xeZQ7fmMOBg6nWNmJKTcgsJeaLstP/UODVpGsr5OhXhhXg6f+qtJ8uiZ+PUxkDWcgIXLw==";
      };
    };
    "mkdirp-0.5.5" = {
      name = "mkdirp";
      packageName = "mkdirp";
      version = "0.5.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.5.tgz";
        sha512 = "NKmAlESf6jMGym1++R0Ra7wvhV+wFW63FaSOFPwRahvea0gMUcGUhVeAg/0BC0wiv9ih5NYPB1Wn1UEI1/L+xQ==";
      };
    };
    "ms-2.0.0" = {
      name = "ms";
      packageName = "ms";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ms/-/ms-2.0.0.tgz";
        sha1 = "5608aeadfc00be6c2901df5f9861788de0d597c8";
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
    "pend-1.2.0" = {
      name = "pend";
      packageName = "pend";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/pend/-/pend-1.2.0.tgz";
        sha1 = "7a57eb550a6783f9115331fcf4663d5c8e007a50";
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
    "phantomjs-prebuilt-2.1.16" = {
      name = "phantomjs-prebuilt";
      packageName = "phantomjs-prebuilt";
      version = "2.1.16";
      src = fetchurl {
        url = "https://registry.npmjs.org/phantomjs-prebuilt/-/phantomjs-prebuilt-2.1.16.tgz";
        sha1 = "efd212a4a3966d3647684ea8ba788549be2aefef";
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
    "process-nextick-args-2.0.1" = {
      name = "process-nextick-args";
      packageName = "process-nextick-args";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/process-nextick-args/-/process-nextick-args-2.0.1.tgz";
        sha512 = "3ouUOpQhtgrbOa17J7+uxOTpITYWaGP7/AhoR3+A+/1e9skrzelGi/dXzEYyvbxubEF6Wn2ypscTKiKJFFn1ag==";
      };
    };
    "progress-1.1.8" = {
      name = "progress";
      packageName = "progress";
      version = "1.1.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/progress/-/progress-1.1.8.tgz";
        sha1 = "e260c78f6161cdd9b0e56cc3e0a85de17c7a57be";
      };
    };
    "psl-1.8.0" = {
      name = "psl";
      packageName = "psl";
      version = "1.8.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/psl/-/psl-1.8.0.tgz";
        sha512 = "RIdOzyoavK+hA18OGGWDqUTsCLhtA7IcZ/6NCs4fFJaHBDab+pDDmDIByWFRQJq2Cd7r1OoQxBGKOaztq+hjIQ==";
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
    "readable-stream-2.3.7" = {
      name = "readable-stream";
      packageName = "readable-stream";
      version = "2.3.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.7.tgz";
        sha512 = "Ebho8K4jIbHAxnuxi7o42OrZgF/ZTNcsZj6nRKyUmkhLFq8CHItp/fy6hQZuZmP/n3yZ9VBUbp4zz/mX8hmYPw==";
      };
    };
    "request-2.88.2" = {
      name = "request";
      packageName = "request";
      version = "2.88.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/request/-/request-2.88.2.tgz";
        sha512 = "MsvtOrfG9ZcrOwAW+Qi+F6HbD0CWXEh9ou77uOb7FM2WPhwT7smM833PzanhJLsgXjN89Ir6V2PczXNnMpwKhw==";
      };
    };
    "request-progress-2.0.1" = {
      name = "request-progress";
      packageName = "request-progress";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/request-progress/-/request-progress-2.0.1.tgz";
        sha1 = "5d36bb57961c673aa5b788dbc8141fdf23b44e08";
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
    "sshpk-1.16.1" = {
      name = "sshpk";
      packageName = "sshpk";
      version = "1.16.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/sshpk/-/sshpk-1.16.1.tgz";
        sha512 = "HXXqVUq7+pcKeLqqZj6mHFUMvXtOJt1uoUx09pFW6011inTMxqI8BA8PM95myrIyyKwdnzjdFjLiE6KBPVtJIg==";
      };
    };
    "string_decoder-1.1.1" = {
      name = "string_decoder";
      packageName = "string_decoder";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz";
        sha512 = "n/ShnvDi6FHbbVfviro+WojiFzv+s8MPMHBczVePfUpDJLwoLT0ht1l4YwBCbi8pJAveEEdnkHyPyTP/mzRfwg==";
      };
    };
    "throttleit-1.0.0" = {
      name = "throttleit";
      packageName = "throttleit";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/throttleit/-/throttleit-1.0.0.tgz";
        sha1 = "9e785836daf46743145a5984b6268d828528ac6c";
      };
    };
    "tough-cookie-2.5.0" = {
      name = "tough-cookie";
      packageName = "tough-cookie";
      version = "2.5.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/tough-cookie/-/tough-cookie-2.5.0.tgz";
        sha512 = "nlLsUzgm1kfLXSXfRZMc1KLAugd4hqJHDTvc2hDIwS3mZAfMEuMbc03SujMF+GEcpaX/qboeycw6iO8JwVv2+g==";
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
    "typedarray-0.0.6" = {
      name = "typedarray";
      packageName = "typedarray";
      version = "0.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/typedarray/-/typedarray-0.0.6.tgz";
        sha1 = "867ac74e3864187b1d3d47d996a78ec5c8830777";
      };
    };
    "uri-js-4.4.1" = {
      name = "uri-js";
      packageName = "uri-js";
      version = "4.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/uri-js/-/uri-js-4.4.1.tgz";
        sha512 = "7rKUyy33Q1yc98pQ1DAmLtwX109F7TIfWlW1Ydo8Wl1ii1SeHieeh0HHfPeL2fMXK6z0s8ecKs9frCuLJvndBg==";
      };
    };
    "util-deprecate-1.0.2" = {
      name = "util-deprecate";
      packageName = "util-deprecate";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/util-deprecate/-/util-deprecate-1.0.2.tgz";
        sha1 = "450d4dc9fa70de732762fbd2d4a28981419a0ccf";
      };
    };
    "uuid-3.4.0" = {
      name = "uuid";
      packageName = "uuid";
      version = "3.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/uuid/-/uuid-3.4.0.tgz";
        sha512 = "HjSDRw6gZE5JMggctHBcjVak08+KEVhSIiDzFnT9S9aegmp85S/bReBVTb4QTFaRNptJ9kuYaNhnbNEOkbKb/A==";
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
    "which-1.3.1" = {
      name = "which";
      packageName = "which";
      version = "1.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/which/-/which-1.3.1.tgz";
        sha512 = "HxJdYWq1MTIQbJ3nw0cqssHoTNU267KlrDuGZ1WYlxDStUtKUhOaJmh112/TZmHxxUfuJqPXSOm7tDyas0OSIQ==";
      };
    };
    "yauzl-2.10.0" = {
      name = "yauzl";
      packageName = "yauzl";
      version = "2.10.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/yauzl/-/yauzl-2.10.0.tgz";
        sha1 = "c7eb17c93e112cb1086fa6d8e51fb0667b79a5f9";
      };
    };
  };
in

nodeEnv.buildNodePackage {
  name = "asciicast2gif";
  packageName = "asciicast2gif";
  version = "0.2.1";
  src = fetchurl {
    url = "https://registry.npmjs.org/asciicast2gif/-/asciicast2gif-0.2.1.tgz";
    sha512 = "1BVUXfJhIPsVN3Jn4IYqdaLRvn7omfUbJJZdC25FTp35kwoSNUf2EEbiViwdhjIQUKBzmAUGQWJ7y7PpEhVabw==";
  };
  dependencies = [
    sources."ajv-6.12.6"
    sources."asn1-0.2.4"
    sources."assert-plus-1.0.0"
    sources."asynckit-0.4.0"
    sources."aws-sign2-0.7.0"
    sources."aws4-1.11.0"
    sources."bcrypt-pbkdf-1.0.2"
    sources."buffer-crc32-0.2.13"
    sources."buffer-from-1.1.1"
    sources."caseless-0.12.0"
    sources."combined-stream-1.0.8"
    sources."concat-stream-1.6.2"
    sources."core-util-is-1.0.2"
    sources."dashdash-1.14.1"
    sources."debug-2.6.9"
    sources."delayed-stream-1.0.0"
    sources."ecc-jsbn-0.1.2"
    sources."es6-promise-4.2.8"
    sources."extend-3.0.2"
    sources."extract-zip-1.7.0"
    sources."extsprintf-1.3.0"
    sources."fast-deep-equal-3.1.3"
    sources."fast-json-stable-stringify-2.1.0"
    sources."fd-slicer-1.1.0"
    sources."forever-agent-0.6.1"
    sources."form-data-2.3.3"
    sources."fs-extra-1.0.0"
    sources."getpass-0.1.7"
    sources."graceful-fs-4.2.6"
    sources."har-schema-2.0.0"
    sources."har-validator-5.1.5"
    sources."hasha-2.2.0"
    sources."http-signature-1.2.0"
    sources."inherits-2.0.4"
    sources."is-stream-1.1.0"
    sources."is-typedarray-1.0.0"
    sources."isarray-1.0.0"
    sources."isexe-2.0.0"
    sources."isstream-0.1.2"
    sources."jsbn-0.1.1"
    sources."json-schema-0.2.3"
    sources."json-schema-traverse-0.4.1"
    sources."json-stringify-safe-5.0.1"
    sources."jsonfile-2.4.0"
    sources."jsprim-1.4.1"
    sources."kew-0.7.0"
    sources."klaw-1.3.1"
    sources."mime-db-1.48.0"
    sources."mime-types-2.1.31"
    sources."minimist-1.2.5"
    sources."mkdirp-0.5.5"
    sources."ms-2.0.0"
    sources."oauth-sign-0.9.0"
    sources."pend-1.2.0"
    sources."performance-now-2.1.0"
    sources."phantomjs-prebuilt-2.1.16"
    sources."pinkie-2.0.4"
    sources."pinkie-promise-2.0.1"
    sources."process-nextick-args-2.0.1"
    sources."progress-1.1.8"
    sources."psl-1.8.0"
    sources."punycode-2.1.1"
    sources."qs-6.5.2"
    sources."readable-stream-2.3.7"
    sources."request-2.88.2"
    sources."request-progress-2.0.1"
    sources."safe-buffer-5.1.2"
    sources."safer-buffer-2.1.2"
    sources."sshpk-1.16.1"
    sources."string_decoder-1.1.1"
    sources."throttleit-1.0.0"
    sources."tough-cookie-2.5.0"
    sources."tunnel-agent-0.6.0"
    sources."tweetnacl-0.14.5"
    sources."typedarray-0.0.6"
    sources."uri-js-4.4.1"
    sources."util-deprecate-1.0.2"
    sources."uuid-3.4.0"
    sources."verror-1.10.0"
    sources."which-1.3.1"
    sources."yauzl-2.10.0"
  ];
  buildInputs = [];
  meta = {
    description = "asciinema GIF generator";
    homepage = "https://github.com/asciinema/asciicast2gif#readme";
    license = "MIT";
  };
  production = true;
  bypassCache = true;
  reconstructLock = true;
}
