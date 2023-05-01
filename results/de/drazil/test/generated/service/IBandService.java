/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service;

import java.util.List;

public interface IBandService {

    public BandDTO getBandById(java.lang.Long id);

    public java.util.List<BandDTO> getList();

    public java.util.List<BandDTO> getList(java.lang.String searchText);
    
    public java.util.List<BandDTO> getList(java.util.Set<Sorter> sorterList);

    public java.util.List<BandDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList);

    public java.util.List<BandDTO> getList(java.util.Set<Filter> filterList);

    public java.util.List<BandDTO> getList(java.lang.String searchText, java.util.Set<Filter> filterList);

    public java.util.List<BandDTO> getList(java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public java.util.List<BandDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);
        
    public java.util.List<BandDTO> getList(int start, int limit);
    
    public java.util.List<BandDTO> getList(int start, int limit, java.lang.String searchText);
    
    public java.util.List<BandDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList);

    public java.util.List<BandDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList);

    public java.util.List<BandDTO> getList(int start, int limit, java.util.Set<Filter> filterList);

    public java.util.List<BandDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList);

    public java.util.List<BandDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public java.util.List<BandDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public long getCount();

    public long getCount(java.lang.String searchText);    

    public long getCount(java.util.Set<Filter> filterList);    

    public long getCount(java.lang.String searchText, java.util.Set<Filter> filterList);

    public long getCount(int start, int limit);

    public long getCount(int start, int limit, java.lang.String searchText);    

    public long getCount(int start, int limit, java.util.Set<Filter> filterList);    

    public long getCount(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList);   

    public void add(List<BandDTO> list) ;

    public int add(BandDTO item) ;

    public int add(java.lang.Long id, java.lang.String name) ;
            
    public int update(List<BandDTO> list);

    public int update(BandDTO item);

    public void delete(BandDTO item);

    public void delete(List<BandDTO> list);

    public void deleteById(java.lang.Long id);

    public void deleteById(List<java.lang.Long> list);

    public BandDTO copy(BandDTO item);

    public java.util.List<BandDTO> copy(BandDTO item, int copies);
}
