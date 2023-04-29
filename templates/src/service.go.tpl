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

    public {{$caseName}}DTO add({{$caseName}}DTO {{$.Name}}) ;
    
    public {{$caseName}}DTO add(List<{{$caseName}}DTO> {{$.Name}}List) ;
    
    public {{$caseName}}DTO update({{$caseName}}DTO {{$.Name}});

    public {{$caseName}}DTO update(List<{{$caseName}}DTO> {{$.Name}}List);

    public void delete{{$caseName}}({{$caseName}}DTO {{$.Name}});

    public void delete{{$caseName}}(List<{{$caseName}}DTO> {{$.Name}}List);

    public void delete{{$caseName}}ById({{$primaryType}} {{$attribute.Name}});

    public void delete{{$caseName}}ById(List<{{$primaryType}}> {{$attribute.Name}}List);
}
