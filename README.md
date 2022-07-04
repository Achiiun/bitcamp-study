# bitcamp-study
2022-07-04~2022-11-25 bitcamp study

*2022.07.04(Mon)
1.git client download(git server에 응답해서 자료를 다운받기위해)
-cmd(명령 프롬프트)에서 디렉토리 생성 : >mkdir 디렉토리이름
-git 설치 시 체크해야 하는 두 가지 Override the default~~ main
                                 None : Do not use a credential help
-cmd(명령 프롬프트)에서 git 서버 복사해오는 방법
: >git clone URL(Uniform Resource Locator)

2.JDK(Java Development Kit) 설치
2-1 제품군: JAVA SE,EE,ME
*JAVA SE(Standard Edition-Java App. 일반용)
  -JDK(Java Development Kit): Java App. 개발도구(컴파일러,JVM,디버거,JavaDoc,...)
  -JRE(Java Runtime Environment): Java App. 실행도구
*JAVA EE(Enterprise Edition-Java App. 기업용)
  -분산 컴퓨팅
  -웹 컴퓨팅
  -서버자원관리
  -보안
  -...
2-2 설치 순서
 ①JDK설치
 ②JAVA_HOME 환경변수 설정: 일부의 Java App.은 실행될 때 JDK 또는 JRE가 설치된 폴더의 위치를 조회하는 경우가 있기 때문에 설정
 ③PATH 환경변수에 프로그램 폴더 경로 등록: cmd(명령프롬프트)의 디렉토리 위치에 상관없이 자바 개발도구를 실행할 수 잇도록 하기 위해 등록

3.VSCode(Editor) 설치
  -확장프로그램: Extension Pack for Java, Gradle for Java

4."Hello" 출력해보기
①VSCode 작성
// 컴파일 테스트    
class Hello {
    public static void main(String[] args){
        System.out.println("Hello!");
    }
}
②compile
cmd(명령 프롬프트)
>javac Hello.java  
③출력
cmd(명령 프롬프트)
>java Hello
*주의사항
vscode ----------> *.java --------->*.class
       저장(UTF-8)         compile
                           -Windows:OS의 기본 문자집합인 MS949로 저장되었다고 간주하기 때문에 한글입력시 오류발생시 -> >javac -encoding UTF-8 *.java
                           -UNIX:UTF-8로 저장되었다고 간주
