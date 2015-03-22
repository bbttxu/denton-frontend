exports.config = {
    "modules": [
        "copy",
        "server",
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
        "less"
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
