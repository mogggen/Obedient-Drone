az boards query --wiql "SELECT [System.Id], [System.Title], [System.State], [System.CreatedBy] FROM workitems
WHERE 
  [System.CreatedDate] >= @StartOfDay('-5d') AND
  [System.CreatedBy] = 'morgan.nyman@elecosoft.com'
ORDER BY [System.Id] DESC" --output table | ConvertFrom-Json | ConvertTo-Csv | Format-Table