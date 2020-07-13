/*新建文件*/
function newFile(){
	showdiv();
};

function showdiv(){
  $('#my_dialog').dialog({
	  modal:true,
	  width:"700",
  	});
};


// 取消按钮
function create_paper_cancel(){
	alert("取消");
	$('#my_dialog').dialog("close");
};

// 保存按钮
function create_paper_save(){
	$('#my_dialog').dialog("close");
	var create_name = $("#create_name").val(); 
	var create_author = $("#create_author").val(); 
	alert("保存！");
};

