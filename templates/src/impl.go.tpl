package {{getFullNameSpace}};

{{- $primaryAttributes := getPrimaryAttributes}}
{{- $primaryAttributeTypes := getDataTypes $primaryAttributes }}
{{- $caseName := getCamelCaseName $.Name}}

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class {{getObjectName}}  implements I{{$caseName}}Service{

    @Autowired
    private {{$caseName}}DAO dao;

    public {{$caseName}}DTO getById({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}){
        return dao.getById({{- range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}});
    }

    public List<{{$caseName}}DTO> getList(){
        return dao.getList();
    }

    public List<{{$caseName}}DTO> getList(java.lang.String searchText){
        return dao.getList(searchText);
    }
    
    public List<{{$caseName}}DTO> getList(List<Sorter> sorterList){
        return dao.getList(sorterList);
    }

    public List<{{$caseName}}DTO> getList(java.lang.String searchText, List<Sorter> sorterList){
        return dao.getList(searchText, sorterList);
    }

    public List<{{$caseName}}DTO> getList(List<Filter> filterList){
        return dao.getList(filterList);
    }

    public List<{{$caseName}}DTO> getList(java.lang.String searchText, List<Filter> filterList){
        return dao.getList(searchText, filterList);
    }

    public List<{{$caseName}}DTO> getList(List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(sorterList, filterList);
    }

    public List<{{$caseName}}DTO> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(searchText, sorterList, filterList);
    }
        
    public List<{{$caseName}}DTO> getList(int start, int limit){
        return dao.getList(start, limit);
    }
    
    public List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText){
        return dao.getList(start, limit, searchText);
    }
    
    public List<{{$caseName}}DTO> getList(int start, int limit, List<Sorter> sorterList){
        return dao.getList(start, limit, sorterList);
    }

    public List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList){
        return dao.getList(start, limit, searchText, sorterList);
    }

    public List<{{$caseName}}DTO> getList(int start, int limit, List<Filter> filterList){
        return dao.getList(start, limit, filterList);
    }

    public List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return dao.getList(start, limit, searchText, filterList);
    }

    public List<{{$caseName}}DTO> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(start, limit, sorterList, filterList);
    }

    public List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(start, limit, searchText, sorterList, filterList);
    }

    public long getListCount(){
        return dao.getListCount();
    }

    public long getListCount(java.lang.String searchText){
        return dao.getListCount(searchText);
    }

    public long getListCount(List<Filter> filterList){
        return dao.getListCount(filterList);
    }

    public long getListCount(java.lang.String searchText, List<Filter> filterList){
        return dao.getListCount(searchText, filterList);
    }

    public long getListCount(int start, int limit){
        return dao.getListCount(int start, int limit);
    }

    public long getListCount(int start, int limit, java.lang.String searchText){
        return dao.getListCount(start, limit, searchText);
    }

    public long getListCount(int start, int limit, List<Filter> filterList){
        return dao.getListCount(start, limit, filterList);
    }

    public long getListCount(jint start, int limit, ava.lang.String searchText, List<Filter> filterList){
        return dao.getListCount(start, limit, searchText, filterList);
    }

    public void add(List<{{$caseName}}DTO> list){
        dao.add(list);
    }
    
    public int add({{$caseName}}DTO item){
        return dao.add(item);
    }
        
    public int add({{- range $index,$attribute := $.Attributes }}{{ getDataType $attribute.DataType }} {{ $attribute.Name }}{{getArgumentSeparator $index $.Attributes}}{{- end}}){
        return dao.add({{- range $index,$attribute := $.Attributes }}{{ $attribute.Name }}{{getArgumentSeparator $index $.Attributes}}{{- end}});
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

    public void deleteById({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}){
        dao.deleteById({{- range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}});
    }

    public {{$caseName}}DTO copy({{$caseName}}DTO item){
        dao.copy(item, 1);
    }

    public List<{{$caseName}}DTO> copy({{$caseName}}DTO item, int copies){
        dao.copy(item, copies);
    }
}
