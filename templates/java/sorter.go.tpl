package {{getFullNameSpace}};

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class {{getObjectName "sorter"}} {

    public enum Direction {
        ASCENDING("asc"), DESCENDING("desc");
    }

    private String attribute;
    private Direction sortOrder;
}