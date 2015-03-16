$(function(){
	$('.throbber').hide();
	$('#top').on('click', function(){
		window.location = window.location.origin;
	});
	
	$('#searchbutton').on('click', function(e){
		$('.throbber').show();
		e.preventDefault();
		var ts = new Date().getMilliseconds();
		var url = window.location.origin;
		var search = $('#search').val();
		var apiLib = $('#apiLibrary').val();
		window.location = url + '/comics/?search=' + search + '&lib=' + apiLib + "&ts=" + ts
	})

	$('li').on('click', 'a', function(e){
		e.preventDefault();
		var ts = new Date().getMilliseconds();
		window.location = window.location + "&nts=" + ts + "&links=" + $(this).attr('value');
	})
})