DECLARE @str AS VARCHAR(200) = 'SOME_STRING'

SELECT
	S.name AS [Schema], 
	o.name AS [Object], 
	o.type_desc AS [Object_Type], 
	C.text AS [Object_Definition]
FROM 
	sys.all_objects O 
	INNER JOIN sys.schemas S ON O.schema_id = S.schema_id
	INNER JOIN sys.syscomments C ON O.object_id = C.id
WHERE 
	S.schema_id NOT IN (3,4) -- avoid searching in sys and INFORMATION_SCHEMA schemas
	AND C.text LIKE '%' + @str + '%' 
ORDER BY
	[Schema]
