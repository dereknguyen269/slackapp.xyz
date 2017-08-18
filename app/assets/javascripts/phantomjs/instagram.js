var resourceWait  = 300,
    maxRenderWait = 10000,
    url           = 'https://www.instagram.com/accounts/login/';

var page          = require('webpage').create(),
    system        = require('system'),
    env           = system.env,
    count         = 0,
    ready         = 0,
    forcedRenderTimeout,
    renderTimeout;

page.viewportSize = { width: 1280, height : 1024 };
page.settings.userAgent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.82 Safari/537.36';

page.onInitialized = function() {
  page.onCallback = function(data) {
    console.log('Main page is loaded and ready');
    ready += 1;
    if (ready == 2) {
      profileScreen();
    }
    if (ready == 5) {
      console.log('-----------Done-----------');
    }
  };

  page.evaluate(function() {
    document.addEventListener('DOMContentLoaded', function() {
      window.callPhantom();
    }, false);
    console.log("Added listener to wait for page ready");
  });

};

page.onResourceRequested = function (req) {
  count += 1;
  console.log('> ' + req.id + ' - ' + req.url);
  clearTimeout(renderTimeout);
};

page.onResourceReceived = function (res) {
  if (!res.stage || res.stage === 'end') {
    count -= 1;
    console.log(res.id + ' ' + res.status + ' - ' + res.url);
    if (count === 0) {
      renderTimeout = setTimeout(doRender, resourceWait);
    }
  }
};

page.open(url, function (status) {
  if (status !== "success") {
    console.log('Unable to load url');
    phantom.exit();
  } else {
    forcedRenderTimeout = setTimeout(function () {
      loginScreenRender();
    }, maxRenderWait);
  }
});

function loginScreenRender() {
  page.render('tmp/phantomjs/login-screen.png');
  loginAction();
}

function loginAction() {
  var ig = page.evaluate(function() {
    function getCoords(box) {
      return  {
        x: box.left,
        y: box.top
      };
    }

    function getPosition(type, name) {
      // find fields to fill
      var input = document.getElementsByTagName(type);
      for(var i = 0; i < input.length; i++) {
        if(name && input[i].name == name)  return getCoords(input[i].getBoundingClientRect());
        else if(!name && input[i].className)  return getCoords(input[i].getBoundingClientRect()); // this is for login button
      }
    }
    return {
      user: getPosition('input', 'username'),
      pass: getPosition('input', 'password'),
      login: getPosition('button')
    };
  });

  page.sendEvent('click',ig.user.x, ig.user.y);
  page.sendEvent('keypress', env['INSTAGRAM_USERNAME']);

  page.sendEvent('click',ig.pass.x, ig.pass.y);
  page.sendEvent('keypress', env['INSTAGRAM_PASSWORD']);
  page.sendEvent('click',ig.login.x, ig.login.y);
}

function profileScreen() {
  resourceWait  = 300;
  maxRenderWait = 10000;
  count = 0;
  url = 'https://www.instagram.com/_find_beautiful_girl_/';
  window.setTimeout(function() {
    page.open(url, function (status) {
      if (status !== "success") {
        console.log('Unable to load url');
        phantom.exit();
      } else {
        forcedRenderTimeout = setTimeout(function () {
          page.render('tmp/phantomjs/profile-screen.png');
          phantom.exit();
        }, maxRenderWait);
      }
    });
  }, 30000);
}
