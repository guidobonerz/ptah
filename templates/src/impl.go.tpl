package {{getFullNameSpace}};

{{- $attribute := getPrimaryKeyAttribute}}
{{- $primaryType := getDataType $attribute.DataType }}
{{- $caseName := getCamelCaseName $.Name}}

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class {{getObjectName}}  implements I{{$caseName}}Service{

    @Autowired
    private {{$caseName}}DAO dao;

    public {{$caseName}}DTO getById({{- $primaryType }} {{$attribute.Name}}){
        return dao.getById({{$attribute.Name}});
    }

    public java.util.List<{{$caseName}}DTO> getList(){
        return dao.getList();
    }

    public java.util.List<{{$caseName}}DTO> getList(java.lang.String searchText){
        return dao.getList(searchText);
    }
    
    public java.util.List<{{$caseName}}DTO> getList(java.util.Set<Sorter> sorterList){
        return dao.getList(sorterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return dao.getList(searchText, sorterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(java.util.Set<Filter> filterList){
        return dao.getList(filterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(java.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.getList(searchText, filterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getList(sorterList, filterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getList(searchText, sorterList, filterList);
    }
        
    public java.util.List<{{$caseName}}DTO> getList(int start, int limit){
        return dao.getList(start, limit);
    }
    
    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText){
        return dao.getList(start, limit, searchText);
    }
    
    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.util.Set<Sorter> sorterList){
        return dao.getList(start, limit, sorterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return dao.getList(start, limit, searchText, sorterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.util.Set<Filter> filterList){
        return dao.getList(start, limit, filterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.getList(start, limit, searchText, filterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getList(start, limit, sorterList, filterList);
    }

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getList(start, limit, searchText, sorterList, filterList);
    }

    public long getListCount(){
        return dao.getListCount();
    }

    public long getListCount(java.lang.String searchText){
        return dao.getListCount(searchText);
    }

    public long getListCount(java.util.Set<Filter> filterList){
        return dao.getListCount(filterList);
    }

    public long getListCount(java.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.getListCount(searchText, filterList);
    }

    public long getListCount(int start, int limit){
        return dao.getListCount(int start, int limit);
    }

    public long getListCount(int start, int limit, java.lang.String searchText){
        return dao.getListCount(start, limit, searchText);
    }

    public long getListCount(int start, int limit, java.util.Set<Filter> filterList){
        return dao.getListCount(start, limit, filterList);
    }

    public long getListCount(jint start, int limit, ava.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.getListCount(start, limit, searchText, filterList);
    }

    public void add(List<{{$caseName}}DTO> list){
        dao.add(list);
    }
    
    public int add({{$caseName}}DTO item){
        return dao.add(item);
    }
        
    public int add({{- range $index,$attribute := $.Attributes }}{{ getDataType $attribute.DataType }} {{ $attribute.Name }}{{getArgumentSeparator $index}}{{- end}}){
        return dao.add({{- range $index,$attribute := $.Attributes }}{{ $attribute.Name }}{{getArgumentSeparator $index}}{{- end}});
    }
        
    public int update(List<{{$caseName}}DTO> list){
        return dao.update(list);
    }

    public int update({{$caseName}}DTO item){
        return dao.update(item);
    }

    public int delete(List<{{$caseName}}DTO> list){
        dao.delete(list);
    }

    public void delete({{$caseName}}DTO item){
        dao.delete(item);
    }

    public void deleteById({{- $primaryType }} {{$attribute.Name}}){
        dao.deleteById({{$attribute.Name}});
    }

    public {{$caseName}}DTO copy({{$caseName}}DTO item){
        dao.copy(item, 1);
    }

    public java.util.List<{{$caseName}}DTO> copy({{$caseName}}DTO item, int copies){
        dao.copy(item, copies);
    }
}
