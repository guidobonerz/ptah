if object_id(N'[{{getNameSpace}}].[{{getTitleCaseName $.Name}}]','U') is null
BEGIN
CREATE TABLE [{{getNameSpace}}].[{{getTitleCaseName $.Name}}](
	{{- range $index,$attribute := $.Attributes }}
		{{ $attribute.Name }} {{ getDataType $attribute.DataType }}
		{{- if $attribute.AutoId}} IDENTITY(1,1){{- end}}
		{{- if $attribute.AllowNull}} NULL{{- else}} NOT NULL{{- end}}
		{{- if $attribute.DefaultValue}} DEFAULT ({{$attribute.DefaultValue}}){{- end}}
		{{getArgumentSeparator $index}}
	{{- end}}
	CONSTRAINT [PK_{{getTitleCaseName $.Name}}] PRIMARY KEY NONCLUSTERED ({{getPrimaryKeyString}})
) ON [PRIMARY]
END
GO

{{- if $.GenerateHistoryEntity}}
if object_id(N'[{{getNameSpace}}].[{{getTitleCaseName $.Name}}History]','U') is null
BEGIN
CREATE TABLE [{{getNameSpace}}].[{{getTitleCaseName $.Name}}History](
	    historyId bigint IDENTITY(1,1)
	{{- range $index,$attribute := $.Attributes }}
		{{ $attribute.Name }} {{ getDataType $attribute.DataType }}
		{{- if $attribute.PrimaryKey}} NOT NULL{{- else}} NULL{{- end}}
		{{getArgumentSeparator $index}}
	{{- end}}
	CONSTRAINT [PK_{{getTitleCaseName $.Name}}History] PRIMARY KEY NONCLUSTERED (historyId)
	CONSTRAINT [FK_{{getTitleCaseName $.Name}}History] FOREIGN KEY (id) REFERENCES [{{getNameSpace}}].[{{getTitleCaseName $.Name}}] (id)
) ON [PRIMARY]
END
GO
{{- end}}
