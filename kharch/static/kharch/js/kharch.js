function showKharch(items){
	var canvas = document.getElementById("can");
	var ctx = canvas.getContext("2d");
	var lastend = 0;
	var data = items;
	var myTotal = 0;
	var myColor = ['#2ecc71','#e74c3c','#7f8c8d','#e67e22','#e67e22','#2c3e50'];

	for(var e = 0; e < data.length; e++)
		myTotal += data[e];

	for (var i = 0; i < data.length; i++) {
		ctx.fillStyle = myColor[i];
		ctx.beginPath();
		ctx.moveTo(canvas.width/2,canvas.height/2);
		ctx.arc(canvas.width/2,canvas.height/2,canvas.height/2,lastend,lastend+(Math.PI*2*(data[i]/myTotal)),false);
		ctx.lineTo(canvas.width/2,canvas.height/2);
		ctx.fill();
		lastend += Math.PI*2*(data[i]/myTotal);
	}
}	

// not using this function but can help in some way 
function show_items(obj,categories){
	var sel = obj[obj.selectedIndex].value;
	categories = $.grep(categories, function(value) {
		return value != sel;
	});
	for (var i = 0; i < categories.length; i++) {
		$( "input[id^='"+ categories [i]+ "'" + "]" ).remove();
	}
	$.get('/kharch/show-items/', {'category': sel}, function(response) {
		items = response.split(",");
		
		for (var i = 0; i < items.length; i++) {
			if (items != ""){
				$("#"+sel+"_"+i).remove();

				var btn = $('<input/>').attr({ type: "button", id: sel + "_" + i , value: items[i] , class: 'btn btn-danger',
							onclick: 'buy_item(' + sel + "," + items[i]  + ')'});
			}
			$("#id_category").after(btn);
			$("#buy").remove();
		}
		
	});
}

function filter_item(category,categories){
	var sel = category[category.selectedIndex].value;
	if (sel == "SL"){
		for (var i = 0; i < categories.length; i++) {
			$("."+categories[i]).css("display","block");
		}
		return ;
	}
	categories = $.grep(categories, function(value) {
		return value != sel;
	});

	for (var i = 0; i < categories.length; i++) {
		$("."+categories[i]).css("display","none");
	}
	$("."+sel).css("display","block");
}

function clear_suggestion(){
	v = $( "input[id='sug']" ).val();
	if (v == "")
		$("#suggested").css('display','none');
}

function show_suggestion(chars){
	// console.log(chars);
	// console.log(chars.value);
	$.get('/kharch/search-item/', {'chars': chars.value}, function(response) {
		console.log(response);
		for (var i = 0; i < response.length; i++) {
			// console.log(response[i]);
			$("#suggested").val(response);
			$("#suggested").css('display','inline');
		}
		
	});
	clear_suggestion();
}


function validateForm(){
	form = document.getElementById("cash_fm").name;

	if (form == "cash_form"){
		capital = document.getElementById("id_capital").value;
		if (capital < 1 ){
			$("#alert_message h4").text("Cash is not sufficient.");
			$("#alert_message").css('display','block');
			return false;
		}
		return true;
	}

	username = document.getElementById("username").value;
	password = document.getElementById("password").value;
	if (username == ""){
		$("#alert_message h4").text("Username is incorrect.");
		$("#alert_message").css('display','block');
		return false;
	}

	if (password == ""){
		$("#alert_message h4").text("Password is incorrect.");
		$("#alert_message").css('display','block');
		return false;
	}
	return true;
}

