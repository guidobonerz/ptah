/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class MusicianServiceImpl  implements IMusicianService{

    @Autowired
    private MusicianDAO dao;

    public MusicianDTO getById(java.lang.Long id){
        return dao.getById(id);
    }

    public List<MusicianDTO> getList(){
        return dao.getList();
    }

    public List<MusicianDTO> getList(java.lang.String searchText){
        return dao.getList(searchText);
    }
    
    public List<MusicianDTO> getList(List<Sorter> sorterList){
        return dao.getList(sorterList);
    }

    public List<MusicianDTO> getList(java.lang.String searchText, List<Sorter> sorterList){
        return dao.getList(searchText, sorterList);
    }

    public List<MusicianDTO> getList(List<Filter> filterList){
        return dao.getList(filterList);
    }

    public List<MusicianDTO> getList(java.lang.String searchText, List<Filter> filterList){
        return dao.getList(searchText, filterList);
    }

    public List<MusicianDTO> getList(List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(sorterList, filterList);
    }

    public List<MusicianDTO> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(searchText, sorterList, filterList);
    }
        
    public List<MusicianDTO> getList(int start, int limit){
        return dao.getList(start, limit);
    }
    
    public List<MusicianDTO> getList(int start, int limit, java.lang.String searchText){
        return dao.getList(start, limit, searchText);
    }
    
    public List<MusicianDTO> getList(int start, int limit, List<Sorter> sorterList){
        return dao.getList(start, limit, sorterList);
    }

    public List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList){
        return dao.getList(start, limit, searchText, sorterList);
    }

    public List<MusicianDTO> getList(int start, int limit, List<Filter> filterList){
        return dao.getList(start, limit, filterList);
    }

    public List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList){
        return dao.getList(start, limit, searchText, filterList);
    }

    public List<MusicianDTO> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList){
        return dao.getList(start, limit, sorterList, filterList);
    }

    public List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList){
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

    public void add(List<MusicianDTO> list){
        dao.add(list);
    }
    
    public int add(MusicianDTO item){
        return dao.add(item);
    }
        
    public int add(java.lang.Long id, java.lang.String firstName, java.lang.String lastName){
        return dao.add(id, firstName, lastName);
    }

    public MusicianDTO copy(MusicianDTO item){
        dao.copy(item, 1);
    }

    public List<MusicianDTO> copy(MusicianDTO item, int copies){
        dao.copy(item, copies);
    }

    public int update(List<MusicianDTO> list){
        return dao.update(list);
    }

    public int update(MusicianDTO item){
        return dao.update(item);
    }

    public int delete(List<MusicianDTO> list){
        dao.delete(list);
    }

    public void delete(MusicianDTO item){
        dao.delete(item);
    }

    public void deleteById(java.lang.Long id){
        dao.deleteById(id);
    }
}
