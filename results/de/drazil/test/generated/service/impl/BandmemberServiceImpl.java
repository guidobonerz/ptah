/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class BandmemberServiceImpl  implements IBandmemberService{

    @Autowired
    private BandmemberDAO dao;

    public BandmemberDTO getById(java.lang.Long musicianId, java.lang.Long bandId){
        return dao.getById(musicianId, bandId);
    }

    public List<BandmemberDTO> getList(){
        return dao.getList();
    }

    public List<BandmemberDTO> getList(java.lang.String searchText){
        return dao.getList(searchText);
    }
    
    public List<BandmemberDTO> getList(List<Sorter> sorterList){
        return dao.getList(sorterList);
    }

    public List<BandmemberDTO> getList(java.lang.String searchText, List<Sorter> sorterList){
        return dao.getList(searchText, sorterList);
    }

    public List<BandmemberDTO> getList(List<Filter> filterList){
        return dao.getList(filterList);
    }

    public List<BandmemberDTO> getList(java.lang.String searchText, List<Filter> filterList){
        return dao.getList(searchText, filterList);
    }

    public List<BandmemberDTO> getList(List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(sorterList, filterList);
    }

    public List<BandmemberDTO> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(searchText, sorterList, filterList);
    }
        
    public List<BandmemberDTO> getList(int start, int limit){
        return dao.getList(start, limit);
    }
    
    public List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText){
        return dao.getList(start, limit, searchText);
    }
    
    public List<BandmemberDTO> getList(int start, int limit, List<Sorter> sorterList){
        return dao.getList(start, limit, sorterList);
    }

    public List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList){
        return dao.getList(start, limit, searchText, sorterList);
    }

    public List<BandmemberDTO> getList(int start, int limit, List<Filter> filterList){
        return dao.getList(start, limit, filterList);
    }

    public List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return dao.getList(start, limit, searchText, filterList);
    }

    public List<BandmemberDTO> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(start, limit, sorterList, filterList);
    }

    public List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(start, limit, searchText, sorterList, filterList);
    }

    public long getListCount(){
        return dao.getListCount();
    }

    public long getListCount(java.lang.String searchText){
        return dao.getListCount(searchText);
    }

    public long getListCount(List<Filter> filterList){
        return dao.getListCount(filterList);
    }

    public long getListCount(java.lang.String searchText, List<Filter> filterList){
        return dao.getListCount(searchText, filterList);
    }

    public long getListCount(int start, int limit){
        return dao.getListCount(int start, int limit);
    }

    public long getListCount(int start, int limit, java.lang.String searchText){
        return dao.getListCount(start, limit, searchText);
    }

    public long getListCount(int start, int limit, List<Filter> filterList){
        return dao.getListCount(start, limit, filterList);
    }

    public long getListCount(jint start, int limit, ava.lang.String searchText, List<Filter> filterList){
        return dao.getListCount(start, limit, searchText, filterList);
    }

    public void add(List<BandmemberDTO> list){
        dao.add(list);
    }
    
    public int add(BandmemberDTO item){
        return dao.add(item);
    }
        
    public int add(java.lang.Long musicianId, java.lang.Long bandId){
        return dao.add(musicianId, bandId);
    }
        
    public int update(List<BandmemberDTO> list){
        return dao.update(list);
    }

    public int update(BandmemberDTO item){
        return dao.update(item);
    }

    public int delete(List<BandmemberDTO> list){
        dao.delete(list);
    }

    public void delete(BandmemberDTO item){
        dao.delete(item);
    }

    public void deleteById(java.lang.Long musicianId, java.lang.Long bandId){
        dao.deleteById(musicianId, bandId);
    }

    public BandmemberDTO copy(BandmemberDTO item){
        dao.copy(item, 1);
    }

    public List<BandmemberDTO> copy(BandmemberDTO item, int copies){
        dao.copy(item, copies);
    }
}
