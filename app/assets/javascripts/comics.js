$(function(){
	$('#searchbutton').on('click', function(e){
		e.preventDefault();
		var url = window.location.origin;
		var search = $('#search').val();
		var apiLib = $('#apiLibrary').val();
		window.location = url + '/comics/?search=' + search + '&lib=' + apiLib
		// window.location.replace(url + "/comics/?search=" + search + "&lib=" + apiLib);
		$('#container').append('<p><a href="' + url + '/comics/?search=' + search + '&lib=' + apiLib + '">' + 
						url + '/comics/?search=' + search + '&lib=' + apiLib + '</a></p>');
	})
})