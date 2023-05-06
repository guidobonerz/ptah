package {{getFullNameSpace}};
{{- $attributeList := getAttributes}}
{{- $primaryAttributes := getPrimaryAttributes}}
{{- $primaryAttributeTypes := getDataTypes $primaryAttributes }}
{{- $serviceName := getObjectName "service"}}
{{- $dtoName := getObjectName "dto"}}

import {{getFullObjectName "dto"}};

import java.util.List;

public interface {{$serviceName}} {

    public {{$dtoName}} get({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}});

    public List<{{$dtoName}}> list();

    public List<{{$dtoName}}> list(java.lang.String searchText);
    
    public List<{{$dtoName}}> list(List<Sorter> sorterList);

    public List<{{$dtoName}}> list(java.lang.String searchText, List<Sorter> sorterList);

    public List<{{$dtoName}}> list(List<Filter> filterList);

    public List<{{$dtoName}}> list(java.lang.String searchText, List<Filter> filterList);

    public List<{{$dtoName}}> list(List<Sorter> sorterList, List<Filter> filterList);

    public List<{{$dtoName}}> list(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList);
        
    public List<{{$dtoName}}> list(int start, int limit);
    
    public List<{{$dtoName}}> list(int start, int limit, java.lang.String searchText);
    
    public List<{{$dtoName}}> list(int start, int limit, List<Sorter> sorterList);

    public List<{{$dtoName}}> list(int start, int limit, java.lang.String searchText, List<Sorter> sorterList);

    public List<{{$dtoName}}> list(int start, int limit, List<Filter> filterList);

    public List<{{$dtoName}}> list(int start, int limit, java.lang.String searchText, List<Filter> filterList);

    public List<{{$dtoName}}> list(int start, int limit, List<Sorter> sorterList, List<Filter> filterList);

    public List<{{$dtoName}}> list(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList);

    public long count();

    public long count(java.lang.String searchText);    

    public long count(List<Filter> filterList);    

    public long count(java.lang.String searchText, List<Filter> filterList);

    public long count(int start, int limit);

    public long count(int start, int limit, java.lang.String searchText);    

    public long count(int start, int limit, List<Filter> filterList);    

    public long count(int start, int limit, java.lang.String searchText, List<Filter> filterList);   

    public void add(List<{{$dtoName}}> list) ;

    public int add({{$dtoName}} item) ;

    public int add({{- range $index,$attribute := $attributeList }}{{ getDataType $attribute }} {{ $attribute.Name }}{{getArgumentSeparator $index $attributeList}}{{- end}}) ;
            
    public {{$dtoName}} copy({{$dtoName}} item);

    public List<{{$dtoName}}> copy({{$dtoName}} item, int copies);

    public int update(List<{{$dtoName}}> list);

    public int update({{$dtoName}} item);

    public void delete({{$dtoName}} item);

    public void delete(List<{{$dtoName}}> list);

    public void delete({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}});
}
