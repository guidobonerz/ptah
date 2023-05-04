/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

@Repository

public class MusicianDAO {

    @Autowired
    private EntityManager entityManager;

    private final static String SELECT_ALL   = "SELECT o from MusicianDTO o";
    private final static String SELECT_BY_ID = "SELECT o from MusicianDTO o where id=:id";
    private final static String COUNT        = "SELECT count(o) from MusicianDTO o";
    private final static String CREATE       = "EXEC CREATE_MUSICIAN :id,  :firstName,  :lastName";
    private final static String UPDATE       = "EXEC UPDATE_MUSICIAN :id,  :firstName,  :lastName";
    private final static String DELETE_BY_ID = "EXEC DELETE_MUSICIAN_BY_ID id=:id";
    
    

    public MusicianDTO getById(java.lang.Long id){
        final Query query = entityManager.createQuery(SELECT_BY_ID,MusicianDTO.class);
        query.setParameter("id",id);
        return query.getSingleResult();
    }

    public List<MusicianDTO> getList(){
        final Query query = entityManager.createQuery(SELECT_ALL,MusicianDTO.class);
        return query.getResultList();
    }

    public List<MusicianDTO> getList(java.lang.String searchText){
        return getList(searchText, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<MusicianDTO> getList(List<Sorter> sorterList){
        return getList((String)null, sorterList, (List<Filter>)null);
    }

    public List<MusicianDTO> getList(java.lang.String searchText, ListSet<Sorter> sorterList){
        return getList(searchText, sorterList, (List<Filter>)null);
    }

    public List<MusicianDTO> getList(List<Filter> filterList){
        return getList((String)null, (List<Sorter>)null, filterList);
    }

    public List<MusicianDTO> getList(java.lang.String searchText, List<Filter> filterList){
        return getList(searchText, (List<Sorter>)null, filterList);
    }

    public List<MusicianDTO> getList(List<Sorter> sorterList, List<Filter> filterList){
        return getList((String)null, sorterList, filterList);
    }

    public List<MusicianDTO> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return null;
    }
        
    public List<MusicianDTO> getList(int start, int limit){
        return getList(start, limit, (String)null, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<MusicianDTO> getList(int start, int limit, java.lang.String searchText){
        return getList(start, limit, searchText, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<MusicianDTO> getList(int start, int limit, List<Sorter> sorterList){
        return getList(start, limit, (String)null, sorterList, (List<Filter>)null);
    }

    public List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList){
        return getList(start, limit, searchText, sorterList, (List<Filter>)null);
    }

    public List<MusicianDTO> getList(int start, int limit, List<Filter> filterList){
        return getList(start, limit, (String)null, (List<Sorter>)null, filterList);
    }

    public List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return getList(start, limit, searchText, (List<Sorter>)null, filterList);
    }

    public List<MusicianDTO> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList){
        return getList(start, limit, (String)null, sorterList, filterList);
    }

    public List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
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
    
    public void add(List<MusicianDTO> list){
        for(MusicianDTO item:list){
            add(item);
        }
    }

    public int add(MusicianDTO item){
        return add(item.getId(), item.getFirstName(), item.getLastName())
    }

    public int add(java.lang.Long id, java.lang.String firstName, java.lang.String lastName){
        query.setParameter("id",id);
        query.setParameter("firstName",firstName);
        query.setParameter("lastName",lastName);
    }

    public int update(List<MusicianDTO> list){
        int updatedItems=0;
        for(MusicianDTO item:list){
            updatedItems+=update(item);
        }
        return updatedItems;
    }

    public int update(MusicianDTO item){
        query.setParameter("id",item.getId());
        query.setParameter("firstName",item.getFirstName());
        query.setParameter("lastName",item.getLastName());
        return 0;
    }

    public void delete(List<MusicianDTO> list){
        for(MusicianDTO item:list){
            delete(item);
        }
    }

    public void delete(MusicianDTO item){
        deleteById(item.getId());
    }

    public void deleteById(java.lang.Long id){
        query.setParameter("id",id);
    }

    public List<MusicianDTO> copy(MusicianDTO item, int copies){
        query.setParameter("id",item.getId());
        query.setParameter("firstName",item.getFirstName());
        query.setParameter("lastName",item.getLastName());
    }
}
