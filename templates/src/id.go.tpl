package {{getFullNameSpace}};

{{- $primaryAttributes := getPrimaryAttributes}}
{{- $primaryAttributeTypes := getDataTypes $primaryAttributes }}
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
@Embeddable
@JsonAutoDetect(getterVisibility = JsonAutoDetect.Visibility.NONE)
public class {{getObjectName "id"}} implements Serializable {
    
     private static final long serialVersionUID = {{getUid}}L;
    
    {{- range $index,$attribute := $primaryAttributes }}
    @JsonProperty("{{$attribute.Name}}")
    @Column(name = "[{{$attribute.Name}}]", nullable = {{- if $attribute.AllowNull}} true{{- else}} false{{- end}})
    private {{ getDataType $attribute }} {{$attribute.Name}};
    {{ end}}
}
