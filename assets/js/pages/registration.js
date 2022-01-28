$( function () {
	
	$('#registrationForm').on('submit', function(event) {
		event.preventDefault();
		

		$.ajax({
			url : base_url + 'registration/save',
			type : 'POST',
			dataType : 'JSON',
			data : $(this).serialize(),
			success : function (data) {
				if ( data.type == 'done' ) {
					window.location.href = base_url + 'registration/registered/' + data.id;
				}else{
					Swal.fire("Failed!", data.msg, "error");
				}
			}
		});
	});
});