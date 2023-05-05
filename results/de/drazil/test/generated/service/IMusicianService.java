/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service;


import java.util.List;

public interface IMusicianService {

    public MusicianDTO getMusicianById(java.lang.Long id);

    public List<MusicianDTO> getList();

    public List<MusicianDTO> getList(java.lang.String searchText);
    
    public List<MusicianDTO> getList(List<Sorter> sorterList);

    public List<MusicianDTO> getList(java.lang.String searchText, List<Sorter> sorterList);

    public List<MusicianDTO> getList(List<Filter> filterList);

    public List<MusicianDTO> getList(java.lang.String searchText, List<Filter> filterList);

    public List<MusicianDTO> getList(List<Sorter> sorterList, List<Filter> filterList);

    public List<MusicianDTO> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList);
        
    public List<MusicianDTO> getList(int start, int limit);
    
    public List<MusicianDTO> getList(int start, int limit, java.lang.String searchText);
    
    public List<MusicianDTO> getList(int start, int limit, List<Sorter> sorterList);

    public List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList);

    public List<MusicianDTO> getList(int start, int limit, List<Filter> filterList);

    public List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList);

    public List<MusicianDTO> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList);

    public List<MusicianDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList);

    public long getCount();

    public long getCount(java.lang.String searchText);    

    public long getCount(List<Filter> filterList);    

    public long getCount(java.lang.String searchText, List<Filter> filterList);

    public long getCount(int start, int limit);

    public long getCount(int start, int limit, java.lang.String searchText);    

    public long getCount(int start, int limit, List<Filter> filterList);    

    public long getCount(int start, int limit, java.lang.String searchText, List<Filter> filterList);   

    public void add(List<MusicianDTO> list) ;

    public int add(MusicianDTO item) ;

    public int add(java.lang.Long id, java.lang.String firstName, java.lang.String lastName) ;
            
    public MusicianDTO copy(MusicianDTO item);

    public List<MusicianDTO> copy(MusicianDTO item, int copies);

    public int update(List<MusicianDTO> list);

    public int update(MusicianDTO item);

    public void delete(MusicianDTO item);

    public void delete(List<MusicianDTO> list);

    public void deleteById(java.lang.Long id);
}
