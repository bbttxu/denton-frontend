
exports.config = {
    "modules": [
        "copy",
        "server",
        "coffeescript",
        "coffeelint",
        "csslint",
        "lint",
        "require",
        "minify-js",
        "minify-css",
        'minify-img',
        "live-reload",
        "bower",
        "jade",
        "server-template-compile",
        "less",
        "cjsx"
    ],
    "iced": {
        extensions: ["coffee", "iced"],
        options: {
            sourceMap: true,
            bare: true,
            runtime: "inline"
        }
    },
    "serverTemplate": {
        'locals': {
            "title": "Mimosa",
            "reload": false,
            "optimize": true,
            "build": true
        }
    }
  }
