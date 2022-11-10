package kr.ac.kopo.YourTrip.Util;
import javax.servlet.http.HttpServletRequest;
public class PageUtil {
    final  SysoutTester tester = new SysoutTester();
     public String prevPage (HttpServletRequest request){
        String prevPage = request.getHeader("referer");
        tester.test(prevPage, getClass().getSimpleName());
        return prevPage;
    }
}
