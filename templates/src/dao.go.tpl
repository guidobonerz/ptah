package {{getFullNameSpace}};

{{- $primaryAttributes := getPrimaryAttributes}}
{{- $primaryAttributeTypes := getDataTypes $primaryAttributes }}
{{- $caseName := getCamelCaseName $.Name}}

import java.util.List;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

@Repository

public class {{getObjectName}} {

    @Autowired
    private EntityManager entityManager;

    private final static String SELECT_ALL   = "SELECT o from {{$caseName}}DTO o";
    private final static String SELECT_BY_ID = "SELECT o from {{$caseName}}DTO o where {{ range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}=:{{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}";
    private final static String COUNT        = "SELECT count(o) from {{$caseName}}DTO o";
    private final static String CREATE       = "EXEC CREATE_{{ getUpperCaseName $.Name}}{{ range $index,$attribute := $.Attributes }} :{{ $attribute.Name }}{{getArgumentSeparator $index $.Attributes}}{{- end}}";
    private final static String UPDATE       = "EXEC UPDATE_{{ getUpperCaseName $.Name}}{{ range $index,$attribute := $.Attributes }} :{{ $attribute.Name }}{{getArgumentSeparator $index $.Attributes}}{{- end}}";
    private final static String DELETE_BY_ID = "EXEC DELETE_{{ getUpperCaseName $.Name}}_BY_ID {{ range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}=:{{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}";
    
    

    public {{$caseName}}DTO getById({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}){
        final Query query = entityManager.createQuery(SELECT_BY_ID,{{$caseName}}DTO.class);
        {{- range $index,$attribute := $primaryAttributes }}
        query.setParameter("{{ $attribute.Name }}",{{$attribute.Name}});
        {{- end}}
        return query.getSingleResult();
    }

    public List<{{$caseName}}DTO> getList(){
        final Query query = entityManager.createQuery(SELECT_ALL,{{$caseName}}DTO.class);
        return query.getResultList();
    }

    public List<{{$caseName}}DTO> getList(java.lang.String searchText){
        return getList(searchText, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<{{$caseName}}DTO> getList(List<Sorter> sorterList){
        return getList((String)null, sorterList, (List<Filter>)null);
    }

    public List<{{$caseName}}DTO> getList(java.lang.String searchText, ListSet<Sorter> sorterList){
        return getList(searchText, sorterList, (List<Filter>)null);
    }

    public List<{{$caseName}}DTO> getList(List<Filter> filterList){
        return getList((String)null, (List<Sorter>)null, filterList);
    }

    public List<{{$caseName}}DTO> getList(java.lang.String searchText, List<Filter> filterList){
        return getList(searchText, (List<Sorter>)null, filterList);
    }

    public List<{{$caseName}}DTO> getList(List<Sorter> sorterList, List<Filter> filterList){
        return getList((String)null, sorterList, filterList);
    }

    public List<{{$caseName}}DTO> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return null;
    }
        
    public List<{{$caseName}}DTO> getList(int start, int limit){
        return getList(start, limit, (String)null, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText){
        return getList(start, limit, searchText, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<{{$caseName}}DTO> getList(int start, int limit, List<Sorter> sorterList){
        return getList(start, limit, (String)null, sorterList, (List<Filter>)null);
    }

    public List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList){
        return getList(start, limit, searchText, sorterList, (List<Filter>)null);
    }

    public List<{{$caseName}}DTO> getList(int start, int limit, List<Filter> filterList){
        return getList(start, limit, (String)null, (List<Sorter>)null, filterList);
    }

    public List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return getList(start, limit, searchText, (List<Sorter>)null, filterList);
    }

    public List<{{$caseName}}DTO> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList){
        return getList(start, limit, (String)null, sorterList, filterList);
    }

    public List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
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
    
    public void add(List<{{$caseName}}DTO> list){
        for({{$caseName}}DTO item:list){
            add(item);
        }
    }

    public int add({{$caseName}}DTO item){
        return add({{- range $index,$attribute := $.Attributes }}item.get{{getCamelCaseName $attribute.Name}}(){{getArgumentSeparator $index $.Attributes}}{{- end}})
    }

    public int add({{- range $index,$attribute := $.Attributes }}{{getDataType $attribute.DataType}} {{$attribute.Name}}{{getArgumentSeparator $index $.Attributes}}{{- end}}){
        {{- range $index,$attribute := $.Attributes }}
        query.setParameter("{{ $attribute.Name }}",{{$attribute.Name}});
        {{- end}}
    }

    public int update(List<{{$caseName}}DTO> list){
        int updatedItems=0;
        for({{$caseName}}DTO item:list){
            updatedItems+=update(item);
        }
        return updatedItems;
    }

    public int update({{$caseName}}DTO item){
        {{- range $index,$attribute := $.Attributes }}
        query.setParameter("{{ $attribute.Name }}",item.get{{getCamelCaseName $attribute.Name}}());
        {{- end}}
        return 0;
    }

    public void delete(List<{{$caseName}}DTO> list){
        for({{$caseName}}DTO item:list){
            delete(item);
        }
    }

    public void delete({{$caseName}}DTO item){
        deleteById({{- range $index,$attribute := $primaryAttributes }}item.get{{getCamelCaseName $attribute.Name}}(){{getArgumentSeparator $index $primaryAttributes}}{{- end}});
    }

    public void deleteById({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}){
       {{- range $index,$attribute := $primaryAttributes }}
        query.setParameter("{{ $attribute.Name }}",{{$attribute.Name}});
        {{- end}}
    }

    public List<{{$caseName}}DTO> copy({{$caseName}}DTO item, int copies){
        {{- range $index,$attribute := $.Attributes }}
        query.setParameter("{{ $attribute.Name }}",item.get{{getCamelCaseName $attribute.Name}}());
        {{- end}}
    }
}
