$(function(){
	var Cities=["Karachi","Lahore"];
	var huts=[];
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
	var showHut = function(){
		console.log(huts);
		var i=$(this).parents('.card').index();
		var h = huts[i];
		
	}
	$('#hut .carousel-item').each(function(){
		var src = $(this).find('img').attr('src');
		$(this).css('background-image','url('+src+')');
	});
	$('#lim').bind('ajaxStart', function(){
	    $(this).show();
	});
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
			data = $.parseJSON(data);
			for(var r in data){
				$h = data[r];
				huts.push($h);
				$isH= $h["is_hut"] ? "Hut" + " | ": "Farmhouse" + " | ";
				$area= $h["area"]==null ? "" : $h["area"]+" | ";
				$("#featuredhuts .row").append('<div class="card featured" style="width:300px;"><img class="card-img-top" src="'+$h["url"]+'" alt="'+$h["name"]+'"><div class="card-body"><h5 class="card-title">'+$h["name"]+'<br><small class="text-muted">'+$isH+$area+Cities[$h["city"]]+'</small></h5><div class="rating" data-rating="'+$h["rating"]+'"></div><a href="#0" hut-id="'+$h["id"]+'" class="booker btn btn-primary">Book It</a></div></div>');

			}
			rate();
			$('.card a').on('click',showHut);
		},
		complete:function(){
			$("#lim").hide();
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
	
	$('.scroller').css('height',(144/$('.content').height())*100+'%');
	$( ".scroller" ).draggable({ axis: "y" ,containment: "parent",scroll: true, scrollSensitivity: 100});
	$('#close-hut').click(function(){
		
		$( "#hut" ).hide( 'drop', 300);
	});
});
