package {{getFullNameSpace}};
{{- $attributeList := getAttributes}}
{{- $primaryAttributes := getPrimaryAttributes}}
{{- $primaryAttributeTypes := getDataTypes $primaryAttributes }}
{{- $dtoName := getObjectName "dto"}}
{{- $daoName := getObjectName "dao"}}

import java.util.List;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import {{getFullObjectName "dto"}};
import {{getFullObjectName "filter"}};
import {{getFullObjectName "sorter"}};
import {{getFullObjectName "result"}};

@Repository

public class {{$daoName}} extends BaseDAO{

    @Autowired
    private EntityManager entityManager;

    private final static String LIST      = "SELECT o from {{$dtoName}} o";
    private final static String GET       = "SELECT o from {{$dtoName}} o where {{ range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}=:{{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}}";
    private final static String COUNT     = "SELECT count(o) from {{$dtoName}} o";
    private final static String EXEC_PROC = "EXEC HANDLE_{{ getUpperCaseName $.Name}} :action, {{ range $index,$attribute := $attributeList }}:{{ $attribute.Name }}{{getAttributeSeparator $index $attributeList}}{{- end}}";
    
    public {{$dtoName}} get({{- range $index,$attribute := $primaryAttributes }}final {{ index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}}){
        final TypedQuery query = entityManager.createQuery(GET,{{$dtoName}}.class);
        {{- range $index,$attribute := $primaryAttributes }}
        query.setParameter("{{ $attribute.Name }}",{{$attribute.Name}});
        {{- end}}
        return ({{$dtoName}})query.getSingleResult();
    }

    public Result<{{$dtoName}}> list(){
        return list(-1, -1, (String)null, (List<Filter>)null, (List<Sorter>)null);
    }

    public Result<{{$dtoName}}> list(final String searchText){
        return list(searchText, (List<Filter>)null, (List<Sorter>)null);
    }

    public Result<{{$dtoName}}> list(final String searchText, final List<Sorter> sorterList){
        return list(searchText, (List<Filter>)null, sorterList);
    }

    public Result<{{$dtoName}}> list(final List<Filter> filterList, final List<Sorter> sorterList){
        return list((String)null, filterList, sorterList);
    }

    public Result<{{$dtoName}}> list(final String searchText, final List<Filter> filterList, final List<Sorter> sorterList){
         return list(-1, -1, searchText, filterList, sorterList);
    }
        
    public Result<{{$dtoName}}> list(final int start, final int limit){
        return list(start, limit, (String)null, (List<Filter>)null, (List<Sorter>)null);
    }

    public Result<{{$dtoName}}> list(final int start, final int limit, final String searchText){
        return list(start, limit, searchText, (List<Filter>)null, (List<Sorter>)null);
    }

    public Result<{{$dtoName}}> list(final int start, final int limit, final String searchText, final List<Sorter> sorterList){
        return list(start, limit, searchText, (List<Filter>)null, sorterList);
    }

    public Result<{{$dtoName}}> list(final int start, final int limit, final List<Filter> filterList, final List<Sorter> sorterList){
        return list(start, limit, (String)null, filterList, sorterList);
    }

    public Result<{{$dtoName}}> list(final int start, final int limit, final String searchText, final List<Filter> filterList, final List<Sorter> sorterList){
        final Result<{{$dtoName}}> result = new Result<>();
        final TypedQuery listQuery = entityManager.createQuery(LIST, {{$dtoName}}.class);
        final Query countQuery = entityManager.createQuery(COUNT);
        final StringBuilder sorter = new StringBuilder();
        final StringBuilder filter = new StringBuilder();

        List<{{$dtoName}}> list = listQuery.getResultList();
        long count = (Long) countQuery.getSingleResult();
        result.setTotal(count);
        result.setResultList(list);
        return null;
    }

    public long count(){
        return count((String)null, (List<Filter>)null);
    }

    public long count(final String searchText){
        return count(searchText, (List<Filter>)null);
    }

    public long count(final List<Filter> filterList){
        return count((String)null, filterList);
    }

    public long count(final String searchText, final List<Filter> filterList){
        return count(-1, -1,(String)null, filterList);
    }

    public long count(final int start, final int limit){
        return count(start, limit, (String)null, (List<Filter>)null);
    }

    public long count(final int start, final int limit, final String searchText){
        return count(start, limit,searchText, (List<Filter>)null);
    }

    public long count(final int start, final int limit, final List<Filter> filterList){
        return count(start, limit,(String)null, filterList);
    }

    public long count(final int start, final int limit, final String searchText, final List<Filter> filterList){
        final Query query = entityManager.createQuery(COUNT);
        final StringBuilder filter = new StringBuilder();

        long count = (Long) query.getSingleResult();
        return count;
    }
    
    public void add(final List<{{$dtoName}}> list){
        for({{$dtoName}} item:list){
            add(item);
        }
    }

    public int add(final {{$dtoName}} item){
        return add({{- range $index,$attribute := $attributeList }}item.{{getGetterPrefix $attribute}}{{getCamelCaseName $attribute.Name}}(){{getAttributeSeparator $index $attributeList}}{{- end}});
    }

    public int add({{- range $index,$attribute := $attributeList }}final {{getDataType $attribute}} {{$attribute.Name}}{{getAttributeSeparator $index $attributeList}}{{- end}}){
        final Query query = entityManager.createNativeQuery(EXEC_PROC);
        query.setParameter("action","ADD");
        {{- range $index,$attribute := $attributeList }}
        query.setParameter("{{ $attribute.Name }}",{{$attribute.Name}});
        {{- end}}
        final Object result = query.getSingleResult();
        return -1;
    }

    public List<{{$dtoName}}> copy(final {{$dtoName}} item, int copies){
        final Query query = entityManager.createNativeQuery(EXEC_PROC);
        {{- range $index,$attribute := $attributeList }}
        query.setParameter("{{ $attribute.Name }}",item.{{getGetterPrefix $attribute}}{{getCamelCaseName $attribute.Name}}());
        {{- end}}
        return null;
    }

    public int update(final List<{{$dtoName}}> list){
        int updatedItems=0;
        for({{$dtoName}} item:list){
            updatedItems+=update(item);
        }
        return updatedItems;
    }

    public int update(final {{$dtoName}} item){
        final Query query = entityManager.createNativeQuery(EXEC_PROC);
        query.setParameter("action","UPDATE");
        {{- range $index,$attribute := $attributeList }}
        query.setParameter("{{ $attribute.Name }}",item.{{getGetterPrefix $attribute}}{{getCamelCaseName $attribute.Name}}());
        {{- end}}
        final Object result = query.getSingleResult();
        return 0;
    }

    public void delete(final List<{{$dtoName}}> list){
        for({{$dtoName}} item:list){
            delete(item);
        }
    }

    public void delete(final {{$dtoName}} item){
        delete({{- range $index,$attribute := $primaryAttributes }}item.get{{getCamelCaseName $attribute.Name}}(){{getAttributeSeparator $index $primaryAttributes}}{{- end}});
    }

    public void delete({{- range $index,$attribute := $primaryAttributes }}final {{ index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}}){
        final Query query = entityManager.createNativeQuery(EXEC_PROC);
        query.setParameter("action","DELETE");
        {{- range $index,$attribute := $primaryAttributes }}
        query.setParameter("{{ $attribute.Name }}",{{$attribute.Name}});
        {{- end}}
        final Object result = query.getSingleResult();
    }
}
