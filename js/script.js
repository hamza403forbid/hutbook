$(function(){
	$.ajax('api/getHut.php',{
		crossDomain:true,
		data:{
			'all': false,
			'featured': true,
			'is_hut': null,
			'city': null,
			'area':  null,
			'capacity': null,
			'date': null,
		},
		success: function(data){
			console.log(data);
			$('#featuredhuts').append(data);
		}
	});
});