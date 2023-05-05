{{- $pkList := getPrimaryAttributes}}
if object_id(N'[{{getNameSpace}}].[{{getObjectName "procedure"}}]','P') is not null DROP PROCEDURE [{{getNameSpace}}].[{{getObjectName "procedure"}}] 
GO
CREATE PROCEDURE HANDLE_PROJECT
(
	@action nvarchar(30),
    {{- range $index,$attribute := $.Attributes }}
	{{ $attribute.Name }} {{getDataType $attribute }}{{- if hasSize $attribute}}({{getSize $attribute}}){{- end}}{{- getArgumentSeparator $index $.Attributes}}
	{{- end}}
)
AS
BEGIN
	SET NOCOUNT ON
	declare @currentDate datetime
	declare @newId bigint

	set @currentDate = getdate()
	
	begin tran
	if  (@action ='ADD')
		begin
			
			insert into [{{getNameSpace}}].[{{getObjectName "table"}}]({{- range $index,$attribute := $.Attributes }}{{ $attribute.Name }}{{- getArgumentSeparator $index $.Attributes}}{{- end}}) 
			values ({{- range $index,$attribute := $.Attributes }}@{{ $attribute.Name }}{{- getArgumentSeparator $index $.Attributes}}{{- end}}) 
			set @newId=@@IDENTITY
		end
	else
	if (@action ='UPDATE')
		begin
		update [{{getNameSpace}}].[{{getObjectName "table"}}] set {{ range $index,$attribute := $.Attributes }}[{{ $attribute.Name }}]=@{{ $attribute.Name }}{{- getArgumentSeparator $index $.Attributes}}{{- end}}
		where id=@id;
		set @newId=@id
		end
		
	else if (@action ='DELETE')
		begin
			set @newId=-2
			update  [{{getNameSpace}}].[{{getObjectName "table"}}] set deleted=1 where id=@id
		end
	commit
	select @newId [NEWID]	
END
GO