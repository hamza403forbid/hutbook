$(function(){
	var Cities=["Karachi","Lahore"];
	var rate= function(){
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
				$("#featuredhuts").append('<div class="hut"><img src="'+$h['url']+'" alt="'+$h['name']+'" class="profile"><div class="container"><div class="full"><h3>'+$h['name']+'</h3></div></div><div class="container"><div class="half"><div class="rating" data-rating="'+$h['rating']+'"></div></div><div class="half location"><span>'+($h['area']==null ? '':$h['area']+' | ')+'</span> <span>'+Cities[$h['city']]+'</span></div></div><div class="container"> <p class="desc">'+$h['description']+'</p> </div> <a href="#0"  data-hut-id="'+$h['id']+'" class="card_button">Book It</a> </div>');

			}
			rate();

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

});
