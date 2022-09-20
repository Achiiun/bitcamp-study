/*
 * 게시글 메뉴 처리 클래스
 */
package com.bitcamp.board.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bitcamp.board.dao.BoardDao;
import com.bitcamp.board.dao.MariaDBBoardDao;
import com.bitcamp.board.domain.Board;


@WebServlet(value="/board/detail")
public class BoardDetailServlet extends HttpServlet {

  @Override
  public void init(ServletConfig config) throws ServletException {
    this.init();
  }  

  @Override
  public void init() {

    try {
      Class.forName ("org.mariadb.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    Connection con = null;
    try {
      con = DriverManager.getConnection( "jdbc:mariadb://localhost:3306/studydb","study","1111");
    } catch (SQLException e) {
      e.printStackTrace();
    }
    MariaDBBoardDao boardDao = new MariaDBBoardDao(con);
    this.boardDao = boardDao;
  }

  private BoardDao boardDao;

  @Override
  protected void service(HttpServletRequest req, HttpServletResponse res)
      throws ServletException, IOException {

    res.setContentType("text/html; charset=UTF-8");

    PrintWriter out = res.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<meta charset=\"UTF-8\">");
    out.println("<title>bitcamp</title>");
    out.println("</head>");
    out.println("<body>");
    out.println("<h1>게시글 상세 정보</h1>");

    int boardNo = Integer.parseInt(req.getParameter("no"));

    Board board = null;
    try {
      board = boardDao.findByNo(boardNo);
    } catch (Exception e) {
      e.printStackTrace();
    }

    if (board == null) {
      out.println("<p>해당 번호의 게시글이 없습니다.</p>");

    } else {
      out.println("<form action='update'>");
      out.println("<table border='1'>");
      out.println("  <tr>");
      out.printf("    <th>번호</th><td><input name='no' type='number' value='%d' readonly></td>", board.no);
      out.println("  </tr>");
      out.println("  <tr>");
      out.printf("    <th>제목</th><td><input name='title' type='text' value='%s' size='60'></td>", board.title);
      out.println("  </tr>");
      out.println("  <tr>");
      out.printf("    <th>내용</th><td><textarea name='content' rows='10' cols='60'>%s</textarea></td>", board.content);
      out.println("  </tr>");
      out.println("  <tr>");
      out.printf("    <th>조회수</th><td>%d</td>", board.viewCount);
      out.println("  </tr>");
      out.println("  <tr>");
      out.printf("    <th>작성자</th><td>%d</td>", board.memberNo);
      out.println("  </tr>");
      out.println("  <tr>");
      out.printf("    <th>등록일</th><td>%s</td>", board.createdDate);
      out.println("  </tr>");
      out.println("</table>");
      out.println("<p>");
      out.println("  <button type='submit'>변경</button>");
      out.printf("  <a href='delete?no=%d'>삭제</a>", board.no);
      out.println("</p>");
      out.println("</form>");
    }

    out.println("</body>");
    out.println("</html>");
  }


}




