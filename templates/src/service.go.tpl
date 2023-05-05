package {{getFullNameSpace}};
{{- $attributeList := getAttributes}}
{{- $primaryAttributes := getPrimaryAttributes}}
{{- $primaryAttributeTypes := getDataTypes $primaryAttributes }}
{{- $serviceName := getObjectName "service"}}
{{- $dtoName := getObjectName "dto"}}

import {{getFullObjectName "dto"}};

import java.util.List;

public interface {{$serviceName}} {

    public {{$dtoName}} getById({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}});

    public List<{{$dtoName}}> getList();

    public List<{{$dtoName}}> getList(java.lang.String searchText);
    
    public List<{{$dtoName}}> getList(List<Sorter> sorterList);

    public List<{{$dtoName}}> getList(java.lang.String searchText, List<Sorter> sorterList);

    public List<{{$dtoName}}> getList(List<Filter> filterList);

    public List<{{$dtoName}}> getList(java.lang.String searchText, List<Filter> filterList);

    public List<{{$dtoName}}> getList(List<Sorter> sorterList, List<Filter> filterList);

    public List<{{$dtoName}}> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList);
        
    public List<{{$dtoName}}> getList(int start, int limit);
    
    public List<{{$dtoName}}> getList(int start, int limit, java.lang.String searchText);
    
    public List<{{$dtoName}}> getList(int start, int limit, List<Sorter> sorterList);

    public List<{{$dtoName}}> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList);

    public List<{{$dtoName}}> getList(int start, int limit, List<Filter> filterList);

    public List<{{$dtoName}}> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList);

    public List<{{$dtoName}}> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList);

    public List<{{$dtoName}}> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList);

    public long getCount();

    public long getCount(java.lang.String searchText);    

    public long getCount(List<Filter> filterList);    

    public long getCount(java.lang.String searchText, List<Filter> filterList);

    public long getCount(int start, int limit);

    public long getCount(int start, int limit, java.lang.String searchText);    

    public long getCount(int start, int limit, List<Filter> filterList);    

    public long getCount(int start, int limit, java.lang.String searchText, List<Filter> filterList);   

    public void add(List<{{$dtoName}}> list) ;

    public int add({{$dtoName}} item) ;

    public int add({{- range $index,$attribute := $attributeList }}{{ getDataType $attribute }} {{ $attribute.Name }}{{getArgumentSeparator $index $attributeList}}{{- end}}) ;
            
    public {{$dtoName}} copy({{$dtoName}} item);

    public List<{{$dtoName}}> copy({{$dtoName}} item, int copies);

    public int update(List<{{$dtoName}}> list);

    public int update({{$dtoName}} item);

    public void delete({{$dtoName}} item);

    public void delete(List<{{$dtoName}}> list);

    public void deleteById({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}});
}
