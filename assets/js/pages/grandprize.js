var participants = [];

$(function() {

	Pusher.logToConsole = true;

	const pusher = new Pusher('57b1c37d7c00671cbe6f', {
		cluster: 'ap1'
	});

	const channel = pusher.subscribe('channel1');
	channel.bind('event', function(data) {

		if (data.message == 'change_gift') {
			$('#gift_id').val(data.gift[0].gift_id);
			$('#giftContainer').attr('src', base_url + 'assets/images/gift/' + data.gift[0].gift_file);
		}

		if (data.message == 'start') {
			AniDice();
			$('#email_result').text('');
		}

		if (data.message == 'stop') {
			var registration_id;
			$.ajax({
				url: base_url + 'grandprize/get_result',
				type: 'POST',
				dataType: 'JSON',
				success: function(data) {
					stopDice();
					registration_id = data.result_id;
					$('#name_result').text(data.result_name.toUpperCase());
					$('#email_result').text(data.result_nip.toUpperCase());
				},
				complete: function() {
					$.ajax({
						url: base_url + 'grandprize/save_tr',
						data: {
							'gift_id': $('#gift_id').val(),
							'registration_id': registration_id
						},
						type: 'POST',
						dataType: 'JSON',
						success: function(data) {
							console.log(data);
						}
					});
				}
			});
		}

		if (data.message == 'selected_result') {
			var registration_id;
			stopDice();
			registration_id = data.data.result_id;
			$('#name_result').text(data.data.result_name.toUpperCase());
			$('#email_result').text(data.data.result_nip.toUpperCase());
			$.ajax({
				url: base_url + 'grandprize/save_tr',
				data: {
					'gift_id': $('#gift_id').val(),
					'registration_id': registration_id
				},
				type: 'POST',
				dataType: 'JSON',
				success: function(data) {
					console.log(data);
				}
			});
		}

	});

	$.ajax({
		url: base_url + 'grandprize/get_participant',
		type: 'POST',
		dataType: 'JSON',
		success: function(data) {
			participants = data;
		}
	});

	function AniDice() {
		MyVar = setInterval(rolldice, 20)
	}

	function rolldice() {
		var ranNum = Math.floor(Math.random() * participants.length);
		$('#name_result').text(participants[ranNum].participant_name.toUpperCase());
	}

	function stopDice() {
		clearInterval(MyVar);
	}

});
