let data;
function wck(){
	if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}
}

function members(){
	if(data.readyState == XMLHttpRequest.DONE && data.status == 200){
		member_list(data.response);
	}
	else if (data.status == 404){
		error();
	}
}
data = wck();
data.onreadystatechange = members;
data.open("GET","./index3.json",true);
data.send();

function member_list(jdata){
	var j = JSON.parse(jdata);
	var tbody = document.getElementById("tbody");
//내코드
//	for(var i = 6; i >= 0; i--){
//		var a = 1 +i;
//		var v  =  "<tr><td>"+ a +"</td><td>"+ j["members"][i]["id"] +"</td><td>"+j["members"][i]["name"] + "</td><td>"+j["members"][i]["email"]+"</td><td>"+j["members"][i]["phone"]+"</td><td>"+j["members"][i]["area"]+"</td></tr>";
//		tbody.innerHTML += v;
//	}

//선생님 코드

	var total = j["members"].length;
	var tbody = document.getElementById("tbody");
	var tr, td, text;
	
	for( var f in j.members ){
		tr = document.createElement("tr");
		td = document.createElement("td");
		td.innerText = total;
		tr.append(td);
		
		//getAttribute : 속성값을 가져올때 (스타일,onclick, class ...etc)
		//setAttribute : 속성값을 설정할때 (스타일,onclick, class ...etc)
		
		for(var ff in j.members[f]){
			
			if(ff=="id"){
         		tr.setAttribute("onclick","java_get('"+j.members[f][ff]+"')");
				td = document.createElement("td");
			}
			if(ff == "area"){
				ff = "phone"
			}
			else if(ff = "phone"){
				ff = "area"
			}
			text = document.createTextNode(j.members[f][ff]);
			td.append(text);
			tr.append(td);
			
			//console.log(j.members[f][ff]);
		}
		tbody.append(tr);
		total--;
	}

}

function error(){
	alert("해당 파일을 로드할 수 없습니다.");
	return false;
}


function java_get(tbody){
	alert("test");
	location.href = "./index3.html?tbody=" + tbody;
}

