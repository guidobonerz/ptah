package {{getFullNameSpace}};
{{- $attributeList := getAttributes}}
{{- $primaryAttributes := getPrimaryAttributes}}
{{- $primaryAttributeTypes := getDataTypes $primaryAttributes }}
{{- $serviceName := getObjectName "service"}}
{{- $dtoName := getObjectName "dto"}}

import {{getFullObjectName "dto"}};
import {{getFullObjectName "filter"}};
import {{getFullObjectName "sorter"}};

import java.util.List;

public interface {{$serviceName}} {

    public {{$dtoName}} get({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}});

    public List<{{$dtoName}}> list();

    public List<{{$dtoName}}> list(final String searchText);
    
    public List<{{$dtoName}}> list(final List<Sorter> sorterList);

    public List<{{$dtoName}}> list(final String searchText, final List<Sorter> sorterList);

    public List<{{$dtoName}}> list(final List<Filter> filterList);

    public List<{{$dtoName}}> list(final String searchText, final List<Filter> filterList);

    public List<{{$dtoName}}> list(final List<Sorter> sorterList, final List<Filter> filterList);

    public List<{{$dtoName}}> list(final String searchText, final List<Sorter> sorterList, final List<Filter> filterList);
        
    public List<{{$dtoName}}> list(final int start, final int limit);
    
    public List<{{$dtoName}}> list(final int start, final int limit, final String searchText);
    
    public List<{{$dtoName}}> list(final int start, final int limit, final List<Sorter> sorterList);

    public List<{{$dtoName}}> list(final int start, final int limit, final String searchText, final List<Sorter> sorterList);

    public List<{{$dtoName}}> list(final int start, final int limit, final List<Filter> filterList);

    public List<{{$dtoName}}> list(final int start, final int limit, final String searchText, final List<Filter> filterList);

    public List<{{$dtoName}}> list(final int start, final int limit, final List<Sorter> sorterList, final List<Filter> filterList);

    public List<{{$dtoName}}> list(final int start, final int limit, final String searchText, final List<Sorter> sorterList, final List<Filter> filterList);

    public long count();

    public long count(final String searchText);    

    public long count(final List<Filter> filterList);    

    public long count(final String searchText, final List<Filter> filterList);

    public long count(final int start, final int limit);

    public long count(final int start, final int limit, final String searchText);    

    public long count(final int start, final int limit, final List<Filter> filterList);    

    public long count(final int start, final int limit, final String searchText, final List<Filter> filterList);   

    public void add(final List<{{$dtoName}}> list) ;

    public int add(final {{$dtoName}} item) ;

    public int add({{- range $index,$attribute := $attributeList }}final {{ getDataType $attribute }} {{ $attribute.Name }}{{getAttributeSeparator $index $attributeList}}{{- end}}) ;
            
    public {{$dtoName}} copy(final {{$dtoName}} item);

    public List<{{$dtoName}}> copy(final {{$dtoName}} item, int copies);

    public int update(final List<{{$dtoName}}> list);

    public int update(final {{$dtoName}} item);

    public void delete(final {{$dtoName}} item);

    public void delete(final List<{{$dtoName}}> list);

    public void delete({{- range $index,$attribute := $primaryAttributes }}final {{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getAttributeSeparator $index $primaryAttributes}}{{- end}});
}
