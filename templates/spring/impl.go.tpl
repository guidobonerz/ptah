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

    public {{$dtoName}} get({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}){
        return dao.get({{- range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}});
    }

    public List<{{$dtoName}}> list(){
        return dao.list();
    }

    public List<{{$dtoName}}> list(java.lang.String searchText){
        return dao.list(searchText);
    }
    
    public List<{{$dtoName}}> list(List<Sorter> sorterList){
        return dao.list(sorterList);
    }

    public List<{{$dtoName}}> list(java.lang.String searchText, List<Sorter> sorterList){
        return dao.list(searchText, sorterList);
    }

    public List<{{$dtoName}}> list(List<Filter> filterList){
        return dao.list(filterList);
    }

    public List<{{$dtoName}}> list(java.lang.String searchText, List<Filter> filterList){
        return dao.list(searchText, filterList);
    }

    public List<{{$dtoName}}> list(List<Sorter> sorterList, List<Filter> filterList){
        return dao.list(sorterList, filterList);
    }

    public List<{{$dtoName}}> list(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return dao.list(searchText, sorterList, filterList);
    }
        
    public List<{{$dtoName}}> list(int start, int limit){
        return dao.list(start, limit);
    }
    
    public List<{{$dtoName}}> list(int start, int limit, java.lang.String searchText){
        return dao.list(start, limit, searchText);
    }
    
    public List<{{$dtoName}}> list(int start, int limit, List<Sorter> sorterList){
        return dao.list(start, limit, sorterList);
    }

    public List<{{$dtoName}}> list(int start, int limit, java.lang.String searchText, List<Sorter> sorterList){
        return dao.list(start, limit, searchText, sorterList);
    }

    public List<{{$dtoName}}> list(int start, int limit, List<Filter> filterList){
        return dao.list(start, limit, filterList);
    }

    public List<{{$dtoName}}> list(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return dao.list(start, limit, searchText, filterList);
    }

    public List<{{$dtoName}}> list(int start, int limit, List<Sorter> sorterList, List<Filter> filterList){
        return dao.list(start, limit, sorterList, filterList);
    }

    public List<{{$dtoName}}> list(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return dao.list(start, limit, searchText, sorterList, filterList);
    }

    public long count(){
        return dao.count();
    }

    public long count(java.lang.String searchText){
        return dao.count(searchText);
    }

    public long count(List<Filter> filterList){
        return dao.count(filterList);
    }

    public long count(java.lang.String searchText, List<Filter> filterList){
        return dao.count(searchText, filterList);
    }

    public long count(int start, int limit){
        return dao.count(int start, int limit);
    }

    public long count(int start, int limit, java.lang.String searchText){
        return dao.count(start, limit, searchText);
    }

    public long count(int start, int limit, List<Filter> filterList){
        return dao.count(start, limit, filterList);
    }

    public long count(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return dao.count(start, limit, searchText, filterList);
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

    public void delete({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}}){
        dao.delete({{- range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}});
    }
}
