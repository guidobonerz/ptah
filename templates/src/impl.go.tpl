package {{getNameSpace}};

{{- $attribute := getPrimaryKeyAttribute}}
{{- $primaryType := getDataType $attribute.DataType }}
{{- $caseName := getTitleCaseName $.Name}}

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class {{getObjectName}}  implements I{{$caseName}}Service{

    @Autowired
    private {{$caseName}}DAO dao;

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