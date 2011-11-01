//via johnholdun

$(function() {
    
    $("*[id^=remove_ads], .more_dloptions, .footer, .download_options_bar, #header_nav, #logged_in_info").remove()
    $(".dl_options_wrapper")
      .css({ width: "500px", margin: "0 auto" })
      .siblings().remove()
      
    $("#v4logo").css({
          float: "none",
        width: "200px",
        margin: "0 auto"
        })
    
  try { QU() } catch(e) { }
    
})
