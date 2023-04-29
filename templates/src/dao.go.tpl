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
        return dao.get{{$caseName}}List(searchText);
    }
    
    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(java.util.Set<Sorter> sorterList){
        return dao.get{{$caseName}}List(sorterList);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return dao.get{{$caseName}}List(searchText, sorterList);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(java.util.Set<Filter> filterList){
        return dao.get{{$caseName}}List(filterList);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(java.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.get{{$caseName}}List(searchText, filterList);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.get{{$caseName}}List(sorterList, filterList);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.get{{$caseName}}List(searchText, sorterList, filterList)
    }
        
    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit){
        return dao.get{{$caseName}}List(start, limit);
    }
    
    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit, java.lang.String searchText){
        return dao.get{{$caseName}}List(start, limit, searchText);
    }
    
    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit, java.util.Set<Sorter> sorterList){
        return dao.get{{$caseName}}List(start, limit, sorterList);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return dao.get{{$caseName}}List(start, limit, searchText, sorterList);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit, java.util.Set<Filter> filterList){
        return dao.get{{$caseName}}List(start, limit, filterList);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.get{{$caseName}}List(start, limit, searchText, filterList);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.get{{$caseName}}List(start, limit, sorterList, filterList);
    }

    public java.util.List<{{$caseName}}DTO> get{{$caseName}}List(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.get{{$caseName}}List(start, limit, searchText, sorterList, filterList);
    }

    public long get{{$caseName}}ListCount(){
        return dao.get{{$caseName}}ListCount();
    }

    public long get{{$caseName}}ListCount(java.lang.String searchText){
        return dao.get{{$caseName}}ListCount(searchText);
    }

    public long get{{$caseName}}ListCount(java.util.Set<Filter> filterList){
        return dao.get{{$caseName}}ListCount(filterList);
    }

    public long get{{$caseName}}ListCount(java.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.get{{$caseName}}ListCount(searchText, filterList);
    }

    public {{$caseName}}DTO add{{$caseName}}({{$caseName}}DTO {{$.Name}}){
        return dao.add{{$caseName}}({{$.Name}});
    }

    public {{$caseName}}DTO add{{$caseName}}(List<{{$caseName}}DTO> {{$.Name}}List){
        return dao.add{{$caseName}}({{$.Name}}List);
    }
    
    public {{$caseName}}DTO update{{$caseName}}({{$caseName}}DTO {{$.Name}}){
        return dao.update{{$caseName}}({{$.Name}});
    }

    public {{$caseName}}DTO update{{$caseName}}(List<{{$caseName}}DTO> {{$.Name}}List){
        return dao.update{{$caseName}}({{$.Name}}List);
    }

    public void delete{{$caseName}}({{$caseName}}DTO {{$.Name}}){
        return dao.delete{{$caseName}}({{$.Name}});
    }

    public void delete{{$caseName}}ById({{- $primaryType }} {{$attribute.Name}}){
        return dao.delete{{$caseName}}ById({{$attribute.Name}});
    }
}
