package {{getNameSpace}};

{{- $attribute := getPrimaryKeyAttribute}}
{{- $primaryType := getDataType $attribute.DataType }}
{{- $caseName := getTitleCaseName $.Name}}

import java.util.List;

public interface {{getObjectName}} {

    public {{$caseName}}DTO get{{$caseName}}ById({{$primaryType}} {{$attribute.Name}});

    public java.util.List<{{$caseName}}DTO> getList();

    public java.util.List<{{$caseName}}DTO> getList(java.lang.String searchText);
    
    public java.util.List<{{$caseName}}DTO> getList(java.util.Set<Sorter> sorterList);

    public java.util.List<{{$caseName}}DTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList);

    public java.util.List<{{$caseName}}DTO> getList(java.util.Set<Filter> filterList);

    public java.util.List<{{$caseName}}DTO> getList(java.lang.String searchText, java.util.Set<Filter> filterList);

    public java.util.List<{{$caseName}}DTO> getList(java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public java.util.List<{{$caseName}}DTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);
        
    public java.util.List<{{$caseName}}DTO> getList(int start, int limit);
    
    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText);
    
    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.util.Set<Sorter> sorterList);

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList);

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.util.Set<Filter> filterList);

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList);

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public java.util.List<{{$caseName}}DTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public long getCount();

    public long getCount(java.lang.String searchText);    

    public long getCount(java.util.Set<Filter> filterList);    

    public long getCount(java.lang.String searchText, java.util.Set<Filter> filterList);   

    public void add(List<{{$caseName}}DTO> list) ;

    public int add({{$caseName}}DTO item) ;

    public int add({{- range $index,$attribute := $.Attributes }}{{ getDataType $attribute.DataType }} {{ $attribute.Name }}{{- if isNotLastAttribute $index}},{{- end}}{{- end}}) ;
            
    public int update(List<{{$caseName}}DTO> list);

    public int update({{$caseName}}DTO item);

    public int update({{- range $index,$attribute := $.Attributes }}{{ getDataType $attribute.DataType }} {{ $attribute.Name }}{{- if isNotLastAttribute $index}},{{- end}}{{- end}});

    public void delete({{$caseName}}DTO item);

    public void delete(List<{{$caseName}}DTO> list);

    public void deleteById({{$primaryType}} {{$attribute.Name}});

    public void deleteById(List<{{$primaryType}}> list);
}
