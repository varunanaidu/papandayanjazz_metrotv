$(function() {

    $("#selectedWinner").select2({
        placeholder: "Type NIP or Name",
        minimumInputLength: 2,
        ajax: {
            url: base_url + "grandprize/search_participant",
            dataType: "json",
            delay: 250,
            processResults: function(data) {
                return {
                    results: data
                };
            },
            cache: true
        },
        allowClear: true
    });

    $('#btnStart').on('click', function() {

        $.ajax({
            url: base_url + 'grandprize/button_start',
            type: 'POST',
            dataType: 'JSON',
            success: function(data) {
            	console.log(data);
            }
        });
    });

    $('#btnStop').on('click', function() {

        $.ajax({
            url: base_url + 'grandprize/button_stop',
            type: 'POST',
            dataType: 'JSON',
            success: function(data) {
            	console.log(data);
            }
        });
    });

    $('#gift_id').on('change', function() {

        $.ajax({
            url: base_url + 'grandprize/change_gift',
            type: 'POST',
            dataType: 'JSON',
            data : { 'gift_id' : $(this).val() },
            success: function(data) {
            	console.log(data);
            }
        });
    });

    $('#btnChoose').on('click', function() {

    	var registration_id = $('#selectedWinner').val();

    	if ( registration_id == '' ) {
    		alert("Select Winner!!");
    		return;
    	}

        $.ajax({
            url: base_url + 'grandprize/get_selected_result',
            type: 'POST',
            dataType: 'JSON',
            data : { 'registration_id' : registration_id },
            success: function(data) {
            	console.log(data);
            }
        });
    });

});