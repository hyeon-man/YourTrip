package kr.ac.kopo.YourTrip.Util;
import javax.servlet.http.HttpServletRequest;
public class PageUtil {
     public String prevPage (HttpServletRequest request){
        String prevPage = request.getHeader("referer");

        return prevPage;
    }
}
