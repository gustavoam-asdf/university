

exec sp_MSforeachtable '
	if ''?'' not in (''sysdiagrams'')
	begin
		select * from ?
		for json path
	end
' 