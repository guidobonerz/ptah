package {{getFullNameSpace}};

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class {{getObjectName "sorter"}} {

    public static final enum Direction {
        ASCENDING, DESCENDING;
    }

    private String attribute;
    private Direction sortOrder;
}