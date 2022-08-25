package com.eomcs.net.practice;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.Socket;
import java.util.Scanner;

public class CalculatorClient {
  public static void main(String[] args) {

    try (
        Scanner keyboardScanner = new Scanner(System.in);
        Socket socket = new Socket("localhos", 8888);
        PrintStream out = new PrintStream(socket.getOutputStream());
        BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()))) {

      readResponse(in);

      while (true) {
        String input = keyboardScanner.nextLine();
        out.println(input);
        out.flush();
        readResponse(in);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  static void readResponse(BufferedReader in) throws Exception {
    while (true) {
      String input = in.readLine();
      if (input.length() == 0) {
        break;
      }
      System.out.println(input);
    }
  }
}
