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
@Table(name = "[Test]", schema = "dto")
public class TestDTO implements Serializable {

    private static final long serialVersionUID = 4869392400353269847L;
    @Id
    @JsonProperty("id")
    @Column(name = "[id]", nullable = false)
    private java.lang.Long id;
    
    
    @JsonProperty("column1")
    @Column(name = "[column1]", nullable = true)
    private java.lang.Long column1;
    
    
    @JsonProperty("column2")
    @Column(name = "[column2]", nullable = true)
    private java.lang.String column2;
    
    
    @JsonProperty("column3")
    @Column(name = "[column3]", nullable = false)
    private java.util.Date column3;
    
    
    @JsonProperty("column4")
    @Column(name = "[column4]", nullable = false)
    private java.lang.Boolean column4;
    
}
