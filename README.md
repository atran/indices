This fork differs by using Jake as a taskrunner, Stylus & Nib for styling, Angular Classy to abstract controllers and Jake as a task runner. 

# angular-brunch-seed
### A starter project for AngularJS using Brunch.io

[AngularJS](http://angularjs.org) + [Brunch](http://brunch.io)

Features:
* Coffeescript / Jade / Less / Stylus automatically compiled on save
* Auto-reload during development saves you from manually refreshing the page
* Javascript / CSS minification for production
* Autoprefixer for adding & removing vendor prefixes for CSS
* Source map support

Supporting Libraries:

* [Angular Classy](http://davej.github.io/angular-classy/) uses cleaner class-based controllers for Angular. It also allows controllers to be minified without [annotating dependency injections](http://docs.angularjs.org/guide/di).

* [Nib](http://visionmedia.github.io/nib/) is a Stylus mixin library.

## Setup

* Install Homebrew:

  `ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`

* Install Node & NPM:

  `brew install node`

* Install [Brunch](http://brunch.io/) globally:

  `npm install -g brunch`

* Create a new brunch project; this will also install node dependencies:

  `brunch new https://github.com/atran/angular-brunch-seed myapp`


## Quickstart

* Have node and bower installed for dependency management

* Go to the repository folder
```
cd myapp/
```

* Install NPM and bower dependencies
```
npm install
bower install
```

* Run a server on :3333 using the task runner (see below)
```
jake brunch:server
```

## Task List

While Brunch/Bower/etc. can be used, Jake commands are provided for a simple and consistent interface. These tasks can be executed using `jake`. (`jake [task]`) These are the following available tasks provided out of the box:

### `npm:clean`
Remove downloaded Node modules. This is useful if you want to reinstall dependencies. (ex. updated/corrupted package(s)) Remember that you need to call `npm install` to install dependencies.

### `bower:install`
Download and preinstall any Bower dependencies in advance. You can run this if you want to download Bower dependencies in advance.

### `bower:clean`
Remove downloaded Bower dependencies. This is useful if you want to reinstall dependencies. (ex. updated/corrupted package(s))

### `brunch:watch`
Watch brunch directory , reload and rebuild on changes.

### `brunch:server`
Build project for development, rebuild on changes, and host locally on http://localhost:3333.

### `brunch:build`
Build project for production with minification.

## Using Jade

You will find the jade files in the `app` and `app/partials` directories.
Upon save the Jade files will be recompiled to HTML and added to the
`$templateCache`. When reverencing a partial use the path should begin with
`partial/` and end with `.html`. For example the `app/partials/nav.jade` would
be referenced in the Angular javascript code as 'partials/nav.html'.

*NOTE:* Behind the scenes Angular-brunch-seed uses 
[jade-angular-brunch](https://github.com/GulinSS/jade-angularjs-brunch)
to compile and serve partials.
[jade-angular-brunch](https://github.com/GulinSS/jade-angularjs-brunch)
works by creating an Angular module named`'partials'` that adds the HTML
string of the partials to the `$templateCache`. For this to work you must add
`partials` to yours apps required modules list and include the `partials.js`
file in your `index.html` file.

If you are interested in the compiled HTML view the contents 
of the `_build/js/partials.js` file.

## Directory Layout

    _build/                   --> Contains generated file for servering the app
                                  These files should not be edited directly
    app/                      --> all of the files to be used in production

      assets                  --> a place for static assets. These files will be copied to
                                  the public directory un-modified.
        img/                  --> image files
        partials/             --> angular view partials (partial HTML templates)
          nav.html                If you are using HTML you may modify these files directly.
          partial1.html           If you are using Jade these file will be update from their *.jade counterpart
          partial2.html
        index.html            --> app layout file (the main html template file of the app).

      partials/               --> Jade partial files. This file will be converted to HTML upon save.
        nav.jade                  If you are using HTML this directory will not be present. You will find the template file
        partial1.jade             in the `app/assets/partials` directory instead.
        partial2.jade             If you are using Jade these file will be converted to HTML and compiled into 
                                  `_public/js/partials.js` upon save.
      scripts/                --> base directory for app scripts
        controllers/          --> application controllers
        directives/           --> custom angular directives
        filters/              --> custom angular filters
        services/             --> custom angular services

      styles/                 --> all custom styles. Acceptable files types inculde:
                                  less, and stylus. 
                                  **NOTE underscores (_). Files begining with an underscore 
                                  will not automatically be compiled, they must be imported.
        components/           --> global and layout styles.
        modules/              --> mixins and other things that don't output CSS.
        partials/             --> corresponds to Jade partials.
        _vendor.less          --> a file for importing vendor libraries.
        _shame.less           --> a shame file.
        app.less              --> primary file that imports everything.
      app.coffee              --> application definition and routes.
      index.jade              --> Index file. This will be converted to assets/index.html on save
      init.coffee             --> application bootstrap

    bower_components/         --> The bower_components dirctory is populated by Bower.
                                  It contains  Angular, Bootstrap Font-Awesome 
                                  and other utility files.
    node_modules              --> NodeJS modules

    scripts/                  --> handy shell scripts
      compile-html.sh         --> compiles *.jade file to *.html file and places them in app/assets
      compile-tests.sh        --> compiles coffeescript test to javascript
      development.sh          --> compiles files and watches for changes
      init.sh                 --> installs node modules
      production.sh           --> compiles and compresses files for production use
      server.sh               --> runs a development server at `http://localhost:3333`

    vendor/                   --> The vendor directory is can be used for 3rd Party libraries.
                                  Any files located in this directory will be included in js/vendor.js
  bower.json                  --> Bower component config
  config.coffee               --> Brunch config
  package.json                --> node modules config

## Contributers

[Complete list of code contributers](https://github.com/atran/angular-brunch-seed/graphs/contributors)

For more information on angular please check out <http://angularjs.org>
