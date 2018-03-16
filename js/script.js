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
	
	$(window).on('scroll',function(){
		if($(window).scrollTop()==0){
			$('nav').removeClass('scrld');
		}
		else{
			$('nav').addClass('scrld');
		}
	});
	$('.rating').each(function(){
		var that = $(this);
		var s = parseInt($(this).attr("data-rating"));
		for(i=0;i<5;i++){
			var clss="star";
			if(s>0){
				clss+=" on";
				s--;
			}
				
			that.append("<div class='"+clss+"'></div>");
		}
	});
});