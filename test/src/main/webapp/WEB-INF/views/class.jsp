<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/jqgrid/4.6.0/css/ui.jqgrid.css" rel="stylesheet">
    <script type="text/javascript">
    function test(grade){
    	$("#classno").empty();
    	$("#classno").append("<option value="+0+">全年级</option>");
    	$.ajax({
			type:"POST",
			url:grade + "getclass.do",
			dataType: "text",
			success:function(data){
				var classmax = parseInt(data);
			 	for(var i = 1;i<classmax+1;i++){
			 		$("#classno").append("<option value="+ i +">" + i + "班</option>");
			 	}
			},
			error: function () {
					alert("加载失败！")
			}
		})
    };
    </script>
</head>
<body>
	<div class="container-fluid">
	    <div class="row">
    		<div class="col-sm-11 col-sm-offset-1">
        		<h1>TEST</h1>
	        </div>
    	    <div class="col-sm-12"><hr></div>
        	<div class="col-sm-2 col-sm-offset-1">
				<form class="form-inline">
					<div class="form-group">
						<select id=“gradeno” class="form-control"
							onchange="test(this.options[this.options.selectedIndex].value)">
							<option value="0">请选择年级</option>
							<option value="1">一年级</option>
							<option value="2">二年级</option>
							<option value="3">三年级</option>
							<option value="4">四年级</option>
							<option value="5">五年级</option>
							<option value="6">六年级</option>
						</select> <select id="classno" class="form-control">
							<option value="0">全班级</option>
						</select>
						<select id="course" class="form-control">
							<option value="0">请选择科目</option>
							<option value="1">语</option>
							<option value="2">数</option>
							<option value="3">外</option>
							<option value="4">美</option>
							<option value="5">体</option>
							<option value="6">德</option>
						</select>
						<button onclick="getstudent()">查询</button>
					</div>
				</form>
			<div class="col-sm-5">
				<table class="table table-hover" id="student" ></table>
			</div>
			</div>
    	</div>
	</div>

    <script src="http://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap-treeview/1.2.0/bootstrap-treeview.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdn.bootcss.com/jqgrid/4.6.0/js/jquery.jqGrid.min.js"></script>
	<script src="https://cdn.bootcss.com/jqgrid/4.6.0/js/i18n/grid.locale-cn.js"></script>
<script>
var datastr;
$(document).ready(function aaa(){ 
	$.ajax({
		type:"POST",
		url:"getclass.do",
		dataType: "text",
		success:function(data){
			var datajson = JSON.parse(data);
			var datalist = datajson.list;
			datastr = datalist;
// 			console.log(data);
		console.log(datalist);
			console.log(datastr);

		},
		error: function () {
				alert("加载失败！")
		}
	})
	console.log(datastr)
	jQuery("#student").jqGrid({ 
		 data:datastr, //生成json数据的url源  
		    datatype: 'local',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside  
		    colNames:['id','年级','班级'],     //表格的显示字段  
		    colModel:[      
		    {name:'id',index:'id', width:90,sorttype:"int"},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比  
		    {name:'grade',index:'grade', width:110,sorttype:"int"},      
		    {name:'classno',index:'classno', width:110,sorttype:"int"}       
		    ],      
});
console.log(datastr);
})

$(document).ready(function(){ 

})
	
//     jQuery("#student").jqGrid({   //jsonTable为页面中需要显示内容的table的id  
//     url:'getclass.do', //生成json数据的url源  
//     datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside  
//     colNames:['id','年级','班级'],     //表格的显示字段  
//     colModel:[      
//     {name:'id',index:'id', width:90,sorttype:"int"},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比  
//     {name:'grade',index:'grade', width:110,sorttype:"int"},      
//     {name:'classno',index:'classno', width:110,sorttype:"int"}       
//     ],      
//     rowNum:10,  //在grid上显示记录条数，也就是pageSize，这个参数是要被传递到后台  
//     rowList:[10,20,30], //用来改变显示记录数，当选择时会覆盖rowNum参数传递到后台  
//  //   pager: "datapager", //datapager为显示页码的div  
         
//     multiselect: false, //是否可多选，多选的话前面有多选框      
//     sortname: 'id',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台  
//     viewrecords: true,  //是否显示记录总数  
//     sortorder: "desc",      
//     cellEdit:false, //是否可以编辑表格  
//     lastpage:20,    //  
//     caption: "第一个表格",   //表格名称  
//     height: 220,  
//     jsonReader: {    //jsonReader来跟服务器端返回的数据做对应  
//         root: "dataRows",  //包含实际数据的数组  
//         page: "currPage",  //当前页  
//         total: "totalPage",//总页数  
//         records:"totalCount", //查询出的记录数  
//         repeatitems : false      
//     },  
      
//     onSelectRow: function(id){     
//         alert("第"+id+"行被选中");    
//     },  
      
//     onPaging:function(){  
//         alert("翻页键被按下");  
//     }  
 
//     }).navGrid('datapager',    
//             {view:true,edit:true,add:false,del:false},    
//             {closeOnEscape:true}  
              
// );     
           
// });     

</script>

    
</body>
</html>