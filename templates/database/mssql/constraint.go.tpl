{{- $pkList := getPrimaryAttributes}}
ALTER TABLE [{{getNameSpace}}].[{{getCamelCaseName $.Name}}] ADD CONSTRAINT [PK_{{getCamelCaseName $.Name}}] PRIMARY KEY NONCLUSTERED ({{- range $index,$attribute := $pkList }}{{- $attribute.Name}}{{- getAttributeSeparator $index  $pkList}}{{- end}})
GO
{{- $entityMap := getReferences}}
{{- range $entityName,$attributes := $entityMap }}
ALTER TABLE [{{getNameSpace}}].[{{getCamelCaseName $.Name}}] ADD CONSTRAINT [FK_{{getCamelCaseName $.Name}}_{{getCamelCaseName $entityName}}] FOREIGN KEY ({{- range $index,$attribute := $attributes }}{{$attribute.Name}}{{- getAttributeSeparator $index  $attributes}}{{- end}}) REFERENCES [{{getNameSpace}}].[{{getCamelCaseName $entityName}}] ({{- range $index,$attribute := $attributes }}{{$attribute.RefAttributeName}}{{- getAttributeSeparator $index $attributes}}{{- end}})
GO
{{- end}}
{{- if $.GenerateHistoryEntity}}
ALTER TABLE [PK_{{getCamelCaseName $.Name}}History] ADD PRIMARY KEY NONCLUSTERED (historyId)
GO
ALTER TABLE [{{getNameSpace}}].[{{getCamelCaseName $.Name}}History] ADD CONSTRAINT [FK_{{getCamelCaseName $.Name}}History] FOREIGN KEY (id) REFERENCES [{{getNameSpace}}].[{{getCamelCaseName $.Name}}] (id)
GO
{{- end}}

