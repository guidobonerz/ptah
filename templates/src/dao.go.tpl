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
    
    

    public {{$caseName}}DTO get{{$caseName}}ById({{- $primaryType }} {{$attribute.Name}}){
        return dao.get{{$caseName}}ById({{$attribute.Name}});
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(){
        return dao.get{{$caseName}}List();
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(java.lang.String searchText){
        return get{{$caseName}}List(searchText, null, null);
    }
    
    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(java.util.Set<Sorter> sorterList){
        return get{{$caseName}}List(null, sorterList, null);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return get{{$caseName}}List(searchText, sorterList, null);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(java.util.Set<Filter> filterList){
        return get{{$caseName}}List(null, null, filterList);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(java.lang.String searchText, java.util.Set<Filter> filterList){
        return get{{$caseName}}List(searchText, null, filterList);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return get{{$caseName}}List(null, sorterList, filterList);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return null;
    }
        
    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit){
        return get{{$caseName}}List(start, limit, null, null, null);
    }
    
    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit, java.lang.String searchText){
        return get{{$caseName}}List(start, limit, searchText, null, null)
    }
    
    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit, java.util.Set<Sorter> sorterList){
        return get{{$caseName}}List(start, limit, null, sorterList, null)
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return get{{$caseName}}List(start, limit, searchText, sorterList, null)
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit, java.util.Set<Filter> filterList){
        return get{{$caseName}}List(start, limit, null, null, filterList)
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList){
        return get{{$caseName}}List(start, limit, searchText, null, filterList)
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return get{{$caseName}}List(start, limit, null, sorterList, filterList)
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return null;
    }

    public long get{{$caseName}}ListCount(){
        return 0;
    }

    public long get{{$caseName}}ListCount(java.lang.String searchText){
        return 0;
    }

    public long get{{$caseName}}ListCount(java.util.Set<Filter> filterList){
        return 0;
    }

    public long get{{$caseName}}ListCount(java.lang.String searchText, java.util.Set<Filter> filterList){
        return 0;
    }

    public {{$caseName}}DTO add{{$caseName}}({{$caseName}}DTO {{$.Name}}){
        return null;
    }

    public {{$caseName}}DTO add{{$caseName}}(List<{{$caseName}}DTO> {{$.Name}}List){
        return null;
    }
    
    public {{$caseName}}DTO update{{$caseName}}({{$caseName}}DTO {{$.Name}}){
        return null;
    }

    public {{$caseName}}DTO update{{$caseName}}(List<{{$caseName}}DTO> {{$.Name}}List){
        return null;
    }

    public void delete{{$caseName}}({{$caseName}}DTO {{$.Name}}){
        return null;
    }

    public void delete{{$caseName}}ById({{- $primaryType }} {{$attribute.Name}}){
        return null;
    }
}
