$(document).ready( function() {

	/*Updating the score everytime a penguin is clicked*/
	var score = 0;
	$('.penguin').on('click', function() {
		score = score + 1;
		$('#count').text("Score: " + score);
	});

	/*selecting a random place to put the yeti*/
	function makeYeti() {
		var divs = $('.penguin');
		var index = Math.floor((Math.random() * 8));
		$(divs[index]).attr('class', 'penguin yeti');
	};
	makeYeti();

	/* when yeti is clicked, the game board
		disappears and done is shown
	*/
	$('.yeti').on('click', function() {
		$('#wrapper').hide();
		$('#count').hide();
		$('#done').show();
		$('#score').text(score);
	});



});