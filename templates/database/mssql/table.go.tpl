{{- $pkList := getPrimaryAttributes}}
if object_id(N'[{{getNameSpace}}].[{{getCamelCaseName $.Name}}]','U') is null
BEGIN
CREATE TABLE [{{getNameSpace}}].[{{getCamelCaseName $.Name}}](
	{{- range $index,$attribute := $.Attributes }}
		{{ $attribute.Name }} {{ getDataType $attribute }}{{- if hasSize $attribute}}({{getSize $attribute}}){{- end}}
		{{- if $attribute.AutoId}} IDENTITY(1,1){{- end}}
		{{- if $attribute.AllowNull}} NULL{{- else}} NOT NULL{{- end}}
		{{- if $attribute.DefaultValue}} DEFAULT ({{$attribute.DefaultValue}}){{- end}}
		{{- getArgumentSeparator $index $.Attributes}}
	{{- end}}
		CONSTRAINT [PK_{{getCamelCaseName $.Name}}] PRIMARY KEY NONCLUSTERED ({{- range $index,$attribute := $pkList }}{{- $attribute.Name}}{{- end}})
	{{- $entityMap := getReferences}}
	{{- range $entityName,$attributes := $entityMap }}
		CONSTRAINT [FK_{{getCamelCaseName $.Name}}_{{getCamelCaseName $entityName}}] FOREIGN KEY ({{- range $index,$attribute := $attributes }}{{$attribute.Name}}{{- getArgumentSeparator $index  $attributes}}{{- end}}) REFERENCES [{{getNameSpace}}].[{{getCamelCaseName $entityName}}] ({{- range $index,$attribute := $attributes }}{{$attribute.RefAttribute}}{{- getArgumentSeparator $index $attributes}}{{- end}})
	{{- end}}
) ON [PRIMARY]
END
GO

{{- if $.GenerateHistoryEntity}}
if object_id(N'[{{getNameSpace}}].[{{getCamelCaseName $.Name}}History]','U') is null
BEGIN
CREATE TABLE [{{getNameSpace}}].[{{getCamelCaseName $.Name}}History](
	    historyId bigint IDENTITY(1,1)
	{{- range $index,$attribute := $.Attributes }}
		{{ $attribute.Name }} {{ getDataType $attribute }}{{- if hasSize $attribute}}({{getSize $attribute}}){{- end}}
		{{- if $attribute.PrimaryKey}} NOT NULL{{- else}} NULL{{- end}}
		{{- getArgumentSeparator $index $.Attributes}}
	{{- end}}
		CONSTRAINT [PK_{{getCamelCaseName $.Name}}History] PRIMARY KEY NONCLUSTERED (historyId)
		CONSTRAINT [FK_{{getCamelCaseName $.Name}}History] FOREIGN KEY (id) REFERENCES [{{getNameSpace}}].[{{getCamelCaseName $.Name}}] (id)
) ON [PRIMARY]
END
GO
{{- end}}
