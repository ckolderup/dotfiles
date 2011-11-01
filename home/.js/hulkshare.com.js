$(function() {
  var
    title = document.title.replace(/^Hulkshare.com\s+/i, ""),
    url = $("a[href$=.mp3]").eq(0).attr("href"),
    $title = $("<a>", {
      text: title,
      href: url
    }),
    $audio = $("<audio>", {
      src: url,
      controls: true
    })
  
  $("body")
    .html("")
    .append($title)
    .append($audio)
})