$(function(){
  var
    videoIdParts = document.location.href.match(/\?v=(.+?)(&|$)/),
    videoId,
    niceUrlParts = ['http://youtu.be']

  if (videoIdParts.length) {
    niceUrlParts.push(videoIdParts[1])
    niceUrlParts.push($('a.author').first().text())
    niceUrlParts.push(document.title.replace(/[^A-Z0-9 \.]/gi,'').replace(/ +/g,'-').replace(/-youtube$/i, ""))

    $("<a>", {
      text: " ",
      title: "Descriptive URL",
      href: niceUrlParts.join("/"),
      style: "display: block; width: 24px; height: 24px; overflow: hidden; float: left; text-margin: -999px; background: url('http://i.imgur.com/wucK0.png') no-repeat center center;"
    })
      .prependTo($("h1#watch-headline-title"))
  }
}) 
