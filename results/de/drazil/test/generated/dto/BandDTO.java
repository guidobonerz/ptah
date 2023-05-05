/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/

package de.drazil.test.generated.dto;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@JsonAutoDetect(getterVisibility = JsonAutoDetect.Visibility.NONE)
@Table(name = "[Band]", schema = "dto")
public class BandDTO implements Serializable {

    private static final long serialVersionUID = 219177911L;
    @Id
    @JsonProperty("id")
    @Column(name = "[id]", nullable = false)
    private java.lang.Long id;
    
    
    @JsonProperty("name")
    @Column(name = "[name]", nullable = false)
    private java.lang.String name;
    
    
}
