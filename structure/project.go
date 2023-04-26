package structure

type Project struct {
	NameSpace                  string   `json:"nameSpace"`
	Entities                   []Entity `json:"entity"`
	TargetLanguage             string   `json:"targetLanguage"` // default java
	TargetDatabase             string   `json:"targetDatabase"` // default java
	GenerateEntityModel        bool     `json:"generateEntityModel"`
	GenerateBackendCode        bool     `json:"generateBackendCode"`
	GenerateDatabaseProcedures bool     `json:"generateDatabaseProcedures"`
	ChildProjectName           []string `json:"childProjectName"`
}

type Entity struct {
	Name                  string      `json:"name"`
	Schema                string      `json:"schema"`
	GenerateHistoryEntity bool        `json:"generateHistoryEntity"`
	AddDefaultAttributes  bool        `json:"addDefaulAttributes"`
	Attributes            []Attribute `json:"attribute"`
}

type Attribute struct {
	Name         string `json:"name"`
	Type         string `json:"type"`
	DefaultValue string `json:"defaultValue"`
	AllowNull    bool   `json:"allowNull"`
	AutoId       bool   `json:"autoId"`
}
