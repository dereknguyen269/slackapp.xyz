var page = require('webpage').create();
console.log('The default user agent is ' + page.settings.userAgent);
page.settings.userAgent = 'SpecialAgent';
page.open('http://example.com/', function(status) {
  if (status !== 'success') {
    console.log('Unable to access network');
  } else {
    var ua = page.evaluate(function() {
      var header = document.getElementsByTagName('h1')[0].textContent;
      return header;
    });
    console.log(ua);
  }
  phantom.exit();
});
