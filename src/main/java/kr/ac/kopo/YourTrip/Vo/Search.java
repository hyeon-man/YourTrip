package kr.ac.kopo.YourTrip.Vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Search {
    private String keyword;
    private int kind;

    private int page = 1;
    private int perPage = 9;

    private int total;

    public int nextPage() {

        return page + 1;
    }

    public int prevPage() {
        if (page == 1) {
            return page = 1;
        } else
            return page = page - 1;
    }
}
