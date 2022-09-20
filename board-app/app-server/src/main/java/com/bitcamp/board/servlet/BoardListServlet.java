/*
 * 게시글 메뉴 처리 클래스
 */
package com.bitcamp.board.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bitcamp.board.dao.BoardDao;
import com.bitcamp.board.dao.MariaDBBoardDao;
import com.bitcamp.board.domain.Board;

@WebServlet(value="/board/list")

public class BoardListServlet extends HttpServlet {

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
    out.println("<style>");
    out.println("tr:hover {");
    out.println("  background-color: navy;");
    out.println("  color: white;");
    out.println("}");
    out.println("</style>");
    out.println("</head>");
    out.println("<body>");
    out.println("<h1>게시글</h1>");
    out.println("<a href='form'>새 글</a>");
    out.println("<table border='1'>");
    out.println("  <tr>");
    out.println("    <th>번호</th>");
    out.println("    <th>제목</th>");
    out.println("    <th>조회수</th>");
    out.println("    <th>작성자</th>");
    out.println("    <th>등록일</th>");
    out.println("  </tr>");

    List<Board> boards = null;
    try {
      boards = boardDao.findAll();
    } catch (Exception e) {
      e.printStackTrace();
    }
    for (Board board : boards) {
      out.println("<tr>");
      out.printf("  <td>%d</td>", board.no);
      out.printf("  <td><a href='detail?no=%d'>%s</a></td>", board.no, board.title);
      out.printf("  <td>%d</td>", board.viewCount);
      out.printf("  <td>%d</td>", board.memberNo);
      out.printf("  <td>%s</td>", board.createdDate);
      out.println("</tr>");
    }

    out.println("</table>");
    out.println("<p><a href='/'>메인</a></p>");
    out.println("</body>");
    out.println("</html>");
  }


  @Override
  public void init(ServletConfig config) throws ServletException {
    try {
      this.init();
    } catch (Exception e) {
      e.printStackTrace();
    }

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

}

