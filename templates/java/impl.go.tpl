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

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class {{$implName}}  implements {{$serviceName}}{

    @Autowired
    private {{$daoName}} dao;

    public {{$dtoName}} get({{- range $index,$attribute := $primaryAttributes }}final {{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}}){
        return dao.get({{- range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}});
    }

    public List<{{$dtoName}}> list(){
        return dao.list();
    }

    public List<{{$dtoName}}> list(final String searchText){
        return dao.list(searchText);
    }
    
    public List<{{$dtoName}}> list(final List<Sorter> sorterList){
        return dao.list(sorterList);
    }

    public List<{{$dtoName}}> list(final String searchText, final List<Sorter> sorterList){
        return dao.list(searchText, sorterList);
    }

    public List<{{$dtoName}}> list(final List<Filter> filterList){
        return dao.list(filterList);
    }

    public List<{{$dtoName}}> list(final String searchText, final List<Filter> filterList){
        return dao.list(searchText, filterList);
    }

    public List<{{$dtoName}}> list(final List<Sorter> sorterList, final List<Filter> filterList){
        return dao.list(sorterList, filterList);
    }

    public List<{{$dtoName}}> list(final String searchText, final List<Sorter> sorterList, final List<Filter> filterList){
        return dao.list(searchText, sorterList, filterList);
    }
        
    public List<{{$dtoName}}> list(final int start, final int limit){
        return dao.list(start, limit);
    }
    
    public List<{{$dtoName}}> list(final int start, final int limit, final String searchText){
        return dao.list(start, limit, searchText);
    }
    
    public List<{{$dtoName}}> list(final int start, final int limit, final List<Sorter> sorterList){
        return dao.list(start, limit, sorterList);
    }

    public List<{{$dtoName}}> list(final int start, final int limit, final String searchText, final List<Sorter> sorterList){
        return dao.list(start, limit, searchText, sorterList);
    }

    public List<{{$dtoName}}> list(final int start, final int limit, final List<Filter> filterList){
        return dao.list(start, limit, filterList);
    }

    public List<{{$dtoName}}> list(final int start, final int limit, final String searchText, final List<Filter> filterList){
        return dao.list(start, limit, searchText, filterList);
    }

    public List<{{$dtoName}}> list(final int start, final int limit, final List<Sorter> sorterList, final List<Filter> filterList){
        return dao.list(start, limit, sorterList, filterList);
    }

    public List<{{$dtoName}}> list(final int start, final int limit, final String searchText, final List<Sorter> sorterList, final List<Filter> filterList){
        return dao.list(start, limit, searchText, sorterList, filterList);
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
        dao.copy(item, 1);
    }

    public List<{{$dtoName}}> copy(final {{$dtoName}} item, final int copies){
        dao.copy(item, copies);
    }

    public int update(final List<{{$dtoName}}> list){
        return dao.update(list);
    }

    public int update(final {{$dtoName}} item){
        return dao.update(item);
    }

    public int delete(final List<{{$dtoName}}> list){
        dao.delete(list);
    }

    public void delete(final {{$dtoName}} item){
        dao.delete(item);
    }

    public void delete({{- range $index,$attribute := $primaryAttributes }}final {{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}}){
        dao.delete({{- range $index,$attribute := $primaryAttributes }}{{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}});
    }
}
