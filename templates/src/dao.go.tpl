package {{getFullNameSpace}};

{{- $primaryAttributes := getPrimaryAttributes}}
{{- $primaryAttributeTypes := getDataTypes $primaryAttributes }}
{{- $dtoName := getObjectName "dto"}}
{{- $daoName := getObjectName "dao"}}

import java.util.List;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import {{getFullObjectName "dto"}};

@Repository

public class {{$daoName}} {

    @Autowired
    private EntityManager entityManager;

    private final static String SELECT_ALL   = "SELECT o from {{$dtoName}} o";
    private final static String SELECT_BY_ID = "SELECT o from {{$dtoName}} o where {{ range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}=:{{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}";
    private final static String COUNT        = "SELECT count(o) from {{$dtoName}} o";
    private final static String HANDLE       = "EXEC HANDLE_{{ getUpperCaseName $.Name}} :action, {{ range $index,$attribute := $.Attributes }}:{{ $attribute.Name }}{{getArgumentSeparator $index $.Attributes}}{{- end}}";
    
    public {{$dtoName}} getById({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}){
        final Query query = entityManager.createQuery(SELECT_BY_ID,{{$dtoName}}.class);
        {{- range $index,$attribute := $primaryAttributes }}
        query.setParameter("{{ $attribute.Name }}",{{$attribute.Name}});
        {{- end}}
        return query.getSingleResult();
    }

    public List<{{$dtoName}}> getList(){
        final Query query = entityManager.createQuery(SELECT_ALL,{{$dtoName}}.class);
        return query.getResultList();
    }

    public List<{{$dtoName}}> getList(java.lang.String searchText){
        return getList(searchText, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<{{$dtoName}}> getList(List<Sorter> sorterList){
        return getList((String)null, sorterList, (List<Filter>)null);
    }

    public List<{{$dtoName}}> getList(java.lang.String searchText, ListSet<Sorter> sorterList){
        return getList(searchText, sorterList, (List<Filter>)null);
    }

    public List<{{$dtoName}}> getList(List<Filter> filterList){
        return getList((String)null, (List<Sorter>)null, filterList);
    }

    public List<{{$dtoName}}> getList(java.lang.String searchText, List<Filter> filterList){
        return getList(searchText, (List<Sorter>)null, filterList);
    }

    public List<{{$dtoName}}> getList(List<Sorter> sorterList, List<Filter> filterList){
        return getList((String)null, sorterList, filterList);
    }

    public List<{{$dtoName}}> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return null;
    }
        
    public List<{{$dtoName}}> getList(int start, int limit){
        return getList(start, limit, (String)null, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<{{$dtoName}}> getList(int start, int limit, java.lang.String searchText){
        return getList(start, limit, searchText, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<{{$dtoName}}> getList(int start, int limit, List<Sorter> sorterList){
        return getList(start, limit, (String)null, sorterList, (List<Filter>)null);
    }

    public List<{{$dtoName}}> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList){
        return getList(start, limit, searchText, sorterList, (List<Filter>)null);
    }

    public List<{{$dtoName}}> getList(int start, int limit, List<Filter> filterList){
        return getList(start, limit, (String)null, (List<Sorter>)null, filterList);
    }

    public List<{{$dtoName}}> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return getList(start, limit, searchText, (List<Sorter>)null, filterList);
    }

    public List<{{$dtoName}}> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList){
        return getList(start, limit, (String)null, sorterList, filterList);
    }

    public List<{{$dtoName}}> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return null;List
    }

    public long getListCount(){
        return getListCount((String)null, (List<Filter>)null);
    }

    public long getListCount(java.lang.String searchText){
        return getListCount(searchText, (List<Filter>)null);
    }

    public long getListCount(List<Filter> filterList){
        return getListCount((String)null, filterList);
    }

    public long getListCount(java.lang.String searchText, List<Filter> filterList){
        return 0;
    }

    public long getListCount(int start, int limit){
        return getListCount(start, limit, (String)null, (List<Filter>)null);
    }

    public long getListCount(int start, int limit, java.lang.String searchText){
        return getListCount(start, limit,searchText, (List<Filter>)null);
    }

    public long getListCount(int start, int limit, List<Filter> filterList){
        return getListCount(start, limit,(String)null, filterList);
    }

    public long getListCount(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return 0;
    }
    
    public void add(List<{{$dtoName}}> list){
        for({{$dtoName}} item:list){
            add(item);
        }
    }

    public int add({{$dtoName}} item){
        return add({{- range $index,$attribute := $.Attributes }}item.get{{getCamelCaseName $attribute.Name}}(){{getArgumentSeparator $index $.Attributes}}{{- end}})
    }

    public int add({{- range $index,$attribute := $.Attributes }}{{getDataType $attribute}} {{$attribute.Name}}{{getArgumentSeparator $index $.Attributes}}{{- end}}){
        {{- range $index,$attribute := $.Attributes }}
        query.setParameter("{{ $attribute.Name }}",{{$attribute.Name}});
        {{- end}}
    }

    public List<{{$dtoName}}> copy({{$dtoName}} item, int copies){
        {{- range $index,$attribute := $.Attributes }}
        query.setParameter("{{ $attribute.Name }}",item.get{{getCamelCaseName $attribute.Name}}());
        {{- end}}
    }

    public int update(List<{{$dtoName}}> list){
        int updatedItems=0;
        for({{$dtoName}} item:list){
            updatedItems+=update(item);
        }
        return updatedItems;
    }

    public int update({{$dtoName}} item){
        {{- range $index,$attribute := $.Attributes }}
        query.setParameter("{{ $attribute.Name }}",item.get{{getCamelCaseName $attribute.Name}}());
        {{- end}}
        return 0;
    }

    public void delete(List<{{$dtoName}}> list){
        for({{$dtoName}} item:list){
            delete(item);
        }
    }

    public void delete({{$dtoName}} item){
        deleteById({{- range $index,$attribute := $primaryAttributes }}item.get{{getCamelCaseName $attribute.Name}}(){{getArgumentSeparator $index $primaryAttributes}}{{- end}});
    }

    public void deleteById({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}){
       {{- range $index,$attribute := $primaryAttributes }}
        query.setParameter("{{ $attribute.Name }}",{{$attribute.Name}});
        {{- end}}
    }
}
