$(document).ready( function() {

	var score = 0;
	$('.penguin').on('click', function() {
		score = score + 1;
		$('#count').text("Score: " + score)
	});



});