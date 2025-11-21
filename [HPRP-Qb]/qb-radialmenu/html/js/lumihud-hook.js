(function(){
  window.addEventListener("message", function (event) {
    if (event && event.data && event.data.action === 'updateColor') {
      try {
        var c   = event.data.color;
        var hex = '#c92a2a';
        if (typeof c === 'string') { hex = c; }
        else if (c && typeof c === 'object' && typeof c.background === 'string') { hex = c.background; }
        var withOpacity60 = hex + '9d';
        var withOpacity40 = hex + '66';
        document.documentElement.style.setProperty('--radial-color', hex);
        document.documentElement.style.setProperty('--radial-glow',  withOpacity60);
        document.documentElement.style.setProperty('--radial-glow2', withOpacity40);
      } catch (e) {}
    }
  });
})();