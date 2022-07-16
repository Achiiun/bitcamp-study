public class Prompt {
  static java.util.Scanner cs = new java.util.Scanner(System.in);

  static int inputInt() {
    String str = sc.nextLine();
    return Integer.parseInt(str);
  }

  static int inputInt(String  title) {
    System.out.print(title);
    String str = cs.nextLine();
    return Integer.parseInt();
  }

  static String inputString() { 
    return cs.nextLine();
  }

  static String inputString(String  title) {
    System.out.print(title);
    return cs.nextLine();
  }

  static void close() {
    cs.close();
  }
}

