/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

@Repository

public class BandDAO {

    @Autowired
    private EntityManager entityManager;

    private final static String SELECT_ALL   = "SELECT o from BandDTO o";
    private final static String SELECT_BY_ID = "SELECT o from BandDTO o where id=:id";
    private final static String COUNT        = "SELECT count(o) from BandDTO o";
    private final static String CREATE       = "EXEC CREATE_BAND :id,  :name";
    private final static String UPDATE       = "EXEC UPDATE_BAND :id,  :name";
    private final static String DELETE_BY_ID = "EXEC DELETE_BAND_BY_ID id=:id";
    
    

    public BandDTO getById(java.lang.Long id){
        final Query query = entityManager.createQuery(SELECT_BY_ID,BandDTO.class);
        query.setParameter("id",id);
        return query.getSingleResult();
    }

    public List<BandDTO> getList(){
        final Query query = entityManager.createQuery(SELECT_ALL,BandDTO.class);
        return query.getResultList();
    }

    public List<BandDTO> getList(java.lang.String searchText){
        return getList(searchText, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<BandDTO> getList(List<Sorter> sorterList){
        return getList((String)null, sorterList, (List<Filter>)null);
    }

    public List<BandDTO> getList(java.lang.String searchText, ListSet<Sorter> sorterList){
        return getList(searchText, sorterList, (List<Filter>)null);
    }

    public List<BandDTO> getList(List<Filter> filterList){
        return getList((String)null, (List<Sorter>)null, filterList);
    }

    public List<BandDTO> getList(java.lang.String searchText, List<Filter> filterList){
        return getList(searchText, (List<Sorter>)null, filterList);
    }

    public List<BandDTO> getList(List<Sorter> sorterList, List<Filter> filterList){
        return getList((String)null, sorterList, filterList);
    }

    public List<BandDTO> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return null;
    }
        
    public List<BandDTO> getList(int start, int limit){
        return getList(start, limit, (String)null, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<BandDTO> getList(int start, int limit, java.lang.String searchText){
        return getList(start, limit, searchText, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<BandDTO> getList(int start, int limit, List<Sorter> sorterList){
        return getList(start, limit, (String)null, sorterList, (List<Filter>)null);
    }

    public List<BandDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList){
        return getList(start, limit, searchText, sorterList, (List<Filter>)null);
    }

    public List<BandDTO> getList(int start, int limit, List<Filter> filterList){
        return getList(start, limit, (String)null, (List<Sorter>)null, filterList);
    }

    public List<BandDTO> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return getList(start, limit, searchText, (List<Sorter>)null, filterList);
    }

    public List<BandDTO> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList){
        return getList(start, limit, (String)null, sorterList, filterList);
    }

    public List<BandDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return null;List
    }

    public long getListCount(){
        return getListCount((String)null, (List<Filter>)null);
    }

    public long getListCount(java.lang.String searchText){
        return getListCount(searchText, (List<Filter>)null);
    }

    public long getListCount(List<Filter> filterList){
        return getListCount((String)null, filterList);
    }

    public long getListCount(java.lang.String searchText, List<Filter> filterList){
        return 0;
    }

    public long getListCount(int start, int limit){
        return getListCount(start, limit, (String)null, (List<Filter>)null);
    }

    public long getListCount(int start, int limit, java.lang.String searchText){
        return getListCount(start, limit,searchText, (List<Filter>)null);
    }

    public long getListCount(int start, int limit, List<Filter> filterList){
        return getListCount(start, limit,(String)null, filterList);
    }

    public long getListCount(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return 0;
    }
    
    public void add(List<BandDTO> list){
        for(BandDTO item:list){
            add(item);
        }
    }

    public int add(BandDTO item){
        return add(item.getId(), item.getName())
    }

    public int add(java.lang.Long id, java.lang.String name){
        query.setParameter("id",id);
        query.setParameter("name",name);
    }

    public int update(List<BandDTO> list){
        int updatedItems=0;
        for(BandDTO item:list){
            updatedItems+=update(item);
        }
        return updatedItems;
    }

    public int update(BandDTO item){
        query.setParameter("id",item.getId());
        query.setParameter("name",item.getName());
        return 0;
    }

    public void delete(List<BandDTO> list){
        for(BandDTO item:list){
            delete(item);
        }
    }

    public void delete(BandDTO item){
        deleteById(item.getId());
    }

    public void deleteById(java.lang.Long id){
        query.setParameter("id",id);
    }

    public List<BandDTO> copy(BandDTO item, int copies){
        query.setParameter("id",item.getId());
        query.setParameter("name",item.getName());
    }
}
