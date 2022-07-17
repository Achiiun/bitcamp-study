/*
 * 게시글 메뉴 처리 클래스
 */
package com.bitcamp.board;

public class BoardHandler {

  static int boardCount = 0; //저장된 게시글의 개수

  static final int SIZE = 3;

  // Board 인스턴스의 주소를 저장할 레퍼런스 배열을 만든다.
  static Board[] boards = new Board[SIZE];


  static void processList() {

    //날짜 정보에서 값을 추출하여 특정 포맷의 문자열로 만들어줄 도구를 준비
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");    

    System.out.println("[게시글 목록]");
    System.out.println("번호\t 제목\t 조회수\t 작성자\t 등록일");

    for (int i = 0; i < boardCount; i++) {
      Board board = boards[i];

      // 밀리초 데이터 => Date class으로 날짜 정보를 설정
      java.util.Date date = new java.util.Date(board.createdDate);

      String dateStr = formatter.format(date); // 날짜 정보 => "yyyy-mm-dd"형식의 문자열로 변환

      System.out.printf("%d\t%s\t%d\t%s\t%s\n",
          board.no,board.title,board.viewCount,board.writer,dateStr);
    }
  }

  static void processDetail() {
    System.out.println("[게시글 상세보기]");

    int boardNo = Prompt.inputInt("조회할 게시글 번호?");

    // 해당 번호의 게시글이 몇 번 배열에 들어 있는지 알아내기
    Board board = null;
    for (int i = 0; i < boardCount; i++) {
      if (boards[i].no == boardNo) {
        board = boards[i];
        break;
      }
    }
    //사용자가 입력한 번호에 해당하는 게시글을 못 찾았다면
    if (board == null) {
      System.out.println("해당 번호의 게시글이 없습니다!");
      return;
    }

    System.out.printf("번호:%d\n", board.no);
    System.out.printf("제목:%s\n", board.title);
    System.out.printf("내용:%s\n", board.content);
    System.out.printf("조회수:%d\n", board.viewCount);
    System.out.printf("작성자:%s\n", board.writer);

    // Date 도구함의 도구를 쓸 수 있도록 데이터를 준비시킨다.
    // new Date(밀리초)
    //   => 지정한 밀리초를 가지고 날짜 관련 도구를 사용할 수 있도록 설정한다.
    // Date date;
    //   => createdDate 밀리초를 가지고 설정한 날짜 정보
    java.util.Date date = new java.util.Date(board.createdDate);

    // Date 도구함을 통해 설정한 날짜 정보를 가지고 printf()를 실행한다.
    // %tY : date에 설정된 날짜 정보에서 년도만 추출한다.
    System.out.printf("등록일: %1tY-%1$tm-%1$td %1$tH:%1$tM\n", date);
  }

  static void processInput() {
    System.out.println("[게시글 등록]");

    //배열의 크기를 초과하지 않았는지 검사한다
    if (boardCount == SIZE) {
      System.out.println("게시글을 더이상 저장할 수 없습니다.");
      return; //호출한 method로 돌아가라
    }

    Board board = new Board();

    board.title = Prompt.inputString("제목?");
    board.content = Prompt.inputString("내용?");
    board.writer = Prompt.inputString("작성자?");
    board.password = Prompt.inputString("암호?");

    board.no = boardCount == 0 ? 1 : boards[boardCount - 1].no +1;

    board.viewCount = 0;
    board.createdDate = System.currentTimeMillis();

    // 새로 만든 인스턴스 주소를 레퍼런스 배열에 저장한다.
    boards[boardCount] = board;

    boardCount++;

    System.out.println("게시글을 등록했습니다.");
  }

  static void processDelete() {
    System.out.println("[게시글 삭제]");

    int boardNo = Prompt.inputInt("삭제할 게시글 번호? ");

    // 해당 번호의 게시글이 몇 번 배열에 들어 있는지 알아내기
    int boardIndex = -1;
    for (int i = 0; i < boardCount; i++) {
      if (boards[i].no == boardNo) {
        boardIndex = i;
        break;
      }
    }

    // 사용자가 입력한 번호에 해당하는 게시글을 못 찾았다면
    if (boardIndex == -1) {
      System.out.println("해당 번호의 게시글이 없습니다!");
      return;
    }

    // 삭제할 게시글의 다음 항목을 앞으로 당긴다.
    for (int i = boardIndex + 1; i < boardCount; i++) {
      boards[i - 1] = boards[i];
    }

    // 게시글 개수를 1개 줄이고 맨 마지막 레퍼런스는 null 로 비운다.
    boards[--boardCount] = null;

    System.out.println("삭제하였습니다.");
  }

  public static void processUpdate() {
    System.out.println("[게시글 변경]");

    int boardNo = Prompt.inputInt("변경할 게시글 번호? ");

    // 해당 번호의 게시글이 몇 번 배열에 들어 있는지 알아내기
    Board board = null;
    for (int i = 0; i < boardCount; i++) {
      if (boards[i].no == boardNo) {
        board = boards[i];
        break;
      }
    }

    // 사용자가 입력한 번호에 해당하는 게시글을 못 찾았다면
    if (board == null) {
      System.out.println("해당 번호의 게시글이 없습니다!");
      return;
    }
    String pwcorrect = Prompt.inputString("패스워드?");
    if (pwcorrect.equals(board.password)) {

      String newTitle = Prompt.inputString("제목?(" + board.title + ") ");
      String newContent = Prompt.inputString(String.format("내용?(%s) ", board.content));

      String input = Prompt.inputString("변경하시겠습니까?(y/n) ");
      if (input.equals("y")) {
        board.title = newTitle + "[수정]";
        board.content = newContent;
        System.out.println("변경했습니다.");
      } else {
        System.out.println("변경 취소했습니다.");
      }
    } else {
      System.out.println("패스워드가 올바르지 않습니다.");
    }
  }
}
