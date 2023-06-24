package {{getFullNameSpace}};

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class {{getObjectName "result"}}<V> {
    private long total;
    private String path;
    private Long id;
    private List<V> resultList;

    public Result(long total, List<V> resultList) {
        this.total = total;
        this.resultList = resultList;
    }
}







