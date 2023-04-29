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

    public TestDTO add(TestDTO test) ;
    
    public TestDTO add(List<TestDTO> testList) ;
    
    public TestDTO update(TestDTO test);

    public TestDTO update(List<TestDTO> testList);

    public void deleteTest(TestDTO test);

    public void deleteTest(List<TestDTO> testList);

    public void deleteTestById(java.lang.Long id);

    public void deleteTestById(List<java.lang.Long> idList);
}
