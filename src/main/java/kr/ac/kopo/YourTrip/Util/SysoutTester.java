package kr.ac.kopo.YourTrip.Util;

public class SysoutTester {


    /**
     * String형 테스트
     *
     * @param test
     * @param className
     */
    public void test(String test, String className) {
        System.out.println("<-- " + "호출된 클래스명:" + className + "/ 변수 값 :" + test + "-->");
    }

    /**
     * int형 테스트
     *
     * @param className
     * @param test
     */
    public void intTest(String className, int test) {
        System.out.println("<-- " + "호출된 클래스명:" + className + "/ 변수 값 :" + test + "-->");
    }

    /**
     * boolean형 테스트
     *
     * @param className
     * @param test
     */
    public void booleanTest(String className, Boolean test) {
        System.out.println("<-- " + "호출된 클래스명:" + className + "/ 변수 값 :" + test + "-->");
    }
}
