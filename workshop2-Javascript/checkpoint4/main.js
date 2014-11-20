$(document).ready( function() {

	var score = 0;
	$('.penguin').on('click', function() {
		score = score + 1;
		$('#count').text("Score: " + score)
	});

	$('.yeti').on('click', function() {
		$('#wrapper').hide();
		$('#count').hide();
		$('#done').show();
		$('#score').text(score);
	});



});