jQuery.fn.autolink = function () {
  return this.each( function(){
    var re = /((http|https|ftp):\/\/[\w?=&.\/-;#~%-]+(?![\w\s?&.\/;#~%"=-]*>))/g;
    $(this).html( $(this).html().replace(re, '<a href="$1">$1</a>') );
  });
}


$(document).ready(function() {     

  $(".profile.facebook").each(function() {
    var profile = $(this)
    var url = profile.find('span.profile_url').html();
    var content = profile.children('.content')
    
    $.getJSON(url,function(json){
      var html = "<ul>";
      $.each(json.data,function(i,fb){
        html += "<li>" 
        html += fb.name || fb.caption 
        if (fb.actions){
          html += " <a href='"+fb.actions[0]["link"]+"'>"+fb.actions[0]["name"]+"</a>"
        }
        html += "</li>"; 
      });
      html += "</ul>";
      if (json.data == ""){
        html = "<p>No data received from facebook.</p>" 
      }
      content.animate({opacity:0}, 500, function(){ content.html(html).autolink();});
      content.animate({opacity:1}, 500);
    });
    
  });

  $(".profile.rss").each(function() {
    var profile = $(this)
    var url = profile.find('span.profile_url').html();
    var content = profile.children('.content')
    $.ajax({
        type: 'GET',
        url: "/proxy?uri=" + url,
        success: function(xml) {
          var feed = new JFeed(xml);
          var html = "<h4>"+feed.title+"</h4><ul>";
          
          $.map(feed.items, function(n, i){
            html += "<li>" +n.title + " <a href='"+n.link+"'>Read... </a></li>"
          });
          html += "</ul>";
          content.animate({opacity:0}, 500, function(){ content.html(html).autolink();});
          content.animate({opacity:1}, 500);
        }
    });
    
  });
  
  
  jQuery(document).bind('keydown', '1', function (evt){
    sort_candidate("aye!");
    return false; 
  });
  jQuery(document).bind('keydown', '2', function (evt){
    sort_candidate("maybe!");
    return false; 
  });
  jQuery(document).bind('keydown', '3', function (evt){
    sort_candidate("nay!");
    return false; 
  });
  
});
function sort_candidate(sorting){
  alert(sorting);
}