package {{getNameSpace}};

{{- $attribute := getPrimaryKeyAttribute}}
{{- $primaryType := getDataType $attribute.DataType }}
{{- $caseName := getTitleCaseName $.Name}}

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

    private final static String SELECT_ALL = "SELECT o from {{$caseName}}DTO o";
    private final static String SELECT_BY_ID = "SELECT o from {{$caseName}}DTO o where {{$attribute.Name}}=:{{$attribute.Name}}";
    private final static String COUNT_ALL = "SELECT count(o) from {{$caseName}}DTO o";
    private final static String CREATE_{{ getUpperCaseName $.Name}} = "EXEC CREATE_{{ getUpperCaseName $.Name}}{{- range $index,$attribute := $.Attributes }} :{{ $attribute.Name }}{{- if isNotLastAttribute $index}},{{- end}}{{- end}}";
    private final static String UPDATE_{{ getUpperCaseName $.Name}} = "EXEC UPDATE_{{ getUpperCaseName $.Name}}{{- range $index,$attribute := $.Attributes }} :{{ $attribute.Name }}{{- if isNotLastAttribute $index}},{{- end}}{{- end}}";
    private final static String DELETE_{{ getUpperCaseName $.Name}} = "EXEC DELETE_{{ getUpperCaseName $.Name}}_BY_ID :{{$attribute.Name}}";
    
    

    public {{$caseName}}DTO getById({{- $primaryType }} {{$attribute.Name}}){
        return dao.getById({{$attribute.Name}});
    }

    public java.util.List<{{$caseName}}DTO> getList(){
        return dao.getList();
    }

    public java.util.List<{{$caseName}}DTO> getList(java.lang.String searchText){
        return getList(searchText, (java.util.Set<Sorter>)null, (java.util.Set<Filter>)null);
    }
    
    public java.util.List<{{$caseName}}DTO> getList(java.util.Set<Sorter> sorterList){
        return getList((String)null, sorterList, (java.util.Set<Filter>)null);
    }

    public java.util.List<{{$caseName}}DTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return getList(searchText, sorterList, (java.util.Set<Filter>)null);
    }

    public java.util.List<{{$caseName}}DTO> getList(java.util.Set<Filter> filterList){
        return getList((String)null, (java.util.Set<Sorter>)null, filterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(java.lang.String searchText, java.util.Set<Filter> filterList){
        return getList(searchText, (java.util.Set<Sorter>)null, filterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return getList((String)null, sorterList, filterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return null;
    }
        
    public java.util.List<{{$caseName}}DTO> getList(int start, int limit){
        return getList(start, limit, (String)null, (java.util.Set<Sorter>)null, (java.util.Set<Filter>)null);
    }
    
    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText){
        return getList(start, limit, searchText, (java.util.Set<Sorter>)null, (java.util.Set<Filter>)null);
    }
    
    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.util.Set<Sorter> sorterList){
        return getList(start, limit, (String)null, sorterList, (java.util.Set<Filter>)null);
    }

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return getList(start, limit, searchText, sorterList, (java.util.Set<Filter>)null);
    }

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.util.Set<Filter> filterList){
        return getList(start, limit, (String)null, (java.util.Set<Sorter>)null, filterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList){
        return getList(start, limit, searchText, (java.util.Set<Sorter>)null, filterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return getList(start, limit, (String)null, sorterList, filterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return null;
    }

    public long getListCount(){
        return 0;
    }

    public long getListCount(java.lang.String searchText){
        return 0;
    }

    public long getListCount(java.util.Set<Filter> filterList){
        return 0;
    }

    public long getListCount(java.lang.String searchText, java.util.Set<Filter> filterList){
        return 0;
    }
    
    public void add(List<{{$caseName}}DTO> list){
        for({{$caseName}}DTO item:list){
            add{{$caseName}}(item);
        }
    }

    public int add({{$caseName}}DTO item){
        return add({{- range $index,$attribute := $.Attributes }}{{ $attribute.Name }}{{- if isNotLastAttribute $index}},{{- end}}{{- end}})
    }

    public int add({{- range $index,$attribute := $.Attributes }}{{ getDataType $attribute.DataType }} {{ $attribute.Name }}{{- if isNotLastAttribute $index}},{{- end}}{{- end}}){
        {{- range $index,$attribute := $.Attributes }}
        query.setParameter("{{ $attribute.Name }}",item.get{{getTitleCaseName $attribute.Name}}());
        {{- end}}
    }

    public int update(List<{{$caseName}}DTO> list){
        int updatedItems=0;
        for({{$caseName}}DTO item:list){
            updatedItems+=update{{$caseName}}(item);
        }
        return updatedItems;
    }

    public int update({{$caseName}}DTO item){
        return update({{- range $index,$attribute := $.Attributes }}{{ getDataType $attribute.DataType }} {{ $attribute.Name }}{{- if isNotLastAttribute $index}},{{- end}}{{- end}})
    }

    public int update({{$caseName}}DTO item){
        {{- range $index,$attribute := $.Attributes }}
        query.setParameter("{{ $attribute.Name }}",item.get{{getTitleCaseName $attribute.Name}}());
        {{- end}}
        return 0;
    }

    public void delete({{$caseName}}DTO item){
        deleteById(item.get{{getTitleCaseName $attribute.Name}}());
    }

    public void deleteById({{- $primaryType }} {{$attribute.Name}}){
        query.setParameter("{{ $attribute.Name }}",{{$attribute.Name}});
    }
}
