/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.service;


import java.util.List;

public interface IBandmemberService {

    public BandmemberDTO getBandmemberById(java.lang.Long musicianId, java.lang.Long bandId);

    public List<BandmemberDTO> getList();

    public List<BandmemberDTO> getList(java.lang.String searchText);
    
    public List<BandmemberDTO> getList(List<Sorter> sorterList);

    public List<BandmemberDTO> getList(java.lang.String searchText, List<Sorter> sorterList);

    public List<BandmemberDTO> getList(List<Filter> filterList);

    public List<BandmemberDTO> getList(java.lang.String searchText, List<Filter> filterList);

    public List<BandmemberDTO> getList(List<Sorter> sorterList, List<Filter> filterList);

    public List<BandmemberDTO> getList(java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList);
        
    public List<BandmemberDTO> getList(int start, int limit);
    
    public List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText);
    
    public List<BandmemberDTO> getList(int start, int limit, List<Sorter> sorterList);

    public List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList);

    public List<BandmemberDTO> getList(int start, int limit, List<Filter> filterList);

    public List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, List<Filter> filterList);

    public List<BandmemberDTO> getList(int start, int limit, List<Sorter> sorterList, List<Filter> filterList);

    public List<BandmemberDTO> getList(int start, int limit, java.lang.String searchText, List<Sorter> sorterList, List<Filter> filterList);

    public long getCount();

    public long getCount(java.lang.String searchText);    

    public long getCount(List<Filter> filterList);    

    public long getCount(java.lang.String searchText, List<Filter> filterList);

    public long getCount(int start, int limit);

    public long getCount(int start, int limit, java.lang.String searchText);    

    public long getCount(int start, int limit, List<Filter> filterList);    

    public long getCount(int start, int limit, java.lang.String searchText, List<Filter> filterList);   

    public void add(List<BandmemberDTO> list) ;

    public int add(BandmemberDTO item) ;

    public int add(java.lang.Long musicianId, java.lang.Long bandId) ;
            
    public BandmemberDTO copy(BandmemberDTO item);

    public List<BandmemberDTO> copy(BandmemberDTO item, int copies);

    public int update(List<BandmemberDTO> list);

    public int update(BandmemberDTO item);

    public void delete(BandmemberDTO item);

    public void delete(List<BandmemberDTO> list);

    public void deleteById(java.lang.Long musicianId, java.lang.Long bandId);
}
