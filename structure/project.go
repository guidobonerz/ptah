package structure

type Project struct {
	TargetBasePath         string           `json:"targetBasePath"`
	BaseNameSpace          string           `json:"baseNameSpace"`
	Entities               []Entity         `json:"entities"`
	TemplateConfigurations []TemplateConfig `json:"templateConfigurations"`
	ChildProjectNames      []string         `json:"childProjectNames"`
}

type TemplateConfig struct {
	TemplateBasePath string                        `json:"templateBasepath"`
	NamingStyle      string                        `json:"namingStyle"`
	Suffix           string                        `json:"suffix"`
	AllowBundledFile bool                          `json:"allowBundledFile"`
	DataTypes        map[string]DataTypeDefinition `json:"dataTypes"`
	Templates        []Template                    `json:"templates"`
}

type Template struct {
	Name        string `json:"name"`
	NameSpace   string `json:"nameSpace"`
	NamePattern string `json:"namePattern"`
	Enabled     bool   `json:"enabled"`
}

type DataTypeDefinition struct {
	DataType string `json:"dataType"`
	HasSize  bool   `json:"hasSize"`
	MaxSize  string `json:"maxSize"`
}

type Entity struct {
	Name                  string      `json:"name"`
	Schema                string      `json:"schema"`
	EnableCreate          bool        `json:"enableCreate"`
	EnableRead            bool        `json:"enableRead"`
	EnableUpdate          bool        `json:"enableUpdate"`
	EnableDelete          bool        `json:"enableDelete"`
	EnableSort            bool        `json:"enableSort"`
	EnableFilter          bool        `json:"enableFilter"`
	EnableSearch          bool        `json:"enableSearch"`
	EnablePagination      bool        `json:"enablePagination"`
	GenerateHistoryObject bool        `json:"generateHistoryObject"`
	AddDefaultAttributes  bool        `json:"addDefaulAttributes"`
	Attributes            []Attribute `json:"attributes"`
}

type Attribute struct {
	Name         string `json:"name"`
	DataType     string `json:"dataType"`
	Size         string `json:"size"`
	DefaultValue string `json:"defaultValue"`
	PrimaryKey   bool   `json:"primaryKey"`
	AllowNull    bool   `json:"allowNull"`
	AutoId       bool   `json:"autoId"`
}
