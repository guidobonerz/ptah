/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

@Repository

public class BandmemberDAO {

    @Autowired
    private EntityManager entityManager;

    private final static String SELECT_ALL   = "SELECT o from BandmemberDTO o";
    private final static String SELECT_BY_ID = "SELECT o from BandmemberDTO o where bandId=:bandId";
    private final static String COUNT        = "SELECT count(o) from BandmemberDTO o";
    private final static String CREATE       = "EXEC CREATE_BANDMEMBER :musicianId,  :bandId";
    private final static String UPDATE       = "EXEC UPDATE_BANDMEMBER :musicianId,  :bandId";
    private final static String DELETE_BY_ID = "EXEC DELETE_BANDMEMBER_BY_ID :bandId";
    
    

    public BandmemberDTO getById(java.lang.Long bandId){
        final Query query = entityManager.createQuery(SELECT_BY_ID,BandmemberDTO.class);
        query.setParameter("bandId",bandId);
        return query.getSingleResult();
    }

    public java.util.List<BandmemberDTO> getList(){
        final Query query = entityManager.createQuery(SELECT_ALL,BandmemberDTO.class);
        return query.getResultList();
    }

    public java.util.List<BandmemberDTO> getList(java.lang.String searchText){
        return getList(searchText, (java.util.Set<Sorter>)null, (java.util.Set<Filter>)null);
    }
    
    public java.util.List<BandmemberDTO> getList(java.util.Set<Sorter> sorterList){
        return getList((String)null, sorterList, (java.util.Set<Filter>)null);
    }

    public java.util.List<BandmemberDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return getList(searchText, sorterList, (java.util.Set<Filter>)null);
    }

    public java.util.List<BandmemberDTO> getList(java.util.Set<Filter> filterList){
        return getList((String)null, (java.util.Set<Sorter>)null, filterList);
    }

    public java.util.List<BandmemberDTO> getList(java.lang.String searchText, java.util.Set<Filter> filterList){
        return getList(searchText, (java.util.Set<Sorter>)null, filterList);
    }

    public java.util.List<BandmemberDTO> getList(java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return getList((String)null, sorterList, filterList);
    }

    public java.util.List<BandmemberDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return null;
    }
        
    public java.util.List<BandmemberDTO> getList(int start, int limit){
        return getList(start, limit, (String)null, (java.util.Set<Sorter>)null, (java.util.Set<Filter>)null);
    }
    
    public java.util.List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText){
        return getList(start, limit, searchText, (java.util.Set<Sorter>)null, (java.util.Set<Filter>)null);
    }
    
    public java.util.List<BandmemberDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList){
        return getList(start, limit, (String)null, sorterList, (java.util.Set<Filter>)null);
    }

    public java.util.List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return getList(start, limit, searchText, sorterList, (java.util.Set<Filter>)null);
    }

    public java.util.List<BandmemberDTO> getList(int start, int limit, java.util.Set<Filter> filterList){
        return getList(start, limit, (String)null, (java.util.Set<Sorter>)null, filterList);
    }

    public java.util.List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList){
        return getList(start, limit, searchText, (java.util.Set<Sorter>)null, filterList);
    }

    public java.util.List<BandmemberDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return getList(start, limit, (String)null, sorterList, filterList);
    }

    public java.util.List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return null;
    }

    public long getListCount(){
        return getListCount((String)null, (java.util.Set<Filter>null));
    }

    public long getListCount(java.lang.String searchText){
        return getListCount(searchText, (java.util.Set<Filter>null));
    }

    public long getListCount(java.util.Set<Filter> filterList){
        return getListCount((String)null), (java.util.Set<Filter>filterList);
    }

    public long getListCount(java.lang.String searchText, java.util.Set<Filter> filterList){
        return 0;
    }

    public long getListCount(int start, int limit){
        return getListCount(start, limit, (String)null, (java.util.Set<Filter>null));
    }

    public long getListCount(int start, int limit, java.lang.String searchText){
        return getListCount(start, limit,searchText, (java.util.Set<Filter>null));
    }

    public long getListCount(int start, int limit, java.util.Set<Filter> filterList){
        return getListCount(start, limit,(String)null), (java.util.Set<Filter>filterList);
    }

    public long getListCount(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList){
        return 0;
    }
    
    public void add(List<BandmemberDTO> list){
        for(BandmemberDTO item:list){
            add(item);
        }
    }

    public int add(BandmemberDTO item){
        return add(item.getMusicianId(), item.getBandId())
    }

    public int add(java.lang.Long musicianId, java.lang.Long bandId){
        query.setParameter("musicianId",musicianId);
        query.setParameter("bandId",bandId);
    }

    public int update(List<BandmemberDTO> list){
        int updatedItems=0;
        for(BandmemberDTO item:list){
            updatedItems+=update(item);
        }
        return updatedItems;
    }

    public int update(BandmemberDTO item){
        query.setParameter("musicianId",item.getMusicianId());
        query.setParameter("bandId",item.getBandId());
        return 0;
    }

    public void delete(List<BandmemberDTO> list){
        for(BandmemberDTO item:list){
            delete(item);
        }
    }

    public void delete(BandmemberDTO item){
        deleteById(item.getBandId());
    }

    public void deleteById(java.lang.Long bandId){
        query.setParameter("bandId",bandId);
    }

    public java.util.List<BandmemberDTO> copy(BandmemberDTO item, int copies){
        query.setParameter("musicianId",item.getMusicianId());
        query.setParameter("bandId",item.getBandId());
    }
}
