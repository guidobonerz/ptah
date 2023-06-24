package {{getFullNameSpace}};
{{- $attributeList := getAttributes}}
{{- $primaryAttributes := getPrimaryAttributes}}
{{- $primaryAttributeTypes := getDataTypes $primaryAttributes }}
{{- $serviceName := getObjectName "service"}}
{{- $dtoName := getObjectName "dto"}}
{{- $daoName := getObjectName "dao"}}

import {{getFullObjectName "dto"}};
import {{getFullObjectName "filter"}};
import {{getFullObjectName "sorter"}};
import {{getFullObjectName "result"}};

import java.util.List;

public interface {{$serviceName}} {

    public {{$dtoName}} get({{- range $index,$attribute := $primaryAttributes }}final {{ index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}});

    public Result<{{$dtoName}}> list();

    public Result<{{$dtoName}}> list(final String searchText);

    public Result<{{$dtoName}}> list(final String searchText, final List<Sorter> sorterList);

    public Result<{{$dtoName}}> list(final List<Filter> filterList, final List<Sorter> sorterList);
        
    public Result<{{$dtoName}}> list(final int start, final int limit);
    
    public Result<{{$dtoName}}> list(final int start, final int limit, final String searchText);

    public Result<{{$dtoName}}> list(final int start, final int limit, final String searchText, final List<Sorter> sorterList);

    public Result<{{$dtoName}}> list(final int start, final int limit, final List<Filter> filterList, final List<Sorter> sorterList);

    public Result<{{$dtoName}}> list(final int start, final int limit, final String searchText, final List<Filter> filterList, final List<Sorter> sorterList);

    public long count();

    public long count(final String searchText);    

    public long count(final List<Filter> filterList);    

    public long count(final String searchText, final List<Filter> filterList);
    
    public void add(final List<{{$dtoName}}> list) ;

    public int add(final {{$dtoName}} item) ;

    public int add({{- range $index,$attribute := $attributeList }}final {{ getDataType $attribute }} {{ $attribute.Name }}{{getAttributeSeparator $index $attributeList}}{{- end}}) ;
            
    public {{$dtoName}} copy(final {{$dtoName}} item);

    public List<{{$dtoName}}> copy(final {{$dtoName}} item, int copies);

    public int update(final List<{{$dtoName}}> list);

    public int update(final {{$dtoName}} item);

    public void delete(final {{$dtoName}} item);

    public void delete(final List<{{$dtoName}}> list);

    public void delete({{- range $index,$attribute := $primaryAttributes }}final {{ index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}});
}
