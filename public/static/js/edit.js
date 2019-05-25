"use strict";


$(document).ready(function () {

	$('#confirm').click(function() {
		var content = $('#content').val();
		var arrWord = new Array();
		
		var strResult = '';
		
		$('#contentShow').empty();
		$('#contentShow2').empty();
		$('#contentShow').append('<p></p>');
		
		var objP = $('#contentShow p');
		
		arrWord = content.split(' ');
		for (var i=0; i<arrWord.length; ++i) {
			if (i % 7 == 0) {
				objP.append('<span class="strange">' + arrWord[i] + '</span>');
				
				$('#contentShow2').append('<span class="btn ">' + arrWord[i] + '</span>');
			} else {
				objP.append('<span class="">' + arrWord[i] + '</span>');
				
				$('#contentShow2').append('<span class="btn btn-danger">' + arrWord[i] + '</span>');
			}

			objP.append(' ');
			$('#contentShow2').append(' ');
		}
		
		$('#contentShow p').on('click', "span", function() {
			console.log($(this).html());
			
			if ($('#mark').hasClass('active')) {
				// only can edit after it has been actived.
				
				var thisObj = $(this);
			
				if (thisObj.hasClass('strange')) {
					$(this).removeClass('strange');
				} else {
					$(this).addClass('strange');
				}
				
			}
			
			
		});
		
		
	});
	
	$('#contentShow span').click(function() {
		console.log($(this).html());
		
		$(this).toggleClass('strange');
		
	});
	
	$('#mark').click(function() {
		console.log($('#mark').hasClass('active'));
	});
	
	

});

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