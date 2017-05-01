      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      function onYouTubeIframeAPIReady() {
        location.href="nativecall"
      }

    function SetPlayer(width, height, id){
        player = new YT.Player('player', {
          height: height,
          width: width,
          videoId: id,
          playerVars: {
            autoplay: 1,
            fs: 0, 
            controls: 1,
            showinfo: 1,
            modestbranding: 1,
            iv_load_policy: 3,
            rel: 0,
            playsinline: 1,
          },
          events: {
            'onReady': onPlayerReady
            //'onStateChange': onPlayerStateChange
          }
        });
    }

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        //event.target.playVideo();
        var element = document.getElementById("player");
        //element.setAttribute("allowFullscreen", "0");
        element.removeAttribute("allowFullscreen")
      }

      function setSize(width, height) {
        player.setSize(width, height);
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          setTimeout(stopVideo, 6000);
          done = true;
        }
      }
      function stopVideo() {
        player.stopVideo();
      }

      document.addEventListener("DOMContentLoaded", function(){
          var clickElement = document.getElementById("create");
          clickElement.addEventListener("click", function(event) {
        SetPlayer(400,200, "KKgTyHr3a58");
    　},false);

    }, false);

      document.addEventListener("DOMContentLoaded", function(){
        var clickElement = document.getElementById("skip");
        clickElement.addEventListener("click", function(event) {
        var getCurrentTime = player.getCurrentTime();
        var seekTo_time = getCurrentTime + 5;
        player.seekTo(seekTo_time);
    　},false);
      }, false);
    
    function Skip(){
        var getCurrentTime = player.getCurrentTime();
        var seekTo_time = getCurrentTime + 5;
        player.seekTo(seekTo_time);
    }
    
    function Back(){
        var getCurrentTime = player.getCurrentTime();
        var seekTo_time = getCurrentTime - 5;
        player.seekTo(seekTo_time);
    }

    document.addEventListener("DOMContentLoaded", function(){
      var clickElement = document.getElementById("back");
      clickElement.addEventListener("click", function(event) {
      var getCurrentTime = player.getCurrentTime();
      var seekTo_time = getCurrentTime - 5;
      player.seekTo(seekTo_time);
      },false);
    }, false);