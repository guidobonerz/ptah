{{- $references := getReferences}}
{{- $referencingAttributes := index $references 0}}
{{- $referencedEntities := index $references 1}}
{{- $referencedAttributes := index $references 2}}
if object_id(N'[{{getNameSpace}}].[{{getCamelCaseName $.Name}}]','U') is null
BEGIN
CREATE TABLE [{{getNameSpace}}].[{{getCamelCaseName $.Name}}](
	{{- range $index,$attribute := $.Attributes }}
		{{ $attribute.Name }} {{ getDataType $attribute.DataType }}
		{{- if $attribute.AutoId}} IDENTITY(1,1){{- end}}
		{{- if $attribute.AllowNull}} NULL{{- else}} NOT NULL{{- end}}
		{{- if $attribute.DefaultValue}} DEFAULT ({{$attribute.DefaultValue}}){{- end}}
		{{- getArgumentSeparator $index}}
	{{- end}}
		CONSTRAINT [PK_{{getCamelCaseName $.Name}}] PRIMARY KEY NONCLUSTERED ({{getPrimaryKeyString}})
	{{- range $index,$entity := $referencedEntities }}
		CONSTRAINT [FK_{{getCamelCaseName $.Name}}_{{getCamelCaseName $entity}}] FOREIGN KEY ({{- range $index,$attribute := $referencingAttributes }}{{$attribute}} {{- end}}) REFERENCES [{{getNameSpace}}].[{{getCamelCaseName $entity}}] ({{- range $index,$attribute := $referencedAttributes }}{{$attribute}} {{- end}})
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
		{{ $attribute.Name }} {{ getDataType $attribute.DataType }}
		{{- if $attribute.PrimaryKey}} NOT NULL{{- else}} NULL{{- end}}
		{{- getArgumentSeparator $index}}
	{{- end}}
		CONSTRAINT [PK_{{getCamelCaseName $.Name}}History] PRIMARY KEY NONCLUSTERED (historyId)
		CONSTRAINT [FK_{{getCamelCaseName $.Name}}History] FOREIGN KEY (id) REFERENCES [{{getNameSpace}}].[{{getCamelCaseName $.Name}}] (id)
) ON [PRIMARY]
END
GO
{{- end}}
