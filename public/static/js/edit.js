"use strict";


$(document).ready(function () {

	$('#confirm').click(function() {
		dealWords();
	});
	
	$('#clear').click(function() {
		$('#content').val('');
	});
	
	$('#mark').click(function() {
		console.log($('#mark').hasClass('active'));
		
		$('#modal_edit').modal('show');
	});
	
	$('#btn_familar').click(function() {
		$('#modal_familar').modal('show');
	});
	
	$('#modal_edit').on('shown.bs.modal', function (e) {
		console.log('modal show');
	});
	
	$('#modal_edit').on('hidden.bs.modal', function (e) {
		console.log('modal hidden');
		
		copyContentHtml();
	});
	
	$('#dic_list li a').click(function() {
		console.log($(this).text());
		
		var name = $(this).text();
		
		var sUrl = pURL('/edit/changeDic');
		$.post(sUrl, {name: name}, function() {
			$('#selected_dic .text').text(name);
		});
	});
});

function dealWords() {
	$('#edit_words').empty();
	$('#edit_words').append('<p></p>');

	var objP = $('#edit_words p');

	var arrWord = new Array();
	
	var content = $('#content').val();
	arrWord = content.split(' ');
	
	var mapWords = getFamilarWords();
	
	for (var i=0; i<arrWord.length; ++i) {
		//console.log(i + ':' + arrWord[i]);
		var has = false;
		if (mapWords[arrWord[i].toLowerCase()]) {
			has = true;
		} else {
			has = false;
		}

		if (!has) {
			objP.append('<span class="strange">' + arrWord[i] + '</span>');
		} else {
			objP.append('<span class="">' + arrWord[i] + '</span>');
		}

		objP.append(' ');
	}

	$('#edit_words p').on('click', "span", function() {
		console.log($(this).html());
		
		var thisObj = $(this);
		var strText = thisObj.text();
		
		var sUrl = pURL('/edit/markWord');
		console.info('doSearch:' + sUrl);

		var familar = 0;
		if (thisObj.hasClass('strange')) {
			familar = 1;
		}

		$.post(sUrl, {text: strText, familar:familar}, function() {
			if (familar == 1) {
				$('#word_list').append(' <span>' + strText + '</span>');
				
				$('#word_list span').each(function() {
					//console.log('span:' + $(this).text());
				});
			} else {
				$('#word_list span').each(function() {
					if ($(this).text().toLowerCase() == strText.toLowerCase()) {
						console.log('$(this).text():' + $(this).text());
						
						$(this).remove();
					}
				});
			}
			
			$('#edit_words span').each(function() {
				if ($(this).text().toLowerCase() == strText.toLowerCase()) {
					if (familar == 1) {
						$(this).removeClass('strange');
					} else {
						$(this).addClass('strange');
					}
				}
			});
		});

	});
	
	copyContentHtml();
}

function copyContentHtml() {
	$('#contentShow').html($('#edit_words').html());
	
	$('#contentShow p').on('click', "span", function() {
		var t = $(this).html();
		
		console.log(t);
		
		doSearch(t);
	});
}

function getFamilarWords() {
	var mapWords = {};
	$('#word_list span').each(function() {
		mapWords[$(this).text().toLowerCase()] = $(this).text().toLowerCase();
			// if ($(this).text().toLowerCase() == arrWord[i].toLowerCase()) {
				// has = true;
			// }
	});
	
	console.log(mapWords['']);
		
	return mapWords;
}

function doSearch(t) {
	//var searchUrl = $('#search_url').val();
	//console.info('searchUrl:' + searchUrl);
	
	var selectedDic = $('#selected_dic .text').text();
	
	console.log('selectedDic:' + selectedDic);
	
	var searchUrl = "";
	$('#dic_list li a').each(function() {
		console.log($(this).text());
		if ($(this).text() == selectedDic) {
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
		//window.location.reload();
	});
}

function pURL(url) {
	var publicUrl = $('#publicUrl').val();
	return publicUrl + url;
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