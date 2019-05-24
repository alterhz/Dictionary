"use strict";


$(document).ready(function () {

	$(document).keydown(function(e) {
		if (e.keyCode == 13) {
			$('#search-btn').click();
		}
  	});

	$('#search-btn').click(function(event) {
		var t = $('#text').val().trim().toLowerCase();
		if (t.length > 0) {
			doSearch(t);
		} else {
			alert('input search text.');
		}
	});
	
	$('.historyList li').click(function() {
		var t = $(this).children('.searchWord').text();
		doSearch(t);
	}).mouseover(function() {
		$(this).children('.delete-word').show();
	}).mouseleave(function() {
		$(this).children('.delete-word').hide();
	});
	
	$('.delete-word').click(function(event) {
		var t = $(this).parent().children('.searchWord').text();
		
		doDelete(t);
		
		event.stopPropagation();
	});

});

function pURL(url) {
	var publicUrl = $('#publicUrl').val();
	return publicUrl + url;
}

function doSearch(t) {
	var searchUrl = $('#search_url').val();
	console.info('searchUrl:' + searchUrl);
	
	var url = String.format(searchUrl, t);
	window.open(url, '_blank');
	
	var sUrl = pURL('/index/search.html');
	console.info('doSearch:' + sUrl);
	
	$.post(sUrl, {text: t}, function(data) {
		window.location.reload();
	});
}

function doDelete(t) {
	var url = pURL('/index/delete.html');
	
	console.info('doDelete:' + url);
	
	$.post(url, {text: t}, function(data) {
		window.location.reload();
	});
}

String.format = function() {
    if (arguments.length == 0)
        return null;
    var str = arguments[0];
    for ( var i = 1; i < arguments.length; i++) {
        var re = new RegExp('\\{' + (i - 1) + '\\}', 'gm');
        str = str.replace(re, arguments[i]);
    }
    return str;
};