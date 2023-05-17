package structure

type Project struct {
	Entities            []Entity                      `json:"entities"`
	VirtualEntities     []VirtualEntity               `json:"virtualEntities"`
	CommonAttributes    []Attribute                   `json:"commonAttributes"`
	TemplateDefinition  map[string]TemplateDefinition `json:"templateDefinition"`
	MetaData            map[string]MetaData           `json:"metaData"`
	DataGenerator       map[string]interface{}        `json:"dataGenerator"`
	CommonTemplateNames []string                      `json:"commonTemplateNames"`
}

type TemplateDefinition struct {
	NameSpace   string `json:"nameSpace"`
	NamePattern string `json:"namePattern"`
	MetaData    string `json:"metaData"`
}

type MetaData struct {
	BaseNameSpace                string                        `json:"baseNameSpace"`
	TemplateBasePath             string                        `json:"templateBasepath"`
	OutputBasePath               string                        `json:"outputBasepath"`
	AttributeSeparator           string                        `json:"attributeSeparator"`
	FileSuffix                   string                        `json:"fileSuffix"`
	WriteSeparateFile            bool                          `json:"writeSeparateFile"`
	EnableMultiAttributeIdOption bool                          `json:"enableMultiAttributeIdOption"`
	TemplateProcessingOrder      []string                      `json:"templateProcessingOrder"`
	DataTypes                    map[string]DataTypeDefinition `json:"dataTypes"`
}

type DataTypeDefinition struct {
	DataType        string `json:"dataType"`
	NonNullDataType string `json:"nonNullDataType"`
	HasSize         bool   `json:"hasSize"`
	MaxSize         string `json:"maxSize"`
}

type Entity struct {
	Name                    string      `json:"name"`
	TemplateNames           []string    `json:"templateNames"`
	EnableAdd               bool        `json:"enableAdd"`
	EnableList              bool        `json:"enableList"`
	EnableUpdate            bool        `json:"enableUpdate"`
	EnableDelete            bool        `json:"enableDelete"`
	EnableSort              bool        `json:"enableSort"`
	EnableFilter            bool        `json:"enableFilter"`
	EnableSearch            bool        `json:"enableSearch"`
	EnablePagination        bool        `json:"enablePagination"`
	GenerateHistoryEntity   bool        `json:"generateHistoryEntity"`
	DisableCommonAttributes bool        `json:"disableCommonAttributes"`
	FakeDataRendererKey     string      `json:"fakeDataRendererKey"`
	Attributes              []Attribute `json:"attributes"`
	Index                   []Index     `json:"index"`
}

type VirtualEntity struct {
	Name             string      `json:"name"`
	TemplateNames    []string    `json:"templateNames"`
	EnableSort       bool        `json:"enableSort"`
	EnableFilter     bool        `json:"enableFilter"`
	EnableSearch     bool        `json:"enableSearch"`
	EnablePagination bool        `json:"enablePagination"`
	Attributes       []Attribute `json:"attributes"`
	Source           string      `json:"source"`
	SourceType       int         `json:"sourceType"` // 0:string content ; 1:filename
}

type Attribute struct {
	Name             string `json:"name"`
	DataTypeKey      string `json:"dataTypeKey"`
	Size             int    `json:"size"`
	DefaultValue     string `json:"defaultValue"`
	PrimaryKey       bool   `json:"primaryKey"`
	AllowNull        bool   `json:"allowNull"`
	Searchable       bool   `json:"searchable"`
	Filterable       bool   `json:"filterable"`
	AutoId           bool   `json:"autoId"`
	RefEntityName    string `json:"refEntityName"`
	RefAttributeName string `json:"refAttributeName"`
}

type Index struct {
	Name           string   `json:"name"`
	AttributeNames []string `json:"attributeNames"`
	Unique         bool     `json:"unique"`
}
