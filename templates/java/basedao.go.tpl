package {{getFullNameSpace}};

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

import {{getFullObjectName "filter"}};
import {{getFullObjectName "sorter"}};

import java.util.List;

@Component
@Slf4j
abstract class BaseDAO {
    @Value("${app.filterSanitiser}")
    protected String filterSanitizer;

    protected String getSearchFragment(final String searchText, final String ... searchableAttributesNames) {
        final StringBuilder fragment = new StringBuilder("(");
        if (StringUtils.isNotEmpty(searchText)) {
            for (int i = 0; i < searchableAttributesNames.length; i++) {
                fragment.append("lower(");
                fragment.append(searchableAttributesNames[i]);
                fragment.append(") like lower(:searchText)");
                if (i < searchableAttributesNames.length - 1) {
                    fragment.append(" or ");
                }
            }
            fragment.append(')');
        }
        log.debug("Modified Query : {}", fragment);
        return fragment.toString();
    }
    
    protected String getFilterFragment(final List<Filter> list) {
        final StringBuilder fragment = new StringBuilder();
        if (null!=list && list.size()>0) {
            for (int i = 0; i < list.size(); i++) {
                if (i < list.size() - 1) {
                    fragment.append(", ");
                }
            }
        }
        log.debug("Modified Query : {}", fragment);
        return fragment.toString();
    }

    protected String getSorterFragment(final List<Sorter> list) {
        final StringBuilder sb = new StringBuilder();
        if (list!=null && list.size()>0) {
            sb.append("order by");
            for (int i = 0; i < list.size(); i++) {
                Sorter sorter = list.get(i);
                sb.append(sorter.getAttribute()+" "+sorter.getSortOrder().toString());
                if (i < list.size() - 1) {
                    sb.append(", ");
                }
            }
        }
        log.debug("Modified Query : {}", sb);
        return sb.toString();
    }
}
