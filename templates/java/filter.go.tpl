package {{getFullNameSpace}};

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class {{getObjectName "filter"}} {

    public enum Operator {
        EQ, GT, LT, GTE, LTE, CONTAINS, STARTS_WITH, ENDS_ON;
    }

    private String attribute;
    private String value;
    private Operator filterOperator;

}