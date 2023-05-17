package {{getFullNameSpace}};

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

import {{getFullObjectName "filter"}};
import {{getFullObjectName "sorter"}};

@Component
@Slf4j
abstract class BaseDao {
    @Value("${app.filterSanitiser}")
    protected String filterSanitizer;

    protected String getSearchFragment(final searchText, String ... searchableAttributesNames) {
        final StringBuilder fragment = new StringBuilder("(");
        if (StringUtils.isNotEmpty(searchText)) {
            for (int i = 0; i < searchableAttributesNames.length; i++) {
                fragment.append("lower(");
                fragment.append(searchableAttributesNames[i]);
                fragment.append(") like lower(:searchText)");
                if (i < fieldNames.length - 1) {
                    fragment.append(" or ");
                }
            }
            fragment.append(')');
        }
        log.debug("Modified Query : {}", sb);
        returnfragment.toString();
    }
    
    protected String getFilterFragment(final List<Filter> list) {
        final StringBuilder fragment = new StringBuilder();
        if (null!=list && list.size()>0) {
            for (int i = 0; i < list.size(); i++) {
                
                if (i < fieldNames.length - 1) {
                    fragment.append(" or ");
                }
            }
        }
        log.debug("Modified Query : {}", sb);
        return fragment.toString();
    }

    protected String getSorterFragment(final List<Sorter> list) {
        final StringBuilder sb = new StringBuilder();
        if (StringUtils.isNotEmpty(filter)) {
            final StringBuilder clause = new StringBuilder(firstClausePart ? " where (" : " and (");
            for (int i = 0; i < fieldNames.length; i++) {
                clause.append("lower(");
                clause.append(fieldNames[i]);
                clause.append(") like lower(:filterValue)");
                if (i < fieldNames.length - 1) {
                    clause.append(" or ");
                }
            }
            clause.append(')');
            sb.append(clause);
        }
        log.debug("Modified Query : {}", sb);
        return sb.toString();
    }
}
