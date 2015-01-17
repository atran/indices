exports.config =
  conventions:
    assets: /^app\/assets\//

  modules:
    definition: false
    wrapper: false

  paths:
    public: "_build"

  server:
    noPushState: true

  files:
    javascripts:
      joinTo:
        "js/app.js": /^app/
        "js/vendor.js": /^(bower_components|vendor)/

      order:
        before: ["app/javascripts/init.coffee"]

    stylesheets:
      joinTo:
        "css/app.css": /^(app|vendor|bower_components)/

      order:
        before: ["app/styles/app.styl"]

    templates:
      joinTo:
        "js/dontUseMe": /^app/ # dirty hack for Jade compiling.

  plugins:
    jade:
      pretty: false # Adds pretty-indentation whitespaces to output (false by default)

    stylus:
      linenos: true

    autoprefixer:
      browsers: ["last 2 version"]

    autoReload:
      enabled: true

  overrides:
    sourceMaps: false

    autoReload:
      enabled: false
