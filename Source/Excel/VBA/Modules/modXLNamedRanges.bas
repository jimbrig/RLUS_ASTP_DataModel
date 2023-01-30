Attribute VB_Name="modXLNamedRanges"

Option Explicit

Private Const MODULE_NAME As String = "modXLNamedRanges"

Const WB_NAMED_RNG_DEFAULT_PREFIX As String = "Rng_"
Const WB_NAMED_RNG_VAL_DATE As String = "Rng_ValDate"

Private Function CreateNamedRange( _
    NameText As String, _ 
    NameRng As Range, _
    Optional Comment As String = "" _
) As Name

    Dim newName As Name
    Set newName = ActiveWorkbook.Names.Add(NameText, NameRng.Address)

    If Comment <> "" Then
        With newName
            .Comment = Comment
        End With
    End If

    Set CreateNamedRange = newName
    Set newName = Nothing

End Function

Private Function NamedRangeExists(NamedRange As String) As Boolean
    
    Dim n As Name
    
    NamedRangeExists = False
    
    For Each n In ThisWorkbook.Names
        If UCase(n.Name) = UCase(NamedRange) Then
            NamedRangeExists = True
            Set n = Nothing
            Exit Function
        End If
    Next n

    Set n = Nothing
    
End Function

Public Sub CreateNamedRangeDynamic(Optional NameText As String = "")
    
    Dim Rng As Range
    Dim Comment As String
    
    If IsMissing(NameText) Or NameText = "" Then 
        NameText = DialogInputBoxText("Enter Named Range Name:", "Named Range", "rng...")
    End If

    Comment = DialogInputBoxText("Enter NamedRange Comment:", "New Named Range")
    
    Set Rng = DialogRangeSelector("Select Named Range Range:", "Named Range")
    
    Dim newName As Name
    Set newName = CreateNamedRange(NameText, Rng, Comment) 'ThisWorkbook.Names.Add Name:=NameText, RefersTo:=Rng
        
    Set Rng = Nothing
    Set newName = Nothing
    
End Sub
