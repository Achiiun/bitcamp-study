package com.bitcamp.algorithm;

public class Baekjoon9498 {

  public static void main(String[] args) {


    java.util.Scanner gradeInput = new java.util.Scanner(System.in);
    int grade = gradeInput.nextInt();
    if (0 <= grade && grade <= 100) {
      if (grade >= 90) {
        System.out.println("A");
      } else if (grade >= 80) {
        System.out.println("B");
      } else if (grade >= 70) {
        System.out.println("C");
      } else if (grade >= 60) {
        System.out.println("D");
      } else {
        System.out.println("F");
      }
    }
  }
}
