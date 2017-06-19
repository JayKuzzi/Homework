function teacher() {
	document.getElementById("right").innerHTML = "管理老师列表";
 
}


function student() {
	var content =document.getElementsByTagName("p")[0].innerHTML;
	
	document.getElementById("right").innerHTML = content;
}

function homework() {
	document.getElementById("right").innerHTML = "管理作业列表";
}