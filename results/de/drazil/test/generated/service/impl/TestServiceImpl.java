package de.drazil.test.generated.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl  implements ITestService{

    @Autowired
    private TestDAO dao;

    public TestDTO getTestById(java.lang.Long id){
        return dao.getTestById(id);
    }

    public java.util.List<TestDTO> getTestList(){
        return dao.getTestList();
    }

    public java.util.List<TestDTO> getTestList(java.lang.String searchText){
        return dao.getTestList(searchText);
    }
    
    public java.util.List<TestDTO> getTestList(java.util.Set<Sorter> sorterList){
        return dao.getTestList(sorterList);
    }

    public java.util.List<TestDTO> getTestList(java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return dao.getTestList(searchText, sorterList);
    }

    public java.util.List<TestDTO> getTestList(java.util.Set<Filter> filterList){
        return dao.getTestList(filterList);
    }

    public java.util.List<TestDTO> getTestList(java.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.getTestList(searchText, filterList);
    }

    public java.util.List<TestDTO> getTestList(java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getTestList(sorterList, filterList);
    }

    public java.util.List<TestDTO> getTestList(java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getTestList(searchText, sorterList, filterList)
    }
        
    public java.util.List<TestDTO> getTestList(int start, int limit){
        return dao.getTestList(start, limit);
    }
    
    public java.util.List<TestDTO> getTestList(int start, int limit, java.lang.String searchText){
        return dao.getTestList(start, limit, searchText);
    }
    
    public java.util.List<TestDTO> getTestList(int start, int limit, java.util.Set<Sorter> sorterList){
        return dao.getTestList(start, limit, sorterList);
    }

    public java.util.List<TestDTO> getTestList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return dao.getTestList(start, limit, searchText, sorterList);
    }

    public java.util.List<TestDTO> getTestList(int start, int limit, java.util.Set<Filter> filterList){
        return dao.getTestList(start, limit, filterList);
    }

    public java.util.List<TestDTO> getTestList(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.getTestList(start, limit, searchText, filterList);
    }

    public java.util.List<TestDTO> getTestList(int start, int limit, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getTestList(start, limit, sorterList, filterList);
    }

    public java.util.List<TestDTO> getTestList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getTestList(start, limit, searchText, sorterList, filterList);
    }

    public long getTestListCount(){
        return dao.getTestListCount();
    }

    public long getTestListCount(java.lang.String searchText){
        return dao.getTestListCount(searchText);
    }

    public long getTestListCount(java.util.Set<Filter> filterList){
        return dao.getTestListCount(filterList);
    }

    public long getTestListCount(java.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.getTestListCount(searchText, filterList);
    }

    public TestDTO addTest(TestDTO test){
        return dao.addTest(test);
    }

    public TestDTO addTest(List<TestDTO> testList){
        return dao.addTest(testList);
    }
    
    public TestDTO updateTest(TestDTO test){
        return dao.updateTest(test);
    }

    public TestDTO updateTest(List<TestDTO> testList){
        return dao.updateTest(testList);
    }

    public void deleteTest(TestDTO test){
        return dao.deleteTest(test);
    }

    public void deleteTestById(java.lang.Long id){
        return dao.deleteTestById(id);
    }
}
