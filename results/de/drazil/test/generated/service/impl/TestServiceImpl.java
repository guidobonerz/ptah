/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl  implements ITestService{

    @Autowired
    private TestDAO dao;

    public TestDTO getById(java.lang.Long id){
        return dao.getById(id);
    }

    public java.util.List<TestDTO> getList(){
        return dao.getList();
    }

    public java.util.List<TestDTO> getList(java.lang.String searchText){
        return dao.getList(searchText);
    }
    
    public java.util.List<TestDTO> getList(java.util.Set<Sorter> sorterList){
        return dao.getList(sorterList);
    }

    public java.util.List<TestDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return dao.getList(searchText, sorterList);
    }

    public java.util.List<TestDTO> getList(java.util.Set<Filter> filterList){
        return dao.getList(filterList);
    }

    public java.util.List<TestDTO> getList(java.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.getList(searchText, filterList);
    }

    public java.util.List<TestDTO> getList(java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getList(sorterList, filterList);
    }

    public java.util.List<TestDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getList(searchText, sorterList, filterList)
    }
        
    public java.util.List<TestDTO> getList(int start, int limit){
        return dao.getList(start, limit);
    }
    
    public java.util.List<TestDTO> getList(int start, int limit, java.lang.String searchText){
        return dao.getList(start, limit, searchText);
    }
    
    public java.util.List<TestDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList){
        return dao.getList(start, limit, sorterList);
    }

    public java.util.List<TestDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return dao.getList(start, limit, searchText, sorterList);
    }

    public java.util.List<TestDTO> getList(int start, int limit, java.util.Set<Filter> filterList){
        return dao.getList(start, limit, filterList);
    }

    public java.util.List<TestDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.getList(start, limit, searchText, filterList);
    }

    public java.util.List<TestDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getList(start, limit, sorterList, filterList);
    }

    public java.util.List<TestDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getList(start, limit, searchText, sorterList, filterList);
    }

    public long getListCount(){
        return dao.getListCount();
    }

    public long getListCount(java.lang.String searchText){
        return dao.getListCount(searchText);
    }

    public long getListCount(java.util.Set<Filter> filterList){
        return dao.getListCount(filterList);
    }

    public long getListCount(java.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.getListCount(searchText, filterList);
    }

    public void add(List<TestDTO> list){
        dao.add(list);
    }
    
    public int add(TestDTO item){
        return dao.add(item);
    }
        
    public int add(java.lang.Long id,java.lang.Long column1,java.lang.String column2,java.util.Date column3,java.lang.Boolean column4){
        return dao.add(id,column1,column2,column3,column4)
    }
        
    public int update(List<TestDTO> list){
        return dao.update(list);
    }

    public int update(TestDTO item){
        return dao.update(item);
    }

    public int update(java.lang.Long id,java.lang.Long column1,java.lang.String column2,java.util.Date column3,java.lang.Boolean column4){
        return dao.update(id,column1,column2,column3,column4;
    }

    public void delete(TestDTO item){
        return dao.delete(item);
    }

    public void deleteById(java.lang.Long id){
        return dao.deleteById(id);
    }
}
