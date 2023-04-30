/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service;

import java.util.List;

public interface ITestService {

    public TestDTO getTestById(java.lang.Long id);

    public java.util.List<TestDTO> getList();

    public java.util.List<TestDTO> getList(java.lang.String searchText);
    
    public java.util.List<TestDTO> getList(java.util.Set<Sorter> sorterList);

    public java.util.List<TestDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList);

    public java.util.List<TestDTO> getList(java.util.Set<Filter> filterList);

    public java.util.List<TestDTO> getList(java.lang.String searchText, java.util.Set<Filter> filterList);

    public java.util.List<TestDTO> getList(java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public java.util.List<TestDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);
        
    public java.util.List<TestDTO> getList(int start, int limit);
    
    public java.util.List<TestDTO> getList(int start, int limit, java.lang.String searchText);
    
    public java.util.List<TestDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList);

    public java.util.List<TestDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList);

    public java.util.List<TestDTO> getList(int start, int limit, java.util.Set<Filter> filterList);

    public java.util.List<TestDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList);

    public java.util.List<TestDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public java.util.List<TestDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public long getCount();

    public long getCount(java.lang.String searchText);    

    public long getCount(java.util.Set<Filter> filterList);    

    public long getCount(java.lang.String searchText, java.util.Set<Filter> filterList);   

    public void add(List<TestDTO> list) ;

    public int add(TestDTO item) ;

    public int add(java.lang.Long id,java.lang.Long column1,java.lang.String column2,java.util.Date column3,java.lang.Boolean column4) ;
            
    public int update(List<TestDTO> list);

    public int update(TestDTO item);

    public int update(java.lang.Long id,java.lang.Long column1,java.lang.String column2,java.util.Date column3,java.lang.Boolean column4);

    public void delete(TestDTO item);

    public void delete(List<TestDTO> list);

    public void deleteById(java.lang.Long id);

    public void deleteById(List<java.lang.Long> list);
}
