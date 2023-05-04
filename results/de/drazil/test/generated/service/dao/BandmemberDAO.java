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
    private final static String SELECT_BY_ID = "SELECT o from BandmemberDTO o where musicianId=:musicianId, bandId=:bandId";
    private final static String COUNT        = "SELECT count(o) from BandmemberDTO o";
    private final static String CREATE       = "EXEC CREATE_BANDMEMBER :musicianId,  :bandId";
    private final static String UPDATE       = "EXEC UPDATE_BANDMEMBER :musicianId,  :bandId";
    private final static String DELETE_BY_ID = "EXEC DELETE_BANDMEMBER_BY_ID musicianId=:musicianId, bandId=:bandId";
    
    

    public BandmemberDTO getById(java.lang.Long musicianId, java.lang.Long bandId){
        final Query query = entityManager.createQuery(SELECT_BY_ID,BandmemberDTO.class);
        query.setParameter("musicianId",musicianId);
        query.setParameter("bandId",bandId);
        return query.getSingleResult();
    }

    public List<BandmemberDTO> getList(){
        final Query query = entityManager.createQuery(SELECT_ALL,BandmemberDTO.class);
        return query.getResultList();
    }

    public List<BandmemberDTO> getList(java.lang.String searchText){
        return getList(searchText, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<BandmemberDTO> getList(List<Sorter> sorterList){
        return getList((String)null, sorterList, (List<Filter>)null);
    }

    public List<BandmemberDTO> getList(java.lang.String searchText, ListSet<Sorter> sorterList){
        return getList(searchText, sorterList, (List<Filter>)null);
    }

    public List<BandmemberDTO> getList(List<Filter> filterList){
        return getList((String)null, (List<Sorter>)null, filterList);
    }

    public List<BandmemberDTO> getList(java.lang.String searchText, List<Filter> filterList){
        return getList(searchText, (List<Sorter>)null, filterList);
    }

    public List<BandmemberDTO> getList(List<Sorter> sorterList, List<Filter> filterList){
        return getList((String)null, sorterList, filterList);
    }

    public List<BandmemberDTO> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return null;
    }
        
    public List<BandmemberDTO> getList(int start, int limit){
        return getList(start, limit, (String)null, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText){
        return getList(start, limit, searchText, (List<Sorter>)null, (List<Filter>)null);
    }
    
    public List<BandmemberDTO> getList(int start, int limit, List<Sorter> sorterList){
        return getList(start, limit, (String)null, sorterList, (List<Filter>)null);
    }

    public List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList){
        return getList(start, limit, searchText, sorterList, (List<Filter>)null);
    }

    public List<BandmemberDTO> getList(int start, int limit, List<Filter> filterList){
        return getList(start, limit, (String)null, (List<Sorter>)null, filterList);
    }

    public List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return getList(start, limit, searchText, (List<Sorter>)null, filterList);
    }

    public List<BandmemberDTO> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList){
        return getList(start, limit, (String)null, sorterList, filterList);
    }

    public List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
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
        deleteById(item.getMusicianId(), item.getBandId());
    }

    public void deleteById(java.lang.Long musicianId, java.lang.Long bandId){
        query.setParameter("musicianId",musicianId);
        query.setParameter("bandId",bandId);
    }

    public List<BandmemberDTO> copy(BandmemberDTO item, int copies){
        query.setParameter("musicianId",item.getMusicianId());
        query.setParameter("bandId",item.getBandId());
    }
}
