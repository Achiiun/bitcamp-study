<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.List"%>
<%@ page import= "com.bitcamp.board.dao.BoardDao"%>
<%@ page import= "com.bitcamp.board.domain.Board"%>

<%! 
  BoardDao boardDao;

  public void init() throws ServletException {
    boardDao = (BoardDao) this.getServletContext().getAttribute("boardDao");
  }
%>

<!DOCTYPE html>
<html> 
  <head> 
  <meta charset="UTF-8"> 
  <title>bitcamp</title> 
  <style> 
  tr:hover { 
    background-color: navy; 
    color: white; 
  } 
  </style> 
  </head> 
  <body> 
  <h1>게시글-JSP</h1> 
  <a href='form'>새 글</a> 
  <table border='1'> 
    <tr> 
      <th>번호</th> 
      <th>제목</th> 
      <th>조회수</th> 
      <th>작성자</th> 
      <th>등록일</th> 
    </tr> 
<%
try {
  List<Board> boards = boardDao.findAll();
  for (Board board : boards) {
%>
    <tr>
      <td><%=board.no %></td>
      <td><a href='detail?no=<%=board.no%>'><%=board.title%></a></td>
      <td><%=board.viewCount%></td>
      <td><%=board.memberNo%></td>
      <td><%=board.createdDate%></td>
    </tr> 
<%
  }
%>
   </table>
<%
} catch (Exception e) {
%>
  <p>실행 중 오류 발생!</p>
<%
}
%>
  <p><a href='/app/welcome'>메인</a></p> 
  </body> 
</html>
