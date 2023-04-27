if object_id(N'[{{$.Schema}}].[{{$.Name}}]','U') is null
BEGIN
CREATE TABLE [{{$.Schema}}].[{{$.Name}}](
	{{- $length := len $.Attributes }} 
	{{- $length := minus $length 1 }} 
	{{- range $index,$attribute := $.Attributes }}
		{{ $attribute.Name }} {{ getDataType $attribute.DataType }}
		{{- if $attribute.AutoId}} IDENTITY(1,1){{- end}}
		{{- if $attribute.AllowNull}} NULL{{- else}} NOT NULL{{- end}}
		{{- if $attribute.DefaultValue}} DEFAULT ({{$attribute.DefaultValue}}){{- end}}
		{{- if lt $index $length}},{{- end}}
	{{- end}}
	CONSTRAINT [PK_{{$.Name}}] PRIMARY KEY NONCLUSTERED ({{getPrimaryKeyString}})
) ON [PRIMARY]
END
GO

