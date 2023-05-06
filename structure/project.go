package structure

type Project struct {
	BaseNameSpace      string                        `json:"baseNameSpace"`
	Entities           []Entity                      `json:"entities"`
	TemplateDefinition map[string]TemplateDefinition `json:"templateDefinition"`
	MetaData           map[string]MetaData           `json:"metaData"`
	CommonAttributes   []Attribute                   `json:"commonAttributes"`
	DataGenerator      map[string]interface{}        `json:"dataGenerator"`
}

type TemplateDefinition struct {
	NameSpace   string `json:"nameSpace"`
	NamePattern string `json:"namePattern"`
	MetaData    string `json:"metaData"`
}

type MetaData struct {
	TemplateBasePath             string                        `json:"templateBasepath"`
	NamingStyle                  string                        `json:"namingStyle"`
	ArgumentSeparator            string                        `json:"argumentSeparator"`
	FileSuffix                   string                        `json:"fileSuffix"`
	AllowBundledFile             bool                          `json:"allowBundledFile"`
	EnableMultiAttributeIdOption bool                          `json:"enableMultiAttributeIdOption"`
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
	EnableCreate            bool        `json:"enableCreate"`
	EnableRead              bool        `json:"enableRead"`
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

type Attribute struct {
	Name         string `json:"name"`
	DataType     string `json:"dataType"`
	Size         int    `json:"size"`
	DefaultValue string `json:"defaultValue"`
	PrimaryKey   bool   `json:"primaryKey"`
	AllowNull    bool   `json:"allowNull"`
	AutoId       bool   `json:"autoId"`
	RefEntity    string `json:"refEntity"`
	RefAttribute string `json:"refAttribute"`
}

type Index struct {
	Name       string   `json:"name"`
	Attributes []string `json:"attributes"`
	Unique     bool     `json:"unique"`
}
