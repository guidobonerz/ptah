/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service;

import java.util.List;

public interface IBandmemberService {

    public BandmemberDTO getBandmemberById(java.lang.Long bandId);

    public java.util.List<BandmemberDTO> getList();

    public java.util.List<BandmemberDTO> getList(java.lang.String searchText);
    
    public java.util.List<BandmemberDTO> getList(java.util.Set<Sorter> sorterList);

    public java.util.List<BandmemberDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList);

    public java.util.List<BandmemberDTO> getList(java.util.Set<Filter> filterList);

    public java.util.List<BandmemberDTO> getList(java.lang.String searchText, java.util.Set<Filter> filterList);

    public java.util.List<BandmemberDTO> getList(java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public java.util.List<BandmemberDTO> getList(java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);
        
    public java.util.List<BandmemberDTO> getList(int start, int limit);
    
    public java.util.List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText);
    
    public java.util.List<BandmemberDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList);

    public java.util.List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList);

    public java.util.List<BandmemberDTO> getList(int start, int limit, java.util.Set<Filter> filterList);

    public java.util.List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList);

    public java.util.List<BandmemberDTO> getList(int start, int limit, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public java.util.List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, java.util.Set<Sorter> sorterList, java.util.Set<Filter> filterList);

    public long getCount();

    public long getCount(java.lang.String searchText);    

    public long getCount(java.util.Set<Filter> filterList);    

    public long getCount(java.lang.String searchText, java.util.Set<Filter> filterList);

    public long getCount(int start, int limit);

    public long getCount(int start, int limit, java.lang.String searchText);    

    public long getCount(int start, int limit, java.util.Set<Filter> filterList);    

    public long getCount(int start, int limit, java.lang.String searchText, java.util.Set<Filter> filterList);   

    public void add(List<BandmemberDTO> list) ;

    public int add(BandmemberDTO item) ;

    public int add(java.lang.Long musicianId, java.lang.Long bandId) ;
            
    public int update(List<BandmemberDTO> list);

    public int update(BandmemberDTO item);

    public void delete(BandmemberDTO item);

    public void delete(List<BandmemberDTO> list);

    public void deleteById(java.lang.Long bandId);

    public void deleteById(List<java.lang.Long> list);

    public BandmemberDTO copy(BandmemberDTO item);

    public java.util.List<BandmemberDTO> copy(BandmemberDTO item, int copies);
}
