package kr.ac.kopo.YourTrip.util;
import javax.servlet.http.HttpServletRequest;
public class PageUtil {
    public String prevPage (HttpServletRequest request){
        String prevPage = request.getHeader("referer");

        return prevPage;
    }
}
