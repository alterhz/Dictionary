"use strict";


$(document).ready(function () {

	$(document).keydown(function(e) {
		if (e.keyCode == 13) {
			$('#selected_dic').click();
		}
  	});

	$('#selected_dic').click(function(event) {
		var t = $('#search_text').val().trim().toLowerCase();
		var selectedDic = $('#selected_dic .text').text();
		if (t.length > 0) {
			doSearch(t, selectedDic);
		} else {
			alert('input search text.');
		}
	});
	
	$('#dic_list li a').click(function() {
		console.log($(this).text());
		
		var name = $(this).text();
		
		var sUrl = pURL('/index/changeDic');
		$.post(sUrl, {name: name}, function() {
			$('#selected_dic .text').text(name);
		});
	});
	
	$('.word_list li .searchText').click(function() {
		var t = $(this).parents('.row').attr('data').trim();
		var selectedDic = $('#selected_dic .text').text();
		doSearch(t, selectedDic);
	}).mouseover(function() {
		$(this).children('.delete-word').show();
	}).mouseleave(function() {
		$(this).children('.delete-word').hide();
	});
	
	$('.dic_search').click(function() {
		var t = $(this).parents('.row').attr('data').trim();
		var dic = $(this).text();
		
		doSearch(t, dic);
	});
	
	$('.delete-word').click(function(event) {
		var t = $(this).parents('.row').attr('data').trim();
		doDelete(t);
	});

});

function pURL(url) {
	var publicUrl = $('#publicUrl').val();
	return publicUrl + url;
}

function doSearch(t, dic) {
	console.log('dic:' + dic);
	
	var searchUrl = "";
	$('#dic_list li a').each(function() {
		console.log($(this).text());
		if ($(this).text() == dic) {
			searchUrl = $(this).attr('url');
		}
	});
	
	console.log('searchUrl:' + searchUrl);
	
	var url = String.format(searchUrl, t);
	window.open(url, '_blank');
	
	console.log('url:' + url);
	
	var sUrl = pURL('/index/search.html');
	console.info('doSearch:' + sUrl);
	
	$.post(sUrl, {text: t}, function(data) {
		window.location.reload();
	});
}

// function doSearch(t) {
	// var searchUrl = $('#search_url').val();
	// console.info('searchUrl:' + searchUrl);
	
	// var url = String.format(searchUrl, t);
	// window.open(url, '_blank');
	
	// var sUrl = pURL('/index/search.html');
	// console.info('doSearch:' + sUrl);
	
	// $.post(sUrl, {text: t}, function(data) {
		// window.location.reload();
	// });
// }

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