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
import {{getFullObjectName "service"}};
import {{getFullObjectName "filter"}};
import {{getFullObjectName "sorter"}};
import {{getFullObjectName "result"}};

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class {{$implName}}  implements {{$serviceName}}{

    @Autowired
    private {{$daoName}} dao;

    public {{$dtoName}} get({{- range $index,$attribute := $primaryAttributes }}final {{ index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}}){
        return dao.get({{- range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}});
    }

    public Result<{{$dtoName}}> list(){
        return dao.list();
    }

    public Result<{{$dtoName}}> list(final String searchText){
        return dao.list(searchText);
    }

    public Result<{{$dtoName}}> list(final String searchText, final List<Sorter> sorterList){
        return dao.list(searchText, sorterList);
    }

    public Result<{{$dtoName}}> list(final List<Filter> filterList, final List<Sorter> sorterList){
        return dao.list(filterList, sorterList);
    }

    public Result<{{$dtoName}}> list(final String searchText, final List<Filter> filterList, final List<Sorter> sorterList){
        return dao.list(searchText, filterList, sorterList);
    }
        
    public Result<{{$dtoName}}> list(final int start, final int limit){
        return dao.list(start, limit);
    }
    
    public Result<{{$dtoName}}> list(final int start, final int limit, final String searchText){
        return dao.list(start, limit, searchText);
    }

    public Result<{{$dtoName}}> list(final int start, final int limit, final String searchText, final List<Sorter> sorterList){
        return dao.list(start, limit, searchText, sorterList);
    }

    public Result<{{$dtoName}}> list(final int start, final int limit, final List<Filter> filterList, final List<Sorter> sorterList){
        return dao.list(start, limit, filterList, sorterList);
    }

    public Result<{{$dtoName}}> list(final int start, final int limit, final String searchText, final List<Filter> filterList, final List<Sorter> sorterList){
        return dao.list(start, limit, searchText, filterList, sorterList);
    }

    public long count(){
        return dao.count();
    }

    public long count(final String searchText){
        return dao.count(searchText);
    }

    public long count(final List<Filter> filterList){
        return dao.count(filterList);
    }

    public long count(final String searchText, final List<Filter> filterList){
        return dao.count(searchText, filterList);
    }
    
    public void add(final List<{{$dtoName}}> list){
        dao.add(list);
    }
    
    public int add(final {{$dtoName}} item){
        return dao.add(item);
    }
        
    public int add({{- range $index,$attribute := $attributeList }}final {{ getDataType $attribute }} {{ $attribute.Name }}{{getAttributeSeparator $index $attributeList}}{{- end}}){
        return dao.add({{- range $index,$attribute := $attributeList }}{{ $attribute.Name }}{{getAttributeSeparator $index $attributeList}}{{- end}});
    }

    public {{$dtoName}} copy(final {{$dtoName}} item){
        return dao.copy(item, 1).get(0);
    }

    public List<{{$dtoName}}> copy(final {{$dtoName}} item, final int copies){
        return dao.copy(item, copies);
    }

    public int update(final List<{{$dtoName}}> list){
        return dao.update(list);
    }

    public int update(final {{$dtoName}} item){
        return dao.update(item);
    }

    public void delete(final List<{{$dtoName}}> list){
        dao.delete(list);
    }

    public void delete(final {{$dtoName}} item){
        dao.delete(item);
    }

    public void delete({{- range $index,$attribute := $primaryAttributes }}final {{ index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}}){
        dao.delete({{- range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}});
    }
}
