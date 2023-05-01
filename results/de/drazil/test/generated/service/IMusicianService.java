/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service;

import java.util.List;

public interface IMusicianService {

    public MusicianDTO getMusicianById(java.lang.Long id);

    public java.util.List<MusicianDTO> getList();

    public java.util.List<MusicianDTO> getList(java.lang.String searchText);
    
    public java.util.List<MusicianDTO> getList(java.util.Set<Sorter> sorterList);

    public java.util.List<MusicianDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList);

    public java.util.List<MusicianDTO> getList(java.util.Set<Filter> filterList);

    public java.util.List<MusicianDTO> getList(java.lang.String searchText, java.util.Set<Filter> filterList);

    public java.util.List<MusicianDTO> getList(java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public java.util.List<MusicianDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);
        
    public java.util.List<MusicianDTO> getList(int start, int limit);
    
    public java.util.List<MusicianDTO> getList(int start, int limit, java.lang.String searchText);
    
    public java.util.List<MusicianDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList);

    public java.util.List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList);

    public java.util.List<MusicianDTO> getList(int start, int limit, java.util.Set<Filter> filterList);

    public java.util.List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList);

    public java.util.List<MusicianDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public java.util.List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public long getCount();

    public long getCount(java.lang.String searchText);    

    public long getCount(java.util.Set<Filter> filterList);    

    public long getCount(java.lang.String searchText, java.util.Set<Filter> filterList);

    public long getCount(int start, int limit);

    public long getCount(int start, int limit, java.lang.String searchText);    

    public long getCount(int start, int limit, java.util.Set<Filter> filterList);    

    public long getCount(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList);   

    public void add(List<MusicianDTO> list) ;

    public int add(MusicianDTO item) ;

    public int add(java.lang.Long id, java.lang.String firstName, java.lang.String lastName) ;
            
    public int update(List<MusicianDTO> list);

    public int update(MusicianDTO item);

    public void delete(MusicianDTO item);

    public void delete(List<MusicianDTO> list);

    public void deleteById(java.lang.Long id);

    public void deleteById(List<java.lang.Long> list);

    public MusicianDTO copy(MusicianDTO item);

    public java.util.List<MusicianDTO> copy(MusicianDTO item, int copies);
}
