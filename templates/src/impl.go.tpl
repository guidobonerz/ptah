package {{getFullNameSpace}};
{{- $attributeList := getAttributes}}
{{- $primaryAttributes := getPrimaryAttributes}}
{{- $primaryAttributeTypes := getDataTypes $primaryAttributes }}
{{- $daoName := getObjectName "dao"}}
{{- $dtoName := getObjectName "dto"}}
{{- $serviceName := getObjectName "service"}}
{{- $implName := getObjectName "impl"}}

import {{getFullObjectName "dao"}};
import {{getFullObjectName "dto"}};

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class {{$implName}}  implements {{$serviceName}}{

    @Autowired
    private {{$daoName}} dao;

    public {{$dtoName}} getById({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}){
        return dao.getById({{- range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}});
    }

    public List<{{$dtoName}}> getList(){
        return dao.getList();
    }

    public List<{{$dtoName}}> getList(java.lang.String searchText){
        return dao.getList(searchText);
    }
    
    public List<{{$dtoName}}> getList(List<Sorter> sorterList){
        return dao.getList(sorterList);
    }

    public List<{{$dtoName}}> getList(java.lang.String searchText, List<Sorter> sorterList){
        return dao.getList(searchText, sorterList);
    }

    public List<{{$dtoName}}> getList(List<Filter> filterList){
        return dao.getList(filterList);
    }

    public List<{{$dtoName}}> getList(java.lang.String searchText, List<Filter> filterList){
        return dao.getList(searchText, filterList);
    }

    public List<{{$dtoName}}> getList(List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(sorterList, filterList);
    }

    public List<{{$dtoName}}> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(searchText, sorterList, filterList);
    }
        
    public List<{{$dtoName}}> getList(int start, int limit){
        return dao.getList(start, limit);
    }
    
    public List<{{$dtoName}}> getList(int start, int limit, java.lang.String searchText){
        return dao.getList(start, limit, searchText);
    }
    
    public List<{{$dtoName}}> getList(int start, int limit, List<Sorter> sorterList){
        return dao.getList(start, limit, sorterList);
    }

    public List<{{$dtoName}}> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList){
        return dao.getList(start, limit, searchText, sorterList);
    }

    public List<{{$dtoName}}> getList(int start, int limit, List<Filter> filterList){
        return dao.getList(start, limit, filterList);
    }

    public List<{{$dtoName}}> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return dao.getList(start, limit, searchText, filterList);
    }

    public List<{{$dtoName}}> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(start, limit, sorterList, filterList);
    }

    public List<{{$dtoName}}> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
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

    public long getListCount(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return dao.getListCount(start, limit, searchText, filterList);
    }

    public void add(List<{{$dtoName}}> list){
        dao.add(list);
    }
    
    public int add({{$dtoName}} item){
        return dao.add(item);
    }
        
    public int add({{- range $index,$attribute := $attributeList }}{{ getDataType $attribute }} {{ $attribute.Name }}{{getArgumentSeparator $index $attributeList}}{{- end}}){
        return dao.add({{- range $index,$attribute := $attributeList }}{{ $attribute.Name }}{{getArgumentSeparator $index $attributeList}}{{- end}});
    }

    public {{$dtoName}} copy({{$dtoName}} item){
        dao.copy(item, 1);
    }

    public List<{{$dtoName}}> copy({{$dtoName}} item, int copies){
        dao.copy(item, copies);
    }

    public int update(List<{{$dtoName}}> list){
        return dao.update(list);
    }

    public int update({{$dtoName}} item){
        return dao.update(item);
    }

    public int delete(List<{{$dtoName}}> list){
        dao.delete(list);
    }

    public void delete({{$dtoName}} item){
        dao.delete(item);
    }

    public void deleteById({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}){
        dao.deleteById({{- range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}});
    }
}
