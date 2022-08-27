package com.eomcs.concurrent;

public class MyThreadPractice extends Thread {
  int count;

  public MyThreadPractice(int count) {
    this.count = count;
  }

  @Override
  public void run() {
    for (int i = 0; i < count; i++) {
      System.out.println("==> " + i);
    }

  }
}
