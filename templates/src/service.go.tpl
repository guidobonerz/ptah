package {{getFullNameSpace}};

{{- $primaryAttributes := getPrimaryAttributes}}
{{- $primaryAttributeTypes := getDataTypes $primaryAttributes }}
{{- $caseName := getCamelCaseName $.Name}}


import java.util.List;

public interface {{getObjectName}} {

    public {{$caseName}}DTO get{{$caseName}}ById({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}});

    public List<{{$caseName}}DTO> getList();

    public List<{{$caseName}}DTO> getList(java.lang.String searchText);
    
    public List<{{$caseName}}DTO> getList(List<Sorter> sorterList);

    public List<{{$caseName}}DTO> getList(java.lang.String searchText, List<Sorter> sorterList);

    public List<{{$caseName}}DTO> getList(List<Filter> filterList);

    public List<{{$caseName}}DTO> getList(java.lang.String searchText, List<Filter> filterList);

    public List<{{$caseName}}DTO> getList(List<Sorter> sorterList, List<Filter> filterList);

    public List<{{$caseName}}DTO> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList);
        
    public List<{{$caseName}}DTO> getList(int start, int limit);
    
    public List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText);
    
    public List<{{$caseName}}DTO> getList(int start, int limit, List<Sorter> sorterList);

    public List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList);

    public List<{{$caseName}}DTO> getList(int start, int limit, List<Filter> filterList);

    public List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList);

    public List<{{$caseName}}DTO> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList);

    public List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList);

    public long getCount();

    public long getCount(java.lang.String searchText);    

    public long getCount(List<Filter> filterList);    

    public long getCount(java.lang.String searchText, List<Filter> filterList);

    public long getCount(int start, int limit);

    public long getCount(int start, int limit, java.lang.String searchText);    

    public long getCount(int start, int limit, List<Filter> filterList);    

    public long getCount(int start, int limit, java.lang.String searchText, List<Filter> filterList);   

    public void add(List<{{$caseName}}DTO> list) ;

    public int add({{$caseName}}DTO item) ;

    public int add({{- range $index,$attribute := $.Attributes }}{{ getDataType $attribute.DataType }} {{ $attribute.Name }}{{getArgumentSeparator $index $.Attributes}}{{- end}}) ;
            
    public {{$caseName}}DTO copy({{$caseName}}DTO item);

    public List<{{$caseName}}DTO> copy({{$caseName}}DTO item, int copies);

    public int update(List<{{$caseName}}DTO> list);

    public int update({{$caseName}}DTO item);

    public void delete({{$caseName}}DTO item);

    public void delete(List<{{$caseName}}DTO> list);

    public void deleteById({{- range $index,$attribute := $primaryAttributes }}{{- index $primaryAttributeTypes $index}} {{ $attribute.Name }}{{getArgumentSeparator $index $primaryAttributes}}{{- end}});
}
