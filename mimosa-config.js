exports.config = {
    "modules": [
        "copy",
        "server",
        "jshint",
        "csslint",
        "require",
        "minify-js",
        "minify-css",
        "live-reload",
        "bower",
        "iced-coffeescript",
        "stylus",
        "dust",
        "server-template-compile"
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
            "optimize": true
        }
    }
}