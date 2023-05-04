/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class BandServiceImpl  implements IBandService{

    @Autowired
    private BandDAO dao;

    public BandDTO getById(java.lang.Long id){
        return dao.getById(id);
    }

    public List<BandDTO> getList(){
        return dao.getList();
    }

    public List<BandDTO> getList(java.lang.String searchText){
        return dao.getList(searchText);
    }
    
    public List<BandDTO> getList(List<Sorter> sorterList){
        return dao.getList(sorterList);
    }

    public List<BandDTO> getList(java.lang.String searchText, List<Sorter> sorterList){
        return dao.getList(searchText, sorterList);
    }

    public List<BandDTO> getList(List<Filter> filterList){
        return dao.getList(filterList);
    }

    public List<BandDTO> getList(java.lang.String searchText, List<Filter> filterList){
        return dao.getList(searchText, filterList);
    }

    public List<BandDTO> getList(List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(sorterList, filterList);
    }

    public List<BandDTO> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(searchText, sorterList, filterList);
    }
        
    public List<BandDTO> getList(int start, int limit){
        return dao.getList(start, limit);
    }
    
    public List<BandDTO> getList(int start, int limit, java.lang.String searchText){
        return dao.getList(start, limit, searchText);
    }
    
    public List<BandDTO> getList(int start, int limit, List<Sorter> sorterList){
        return dao.getList(start, limit, sorterList);
    }

    public List<BandDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList){
        return dao.getList(start, limit, searchText, sorterList);
    }

    public List<BandDTO> getList(int start, int limit, List<Filter> filterList){
        return dao.getList(start, limit, filterList);
    }

    public List<BandDTO> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return dao.getList(start, limit, searchText, filterList);
    }

    public List<BandDTO> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(start, limit, sorterList, filterList);
    }

    public List<BandDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
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

    public void add(List<BandDTO> list){
        dao.add(list);
    }
    
    public int add(BandDTO item){
        return dao.add(item);
    }
        
    public int add(java.lang.Long id, java.lang.String name){
        return dao.add(id, name);
    }
        
    public int update(List<BandDTO> list){
        return dao.update(list);
    }

    public int update(BandDTO item){
        return dao.update(item);
    }

    public int delete(List<BandDTO> list){
        dao.delete(list);
    }

    public void delete(BandDTO item){
        dao.delete(item);
    }

    public void deleteById(java.lang.Long id){
        dao.deleteById(id);
    }

    public BandDTO copy(BandDTO item){
        dao.copy(item, 1);
    }

    public List<BandDTO> copy(BandDTO item, int copies){
        dao.copy(item, copies);
    }
}
