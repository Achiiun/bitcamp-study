package com.bitcamp.servlet;

import java.io.DataInputStream;
import java.io.DataOutputStream;

// 사용자 요청을 다룰 객체의 사용법을 정의한다.
//
public interface Servlet {
  String SUCCESS = "success"; // public static final 생략
  String FAIL = "fail";

  void service(DataInputStream in, DataOutputStream out);

}
