package structure

type Project struct {
	Entities            []Entity                      `yaml:"entities"`
	VirtualEntities     []VirtualEntity               `yaml:"virtualEntities"`
	CommonAttributes    []Attribute                   `yaml:"commonAttributes"`
	TemplateDefinition  map[string]TemplateDefinition `yaml:"templateDefinition"`
	MetaData            map[string]MetaData           `yaml:"metaData"`
	DataGenerator       map[string]interface{}        `yaml:"dataGenerator"`
	CommonTemplateNames []string                      `yaml:"commonTemplateNames"`
}

type TemplateDefinition struct {
	NameSpace   string `yaml:"nameSpace"`
	NamePattern string `yaml:"namePattern"`
	MetaData    string `yaml:"metaData"`
}

type MetaData struct {
	BaseNameSpace                string                        `yaml:"baseNameSpace"`
	TemplatePath                 string                        `yaml:"templatePath"`
	OutputPath                   string                        `yaml:"outputPath"`
	AttributeSeparator           string                        `yaml:"attributeSeparator"`
	FileSuffix                   string                        `yaml:"fileSuffix"`
	WriteSeparateFile            bool                          `yaml:"writeSeparateFile"`
	EnableMultiAttributeIdOption bool                          `yaml:"enableMultiAttributeIdOption"`
	TemplateProcessingOrder      []string                      `yaml:"templateProcessingOrder"`
	DataTypes                    map[string]DataTypeDefinition `yaml:"dataTypes"`
}

type DataTypeDefinition struct {
	DataType        string `yaml:"dataType"`
	NonNullDataType string `yaml:"nonNullDataType"`
	HasSize         bool   `yaml:"hasSize"`
	MaxSize         string `yaml:"maxSize"`
}

type Entity struct {
	Name                    string      `yaml:"name"`
	TemplateNames           []string    `yaml:"templateNames"`
	EnableAdd               bool        `yaml:"enableAdd"`
	EnableList              bool        `yaml:"enableList"`
	EnableUpdate            bool        `yaml:"enableUpdate"`
	EnableDelete            bool        `yaml:"enableDelete"`
	EnableSort              bool        `yaml:"enableSort"`
	EnableFilter            bool        `yaml:"enableFilter"`
	EnableSearch            bool        `yaml:"enableSearch"`
	EnablePagination        bool        `yaml:"enablePagination"`
	GenerateHistoryEntity   bool        `yaml:"generateHistoryEntity"`
	DisableCommonAttributes bool        `yaml:"disableCommonAttributes"`
	FakeDataRendererKey     string      `yaml:"fakeDataRendererKey"`
	Attributes              []Attribute `yaml:"attributes"`
	Index                   []Index     `yaml:"index"`
}

type VirtualEntity struct {
	Name             string      `yaml:"name"`
	TemplateNames    []string    `yaml:"templateNames"`
	EnableSort       bool        `yaml:"enableSort"`
	EnableFilter     bool        `yaml:"enableFilter"`
	EnableSearch     bool        `yaml:"enableSearch"`
	EnablePagination bool        `yaml:"enablePagination"`
	Attributes       []Attribute `yaml:"attributes"`
	Source           string      `yaml:"source"`
	SourceType       string      `yaml:"sourceType"` // 'text' or 'file'
}

type Attribute struct {
	Name             string `yaml:"name"`
	DataTypeKey      string `yaml:"dataTypeKey"`
	Size             int    `yaml:"size"`
	DefaultValue     string `yaml:"defaultValue"`
	PrimaryKey       bool   `yaml:"primaryKey"`
	AllowNull        bool   `yaml:"allowNull"`
	Searchable       bool   `yaml:"searchable"`
	Filterable       bool   `yaml:"filterable"`
	AutoId           bool   `yaml:"autoId"`
	RefEntityName    string `yaml:"refEntityName"`
	RefAttributeName string `yaml:"refAttributeName"`
}

type Index struct {
	Name           string   `yaml:"name"`
	AttributeNames []string `yaml:"attributeNames"`
	Unique         bool     `yaml:"unique"`
}
