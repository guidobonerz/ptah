{{- $pkList := getPrimaryAttributes}}
ALTER TABLE [{{getNameSpace}}].[{{getCamelCaseName $.Name}}] ADD CONSTRAINT [PK_{{getCamelCaseName $.Name}}] PRIMARY KEY NONCLUSTERED ({{- range $index,$attribute := $pkList }}{{- $attribute.Name}}{{- end}})
GO
{{- if $.GenerateHistoryEntity}}
ALTER TABLE [PK_{{getCamelCaseName $.Name}}History] ADD PRIMARY KEY NONCLUSTERED (historyId)
{{- end}}
GO
{{- $entityMap := getReferences}}
{{- range $entityName,$attributes := $entityMap }}
ALTER TABLE [{{getNameSpace}}].[{{getCamelCaseName $.Name}}] ADD CONSTRAINT [FK_{{getCamelCaseName $.Name}}_{{getCamelCaseName $entityName}}] FOREIGN KEY ({{- range $index,$attribute := $attributes }}{{$attribute.Name}}{{- getArgumentSeparator $index  $attributes}}{{- end}}) REFERENCES [{{getNameSpace}}].[{{getCamelCaseName $entityName}}] ({{- range $index,$attribute := $attributes }}{{$attribute.RefAttribute}}{{- getArgumentSeparator $index $attributes}}{{- end}})
GO
{{- end}}
ALTER TABLE [{{getNameSpace}}].[{{getCamelCaseName $.Name}}] ADD CONSTRAINT [FK_{{getCamelCaseName $.Name}}History] FOREIGN KEY (id) REFERENCES [{{getNameSpace}}].[{{getCamelCaseName $.Name}}] (id)
GO

