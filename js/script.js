$(function(){
	var Cities=["Karachi","Lahore"];
	var rate= function(){
		$('.rating').each(function(){
			var that = $(this);
			var s = parseInt($(this).attr("data-rating"));
			for(i=0;i<5;i++){
				var clss="fa fa-star";
				if(s>0){
					clss+=" on";
					s--;
				}

				that.append("<span class='"+clss+"'></span>");
			}
		});
	}
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
			// console.log(data);
			data = $.parseJSON(data);
			for(var r in data){
				$h = data[r];
				$area= $h["area"]==null ? "" : $h["area"]+" | ";
				$("#featuredhuts .row").append('<div class="card featured" style="width:300px;"><img class="card-img-top" src="'+$h["url"]+'" alt="'+$h["name"]+'"><div class="card-body"><h5 class="card-title">'+$h["name"]+'<br><small class="text-muted">'+$area+Cities[$h["city"]]+'</small></h5><div class="rating" data-rating="'+$h["rating"]+'"></div><p class="card-text">'+$h["description"]+'</p><a href="#0" hut-id="'+$h["id"]+'" class="btn btn-primary">Book It</a></div></div>');

			}
			rate();

		}
	});

	$(window).on('scroll',function(){
		if($(window).scrollTop()==0){
			$('nav').removeClass('active');
		}
		else{
			$('nav').addClass('active');
		}
	});

});
