/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

@Repository

public class TestDAO {

    @Autowired
    private EntityManager entityManager;

    private final static String SELECT_ALL   = "SELECT o from TestDTO o";
    private final static String SELECT_BY_ID = "SELECT o from TestDTO o where id=:id";
    private final static String COUNT        = "SELECT count(o) from TestDTO o";
    private final static String CREATE       = "EXEC CREATE_TEST :id,  :column1,  :column2,  :column3,  :column4";
    private final static String UPDATE       = "EXEC UPDATE_TEST :id,  :column1,  :column2,  :column3,  :column4";
    private final static String DELETE_BY_ID = "EXEC DELETE_TEST_BY_ID :id";
    
    

    public TestDTO getById(java.lang.Long id){
        final Query query = entityManager.createQuery(SELECT_BY_ID,TestDTO.class);
        query.setParameter("id",id);
        return query.getSingleResult();
    }

    public java.util.List<TestDTO> getList(){
        final Query query = entityManager.createQuery(SELECT_ALL,TestDTO.class);
        return query.getResultList();
    }

    public java.util.List<TestDTO> getList(java.lang.String searchText){
        return getList(searchText, (java.util.Set<Sorter>)null, (java.util.Set<Filter>)null);
    }
    
    public java.util.List<TestDTO> getList(java.util.Set<Sorter> sorterList){
        return getList((String)null, sorterList, (java.util.Set<Filter>)null);
    }

    public java.util.List<TestDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return getList(searchText, sorterList, (java.util.Set<Filter>)null);
    }

    public java.util.List<TestDTO> getList(java.util.Set<Filter> filterList){
        return getList((String)null, (java.util.Set<Sorter>)null, filterList);
    }

    public java.util.List<TestDTO> getList(java.lang.String searchText, java.util.Set<Filter> filterList){
        return getList(searchText, (java.util.Set<Sorter>)null, filterList);
    }

    public java.util.List<TestDTO> getList(java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return getList((String)null, sorterList, filterList);
    }

    public java.util.List<TestDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return null;
    }
        
    public java.util.List<TestDTO> getList(int start, int limit){
        return getList(start, limit, (String)null, (java.util.Set<Sorter>)null, (java.util.Set<Filter>)null);
    }
    
    public java.util.List<TestDTO> getList(int start, int limit, java.lang.String searchText){
        return getList(start, limit, searchText, (java.util.Set<Sorter>)null, (java.util.Set<Filter>)null);
    }
    
    public java.util.List<TestDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList){
        return getList(start, limit, (String)null, sorterList, (java.util.Set<Filter>)null);
    }

    public java.util.List<TestDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return getList(start, limit, searchText, sorterList, (java.util.Set<Filter>)null);
    }

    public java.util.List<TestDTO> getList(int start, int limit, java.util.Set<Filter> filterList){
        return getList(start, limit, (String)null, (java.util.Set<Sorter>)null, filterList);
    }

    public java.util.List<TestDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList){
        return getList(start, limit, searchText, (java.util.Set<Sorter>)null, filterList);
    }

    public java.util.List<TestDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return getList(start, limit, (String)null, sorterList, filterList);
    }

    public java.util.List<TestDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return null;
    }

    public long getListCount(){
        return getListCount((String)null, (java.util.Set<Filter>null);
    }

    public long getListCount(java.lang.String searchText){
        return getListCount(searchText, (java.util.Set<Filter>null);
    }

    public long getListCount(java.util.Set<Filter> filterList){
        return getListCount((String)null), (java.util.Set<Filter>filterList);
    }

    public long getListCount(java.lang.String searchText, java.util.Set<Filter> filterList){
        return 0;
    }

    public long getListCount(int start, int limit){
        return getListCount(start, limit, (String)null, (java.util.Set<Filter>null);
    }

    public long getListCount(int start, int limit, java.lang.String searchText){
        return getListCount(start, limit,searchText, (java.util.Set<Filter>null);
    }

    public long getListCount(int start, int limit, java.util.Set<Filter> filterList){
        return getListCount(start, limit,(String)null), (java.util.Set<Filter>filterList);
    }

    public long getListCount(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList){
        return 0;
    }
    
    public void add(List<TestDTO> list){
        for(TestDTO item:list){
            add(item);
        }
    }

    public int add(TestDTO item){
        return add(item.getId(), item.getColumn1(), item.getColumn2(), item.getColumn3(), item.getColumn4())
    }

    public int add(java.lang.Long id, java.lang.Long column1, java.lang.String column2, java.util.Date column3, java.lang.Boolean column4){
        query.setParameter("id",id);
        query.setParameter("column1",column1);
        query.setParameter("column2",column2);
        query.setParameter("column3",column3);
        query.setParameter("column4",column4);
    }

    public int update(List<TestDTO> list){
        int updatedItems=0;
        for(TestDTO item:list){
            updatedItems+=update(item);
        }
        return updatedItems;
    }

    public int update(TestDTO item){
        query.setParameter("id",item.getId());
        query.setParameter("column1",item.getColumn1());
        query.setParameter("column2",item.getColumn2());
        query.setParameter("column3",item.getColumn3());
        query.setParameter("column4",item.getColumn4());
        return 0;
    }

    public void delete(List<TestDTO> list){
        for(TestDTO item:list){
            delete(item);
        }
    }

    public void delete(TestDTO item){
        deleteById(item.getId());
    }

    public void deleteById(java.lang.Long id){
        query.setParameter("id",id);
    }
}
