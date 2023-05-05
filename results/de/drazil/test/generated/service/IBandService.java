/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service;


import java.util.List;

public interface IBandService {

    public BandDTO getBandById(java.lang.Long id);

    public List<BandDTO> getList();

    public List<BandDTO> getList(java.lang.String searchText);
    
    public List<BandDTO> getList(List<Sorter> sorterList);

    public List<BandDTO> getList(java.lang.String searchText, List<Sorter> sorterList);

    public List<BandDTO> getList(List<Filter> filterList);

    public List<BandDTO> getList(java.lang.String searchText, List<Filter> filterList);

    public List<BandDTO> getList(List<Sorter> sorterList, List<Filter> filterList);

    public List<BandDTO> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList);
        
    public List<BandDTO> getList(int start, int limit);
    
    public List<BandDTO> getList(int start, int limit, java.lang.String searchText);
    
    public List<BandDTO> getList(int start, int limit, List<Sorter> sorterList);

    public List<BandDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList);

    public List<BandDTO> getList(int start, int limit, List<Filter> filterList);

    public List<BandDTO> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList);

    public List<BandDTO> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList);

    public List<BandDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList);

    public long getCount();

    public long getCount(java.lang.String searchText);    

    public long getCount(List<Filter> filterList);    

    public long getCount(java.lang.String searchText, List<Filter> filterList);

    public long getCount(int start, int limit);

    public long getCount(int start, int limit, java.lang.String searchText);    

    public long getCount(int start, int limit, List<Filter> filterList);    

    public long getCount(int start, int limit, java.lang.String searchText, List<Filter> filterList);   

    public void add(List<BandDTO> list) ;

    public int add(BandDTO item) ;

    public int add(java.lang.Long id, java.lang.String name) ;
            
    public BandDTO copy(BandDTO item);

    public List<BandDTO> copy(BandDTO item, int copies);

    public int update(List<BandDTO> list);

    public int update(BandDTO item);

    public void delete(BandDTO item);

    public void delete(List<BandDTO> list);

    public void deleteById(java.lang.Long id);
}
