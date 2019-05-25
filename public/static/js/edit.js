"use strict";


$(document).ready(function () {

	$('#confirm').click(function() {
		dealWords();
		
		
		
		
	});
	
	$('#contentShow span').click(function() {
		console.log($(this).html());
		
		$(this).toggleClass('strange');
	});
	
	$('#mark').click(function() {
		console.log($('#mark').hasClass('active'));
	});
});

function dealWords() {
	var content = $('#content').val();
	var arrWord = new Array();
	
	var strResult = '';
	
	$('#contentShow').empty();
	$('#contentShow2').empty();
	$('#contentShow').append('<p></p>');
	
	var objP = $('#contentShow p');

	arrWord = content.split(' ');
	for (var i=0; i<arrWord.length; ++i) {
		//console.log(i + ':' + arrWord[i]);
		var has = false;
		$('#word_list span').each(function() {
			console.log('2span:' + $(this).text());
			if ($(this).text().toLowerCase() == arrWord[i].toLowerCase()) {
				has = true;
			}
		});

		if (!has) {
			objP.append('<span class="strange">' + arrWord[i] + '</span>');
			
			$('#contentShow2').append('<span class="btn btn-danger">' + arrWord[i] + '</span>');
		} else {
			objP.append('<span class="">' + arrWord[i] + '</span>');
			
			$('#contentShow2').append('<span class="btn ">' + arrWord[i] + '</span>');
		}

		objP.append(' ');
		$('#contentShow2').append(' ');
	}
	
	$('#contentShow p').on('click', "span", function() {
		console.log($(this).html());
		
		var thisObj = $(this);
		var strText = thisObj.text();
		
		if ($('#mark').hasClass('active')) {
			// only can edit after it has been actived.
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
						console.log('span:' + $(this).text());
					});
				} else {
					$('#word_list span').each(function() {
						if ($(this).text().toLowerCase() == strText.toLowerCase()) {
							console.log('$(this).text():' + $(this).text());
							
							$(this).remove();
						}
					});
				}
				
				dealWords();
			});
		
			// if (thisObj.hasClass('strange')) {
				// $(this).removeClass('strange');
			// } else {
				// $(this).addClass('strange');
			// }
			
			
		} else {
			// search word
			
		}
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