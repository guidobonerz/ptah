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

    public java.util.List<MusicianDTO> getList(){
        return dao.getList();
    }

    public java.util.List<MusicianDTO> getList(java.lang.String searchText){
        return dao.getList(searchText);
    }
    
    public java.util.List<MusicianDTO> getList(java.util.Set<Sorter> sorterList){
        return dao.getList(sorterList);
    }

    public java.util.List<MusicianDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return dao.getList(searchText, sorterList);
    }

    public java.util.List<MusicianDTO> getList(java.util.Set<Filter> filterList){
        return dao.getList(filterList);
    }

    public java.util.List<MusicianDTO> getList(java.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.getList(searchText, filterList);
    }

    public java.util.List<MusicianDTO> getList(java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getList(sorterList, filterList);
    }

    public java.util.List<MusicianDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getList(searchText, sorterList, filterList);
    }
        
    public java.util.List<MusicianDTO> getList(int start, int limit){
        return dao.getList(start, limit);
    }
    
    public java.util.List<MusicianDTO> getList(int start, int limit, java.lang.String searchText){
        return dao.getList(start, limit, searchText);
    }
    
    public java.util.List<MusicianDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList){
        return dao.getList(start, limit, sorterList);
    }

    public java.util.List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList){
        return dao.getList(start, limit, searchText, sorterList);
    }

    public java.util.List<MusicianDTO> getList(int start, int limit, java.util.Set<Filter> filterList){
        return dao.getList(start, limit, filterList);
    }

    public java.util.List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList){
        return dao.getList(start, limit, searchText, filterList);
    }

    public java.util.List<MusicianDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
        return dao.getList(start, limit, sorterList, filterList);
    }

    public java.util.List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList){
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

    public long getListCount(int start, int limit){
        return dao.getListCount(int start, int limit);
    }

    public long getListCount(int start, int limit, java.lang.String searchText){
        return dao.getListCount(start, limit, searchText);
    }

    public long getListCount(int start, int limit, java.util.Set<Filter> filterList){
        return dao.getListCount(start, limit, filterList);
    }

    public long getListCount(jint start, int limit, ava.lang.String searchText, java.util.Set<Filter> filterList){
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

    public MusicianDTO copy(MusicianDTO item){
        dao.copy(item, 1);
    }

    public java.util.List<MusicianDTO> copy(MusicianDTO item, int copies){
        dao.copy(item, copies);
    }
}
