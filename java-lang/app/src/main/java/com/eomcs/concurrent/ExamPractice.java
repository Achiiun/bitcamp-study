// 1) 스레드 사용 
package com.eomcs.concurrent;

public class ExamPractice {

  public static void main(String[] args) {

    int count = 1000;


    new Thread(new Runnable() {

      @Override
      public void run() {
        for (int i = 0; i < count; i++) {
          System.out.println("==> " + i);
        }
      }
    }).start();

    for (int i = 0; i < count; i++) {
      System.out.println(">>> " + i);
    }
  }

}


