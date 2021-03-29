<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width" initial-scale="1">
   <link rel="stylesheet" href="css/bootstrap.css">
   <title>불만을 남겨줘!!</title>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>
   
   <script type="text/javascript">
      var request = new XMLHttpRequest(); //서버에게 요청할 준비
      
      function searchFunction(){ //검색어 입력박스의 텍스트 가져오기
          if(event.keyCode == 13){
             request.open("Post", "./UserSearchServlet?msg_title=" + encodeURIComponent(document.getElementById("msg_title").value), true);//검색어(keyword)를 query라는 변수에 담아서, searchservlet으로 전송할 예정(도로지정)
             request.onreadystatechange = searchProcess; //
             request.send(null); //요청을 보내기
          }
       }
      
      function searchProcess()
      {
         var table = document.getElementById("ajaxTable");
         table.innerHTML = "";
         
         if(request.readyState == 4 && request.status == 200)
         {
            console.log(request.responseText);
        	 var object = eval('('+ request.responseText + ')');
            var result = object.result;
            
            for(var i=0; i < result.length; i++)
            {
               var row = table.insertRow(0);
               for(var j = 0; j < result[i].length; j++){
                  var cell = row.insertCell(j);
//                   cell.setAttribute("href","view.jsp?msg_id="+result[i][j].value);
				  if(j ==  1) { //제목 일 경우 
					  cell.innerHTML = '<a href=view.jsp?msg_id='+result[i][0].value+'>'+result[i][j].value+'</a>';
				  } else {
                      cell.innerHTML = result[i][j].value;
			      }
               }
            }
         }
      }
      
   </script>
   
</head>

<body>
		<nav class="navbar navbar-default">
		<div class="navbar-brand"><a href="main.jsp">불만을 남겨줘</a></div>
		<div class="navbar-header">
			<button class="navbar-toggle" 
			        data-target="#menu-items"
			        data-toggle="collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		
		<div class="collapse navbar-collapse" id="menu-items">
			<ul class="nav navbar-nav">
				<li><a href="food.jsp">게시글</a></li>
				<li class="active"><a href="User.jsp">검색</a></li>
				<li><a href="file.jsp">업로드</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" 
					   data-toggle="dropdown">더보기
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="information.jsp">회원정보</a></li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
   <br>
         <!-- 검색어 입력 창 및 검색 버튼  -->
         <div class="form-group row pull-right">
            <div class="col-xs-8">
               <input class="form-control" type="text" size="20" id="msg_title" onkeyup="searchFunction()">
            </div>
            <div class="col-xs-2">
               <button class="btn btn-primary" style="background-color: #f8ecc9" type="button" onclick="searchFunction()">검색</button>
            </div>
         </div>
         
         <!-- 검색 결과 표시  -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th style="background-color: #f8ecc9; text-align: center;">번호</th>
						<th style="background-color: #f8ecc9; text-align: center;">제목</th>
						<th style="background-color: #f8ecc9; text-align: center;">내용</th>
						<th style="background-color: #f8ecc9; text-align: center;">작성날짜</th>
						<th style="background-color: #f8ecc9; text-align: center;">작성자</th>
					</tr>
				</thead>
            
            <tbody id="ajaxTable">   
            </tbody>
         </table>
      </div>
</body>

</html>