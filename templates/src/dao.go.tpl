package {{getFullNameSpace}};
{{- $attributeList := getAttributes}}
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

    private final static String LIST   = "SELECT o from {{$dtoName}} o";
    private final static String GET    = "SELECT o from {{$dtoName}} o where {{ range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}=:{{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}";
    private final static String COUNT  = "SELECT count(o) from {{$dtoName}} o";
    private final static String HANDLE = "EXEC HANDLE_{{ getUpperCaseName $.Name}} :action, {{ range $index,$attribute := $attributeList }}:{{ $attribute.Name }}{{getArgumentSeparator $index $attributeList}}{{- end}}";
    
    public {{$dtoName}} get({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}){
        final Query query = entityManager.createQuery(GET,{{$dtoName}}.class);
        {{- range $index,$attribute := $primaryAttributes }}
        query.setParameter("{{ $attribute.Name }}",{{$attribute.Name}});
        {{- end}}
        return query.getSingleResult();
    }

    public List<{{$dtoName}}> list(){
        final Query query = entityManager.createQuery(LIST,{{$dtoName}}.class);
        return query.getResultList();
    }

    public List<{{$dtoName}}> list(java.lang.String searchText){
        return list(searchText, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<{{$dtoName}}> list(List<Sorter> sorterList){
        return list((String)null, sorterList, (List<Filter>)null);
    }

    public List<{{$dtoName}}> list(java.lang.String searchText, ListSet<Sorter> sorterList){
        return list(searchText, sorterList, (List<Filter>)null);
    }

    public List<{{$dtoName}}> list(List<Filter> filterList){
        return list((String)null, (List<Sorter>)null, filterList);
    }

    public List<{{$dtoName}}> list(java.lang.String searchText, List<Filter> filterList){
        return list(searchText, (List<Sorter>)null, filterList);
    }

    public List<{{$dtoName}}> list(List<Sorter> sorterList, List<Filter> filterList){
        return list((String)null, sorterList, filterList);
    }

    public List<{{$dtoName}}> list(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return null;
    }
        
    public List<{{$dtoName}}> list(int start, int limit){
        return list(start, limit, (String)null, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<{{$dtoName}}> list(int start, int limit, java.lang.String searchText){
        return list(start, limit, searchText, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<{{$dtoName}}> list(int start, int limit, List<Sorter> sorterList){
        return list(start, limit, (String)null, sorterList, (List<Filter>)null);
    }

    public List<{{$dtoName}}> list(int start, int limit, java.lang.String searchText, List<Sorter> sorterList){
        return list(start, limit, searchText, sorterList, (List<Filter>)null);
    }

    public List<{{$dtoName}}> list(int start, int limit, List<Filter> filterList){
        return list(start, limit, (String)null, (List<Sorter>)null, filterList);
    }

    public List<{{$dtoName}}> list(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return list(start, limit, searchText, (List<Sorter>)null, filterList);
    }

    public List<{{$dtoName}}> list(int start, int limit, List<Sorter> sorterList, List<Filter> filterList){
        return list(start, limit, (String)null, sorterList, filterList);
    }

    public List<{{$dtoName}}> list(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return null;List
    }

    public long count(){
        return count((String)null, (List<Filter>)null);
    }

    public long count(java.lang.String searchText){
        return count(searchText, (List<Filter>)null);
    }

    public long count(List<Filter> filterList){
        return count((String)null, filterList);
    }

    public long count(java.lang.String searchText, List<Filter> filterList){
        return 0;
    }

    public long count(int start, int limit){
        return count(start, limit, (String)null, (List<Filter>)null);
    }

    public long count(int start, int limit, java.lang.String searchText){
        return count(start, limit,searchText, (List<Filter>)null);
    }

    public long count(int start, int limit, List<Filter> filterList){
        return count(start, limit,(String)null, filterList);
    }

    public long count(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return 0;
    }
    
    public void add(List<{{$dtoName}}> list){
        for({{$dtoName}} item:list){
            add(item);
        }
    }

    public int add({{$dtoName}} item){
        return add({{- range $index,$attribute := $attributeList }}item.get{{getCamelCaseName $attribute.Name}}(){{getArgumentSeparator $index $attributeList}}{{- end}})
    }

    public int add({{- range $index,$attribute := $attributeList }}{{getDataType $attribute}} {{$attribute.Name}}{{getArgumentSeparator $index $attributeList}}{{- end}}){
        {{- range $index,$attribute := $attributeList }}
        query.setParameter("{{ $attribute.Name }}",{{$attribute.Name}});
        {{- end}}
    }

    public List<{{$dtoName}}> copy({{$dtoName}} item, int copies){
        {{- range $index,$attribute := $attributeList }}
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
        {{- range $index,$attribute := $attributeList }}
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

    public void delete({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}){
       {{- range $index,$attribute := $primaryAttributes }}
        query.setParameter("{{ $attribute.Name }}",{{$attribute.Name}});
        {{- end}}
    }
}
