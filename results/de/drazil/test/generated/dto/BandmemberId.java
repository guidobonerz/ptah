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
@Embeddable
@JsonAutoDetect(getterVisibility = JsonAutoDetect.Visibility.NONE)
public class BandmemberId implements Serializable {
    
     private static final long serialVersionUID = 1739602261L;
    @JsonProperty("musicianId")
    @Column(name = "[musicianId]", nullable = false)
    private java.lang.Long musicianId;
    
    @JsonProperty("bandId")
    @Column(name = "[bandId]", nullable = false)
    private java.lang.Long bandId;
    
}
