"use strict";


$(document).ready(function () {

	$('#confirm').click(function() {
		var content = $('#content').val();
		var arrWord = new Array();
		
		var strResult = '';
		
		$('#contentShow').empty();
		$('#contentShow2').empty();
		
		arrWord = content.split(' ');
		for (var i=0; i<arrWord.length; ++i) {
			if (i % 7 == 0) {
				$('#contentShow').append('<span class="strange">' + arrWord[i] + '</span>');
				
				$('#contentShow2').append('<span class="btn ">' + arrWord[i] + '</span>');
			} else {
				$('#contentShow').append('<span class="">' + arrWord[i] + '</span>');
				
				$('#contentShow2').append('<span class="btn btn-danger">' + arrWord[i] + '</span>');
			}
			
			$('#contentShow').append(' ');
			$('#contentShow2').append(' ');
		}
	});
	
	$('#contentShow span').click(function() {
		$(this).toggleClass('strange');
		
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