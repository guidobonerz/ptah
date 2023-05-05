package {{getFullNameSpace}};

{{- $caseName := getCamelCaseName $.Name}}

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
@Table(name = "[{{getCamelCaseName $.Name}}]", schema = "dbo")
public class {{getObjectName "dto"}} implements Serializable {

    private static final long serialVersionUID = {{getUid}}L;
    
    {{- if hasMultiplePrimaryAttriutes}}
    @EmbeddedId
    private {{ $caseName }}Id id;
    {{- else}}
    {{- range $index,$attribute := $.Attributes }}
    {{ if $attribute.PrimaryKey}}@Id{{- end}}
    @JsonProperty("{{$attribute.Name}}")
    @Column(name = "[{{$attribute.Name}}]", nullable = {{- if $attribute.AllowNull}} true{{- else}} false{{- end}})
    private {{ getDataType $attribute.DataType }} {{$attribute.Name}};
    {{ end}}
    {{ end}}
}
