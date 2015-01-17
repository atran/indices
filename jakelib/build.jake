// Brunch build tasks
var brunch = require('./lib').npmBin('brunch');

namespace('brunch', function(){
  desc('Watch project for development');
  task('watch', ['bower:install', 'brunch:clean'], function() {
    return brunch.execute('watch');
  });
  desc('Build project for development, rebuild on changes, and host locally');
  task('server', ['bower:install', 'brunch:clean'], function() {
    return brunch.execute('watch', '--server');
  });
  desc('Build project for production');
  task('build', ['bower:install', 'brunch:clean'], function() {
    return brunch.execute('build', '-P');
  });
  desc('Removes public folder');
  task('clean', function() {
    jake.rmRf('_build', {silent: true});
  });
});
