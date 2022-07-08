package com.bitcamp.board;

public class BoardListApp {
  public static void main(String[] args) {
    System.out.println("번호\t 제목\t 조회수\t 작성자\t 등록일");
    System.out.print(1);
    System.out.print("\t");
    System.out.print("제목입니다1");
    System.out.print('\t');
    System.out.print(20+"\t");
    System.out.print("홍길동\t");
    System.out.print("2022-07-08\r\n");

    System.out.print(2+ "\t"+ "제목입니다2\t" + 11 + "\t" + "홍길동\t"+"2022-07-08\n");
    
    System.out.println(3+ "\t제목입니다3\t" + 31 + "\t" + "홍길동\t2022-07-08");

    System.out.printf("%d\t%s\t%d\t%s\t%s\n",4,"제목입니다4",41,"홍길동","2022-07-08");
  }
}