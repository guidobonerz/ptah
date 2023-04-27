package structure

type Project struct {
	TargetBasePath    string   `json:"targetBasePath"`
	NameSpace         string   `json:"nameSpace"`
	Entities          []Entity `json:"entities"`
	Targets           []Target `json:"targets"`
	ChildProjectNames []string `json:"childProjectNames"`
}

type Target struct {
	Name      string     `json:"name"`
	Type      string     `json:"type"`
	Suffix    string     `json:"suffix"`
	DataTypes []DataType `json:"dataTypes"`
}
type DataType struct {
	GenericType string `json:"genericType"`
	RealType    string `json:"realType"`
	HasSize     bool   `json:"hasSize"`
	MaxSize     string `json:"maxSize"`
}

type Entity struct {
	Name                  string      `json:"name"`
	Schema                string      `json:"schema"`
	Type                  string      `json:"type"` // Table,View,StoredProcedure,Class, etc.
	EnableCreate          bool        `json:"enableCreate"`
	EnableRead            bool        `json:"enableRead"`
	EnableUpdate          bool        `json:"enableUpdate"`
	EnableDelete          bool        `json:"enableDelete"`
	GenerateHistoryEntity bool        `json:"generateHistoryEntity"`
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
