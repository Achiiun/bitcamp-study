
package com.bitcamp.board;

public class App {
  static java.util.Scanner sc = new java.util.Scanner(System.in);

  static final int SIZE = 3;

  static int[] no = new int[3];
  static String[] title = new String[SIZE];
  static String[] content = new String[SIZE];
  static String[] writer = new String[SIZE];
  static String[] pw = new String[SIZE];
  static int[] view = new int[SIZE];
  static long[] createdDate = new long[SIZE];

  static int boardCount = 0;

  public static void main(String[] args) {
    welcome();
    loop: while(true){
    displayMenu();
    int menuNo = sc.nextInt();
    sc.nextLine();
    displayLine();
    
    switch (menuNo) {
      case 0:
        break loop;
      case 1:
        processBoardList(); break;
      case 2:
        processBoardDetail(); break;
      case 3:
        processBoardInput(); break;
      default:
        System.out.println("해당 메뉴 번호가 없습니다.");
    }

    displayBlankLine();
  }
    System.out.println("안녕히가세요");
    sc.close();
  }

  static void displayMenu() {
    System.out.println("메뉴: ");
    System.out.println("  1.게시판 상세보기");
    System.out.println("  2.게시글 목록");
    System.out.println("  3.게시글 등록");
    System.out.println();
    System.out.println("메뉴를 선택해주세요[1..3](종료: 0)");

  }

  static void displayLine() {
    System.out.println("=================================================");
  }

  static void processBoardList() {

    System.out.println("[게시글 목록]");
    System.out.println("번호\t제목\t조회수\t작성자\t등록일");
    for (int i = 0; i < boardCount; i++) {

      java.util.Date date = new java.util.Date(createdDate[i]);

      java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");

      String dateStr = formatter.format(date);

      System.out.printf("%d\t%s\t%d\t%s\t%s\n",
          no[i], title[i], view[i], writer[i], dateStr);
    }

  }

  static void processBoardDetail() {
    System.out.println("[게시판 상세보기]");

    String input = sc.nextLine();
    int boardNo = Integer.parseInt(input);

    int boardIndex = -1;
    for (int i = 0; i < boardCount; i++) {
      if (no[i] == boardNo) {
        boardIndex = i;
        break;
      }
    }
    if (boardIndex == -1) {
      System.out.println("해당 번호의 게시글이 없습니다!");
      return;
    }
    System.out.printf("번호: %d\n", no[boardIndex]);
    System.out.printf("제목: %s\n", title[boardIndex]);
    System.out.printf("내용: %s\n", content[boardIndex]);
    System.out.printf("조회수: %d\n", view[boardIndex]);
    System.out.printf("작성자: %s\n", writer[boardIndex]);

    java.util.Date date = new java.util.Date(createdDate[boardIndex]);

    System.out.printf("등록일: %1tY-%1$tm-%1$td %1$tH:%1$tM\n", date);
    System.out.println();

  }

  static void processBoardInput() {
    System.out.println("[게시글 등록]");

    if (boardCount == SIZE) {
      System.out.println("게시글을 더이상 저장할 수 없습니다.");
      return;
    }

    System.out.print("제목?");
    title[boardCount] = sc.nextLine();
    System.out.print("내용?");
    content[boardCount] = sc.nextLine();
    System.out.print("작성자?");
    writer[boardCount] = sc.nextLine();
    System.out.print("암호?");
    pw[boardCount] = sc.nextLine();

    no[boardCount] = boardCount == 0 ? 1 : no[boardCount - 1] + 1;

    view[boardCount] = 0;
    createdDate[boardCount] = System.currentTimeMillis();

    boardCount++;

  }

  static void displayBlankLine() {
    System.out.println();
  }

  static void welcome() {

    System.out.println("[게시판 어플리케이션]");
    System.out.println();
    System.out.println("환영합니다.");
    System.out.println();

  }
}
