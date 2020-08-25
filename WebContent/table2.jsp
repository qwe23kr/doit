<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<style>
th{
color:green;

}
td{
color:red;

}

</style>
<body>
<script>
var corList=[
	   {corNo:'053',corArea:'대구',corSum:6978,corNew:0},
	   {corNo:'02',corArea:'서울',corSum:2986,corNew:97},
	   {corNo:'031',corArea:'경기',corSum:2612,corNew:85},
	   {corNo:'054',corArea:'경북',corSum:1443,corNew:6},
	   {corNo:'032',corArea:'인천',corSum:543,corNew:20},
	   {corNo:'062',corArea:'광주',corSum:280,corNew:1},
	   {corNo:'051',corArea:'부산',corSum:262,corNew:3},
	   
	   ];
	   var loadData= function(){
	   
	     var corSumTotal=0;
	      var corNewTotal=0;
	      var html = '';
	      for(var i=0;i<corList.length;i++){
	         var cor= corList[i];
	         html +='<tr>';
	         
	         $('th[data-col]').each(function(idx,th){
	            var col = th.getAttribute('data-col')
	         html += '<td>' +cor[col]+'</td>';
	         if(col=='corSum'){
	       	  corSumTotal+= cor[col];
	         }else if(col=='corNew'){
	       	  corNewTotal +=cor[col];
	       	  
	         }
	         
	         })
	         html +='</tr>';
	      }
	      
	      html+='<tr><td colspan="2">합계</td>';
	      html+='<td>'+corSumTotal+'</td>';
	      html+='<td>'+corNewTotal+'</td></tr>';
	     
	      $('#dataBody').html(html);
	   }
	   $(document).ready(loadData);
	   </script>
	      <table class="table table-bordered">
	         <tr>
	            <th data-col="corNo">지역번호</th>
	            <th data-col="corArea">지역</th>
	            <th data-col="corSum">총확진자</th>
	            <th data-col="corNew">신규확진자</th>
	         </tr>
	         <tbody id="dataBody"></tbody>
	      </table>

	   </body>
	   </html>