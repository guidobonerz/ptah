{{- $attributeList := getAtt  ributes}}
if object_id(N'[{{getNameSpace}}].[{{getCamelCaseName $.Name}}]','U') is null
BEGIN
CREATE TABLE [{{getNameSpace}}].[{{getCamelCaseName $.Name}}](
	{{- range $index,$attribute := $attributeList }}
		[{{ $attribute.Name }}] {{ getDataType $attribute }}{{- if needSize $attribute true}}({{getSize $attribute}}){{- end}}
		{{- if $attribute.AutoId}} IDENTITY(1,1){{- end}}
		{{- if $attribute.AllowNull}} NULL{{- else}} NOT NULL{{- end}}
		{{- if $attribute.DefaultValue}} DEFAULT ({{$attribute.DefaultValue}}){{- end}}
		{{- getAttributeSeparator $index $attributeList}}
	{{- end}}
) ON [PRIMARY]
END
GO

{{- if $.GenerateHistoryEntity}}
if object_id(N'[{{getNameSpace}}].[{{getCamelCaseName $.Name}}History]','U') is null
BEGIN
CREATE TABLE [{{getNameSpace}}].[{{getCamelCaseName $.Name}}History](
	    historyId bigint IDENTITY(1,1)
	{{- range $index,$attribute := $attributeList }}
		[{{ $attribute.Name }}] {{ getDataType $attribute }}{{- if needSize $attribute true}}({{getSize $attribute}}){{- end}}
		{{- if $attribute.PrimaryKey}} NOT NULL{{- else}} NULL{{- end}}
		{{- getAttributeSeparator $index $attributeList}}
	{{- end}}
) ON [PRIMARY]
END
GO
{{- end}}
