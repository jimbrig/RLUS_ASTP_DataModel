Attribute VB_Name="modDialogs"

Option Explicit

Private Const MODULE_NAME As String = "modDialogs"

Public Function DialogRangeSelector( _
    Optional PromptText As String = "Enter Text:", _
    Optional TitleText As String = "Text Input" _
) As Range
    
    Dim DefaultRng As Range
    Dim SelectedRng As Range
    
    If TypeName(Selection) = "Range" Then
        Set DefaultRng = Selection
    Else
        Set DefaultRng = ActiveCell
    End If
    
    On Error Resume Next
    
    Set SelectedRng = Application.InputBox(Prompt:=PromptText, Title:=TitleText, Default:=DefaultRng.Address, Type:=8)
    
    On Error GoTo 0
    
    If SelectedRng Is Nothing Then GoTo ExitProc
    
    Set DialogRangeSelector = SelectedRng
    
    
ExitProc:
    Set DefaultRng = Nothing
    Set SelectedRng = Nothing
    If DialogRangeSelector Is Nothing Then Set DialogRangeSelector = SelectedRng
    Exit Function
    
End Function

Public Function DialogInputBoxText( _
    Optional PromptText As String = "Enter Text:", _
    Optional TitleText As String = "Text Input", _
    Optional DefaultVal As String = "" _
) As String

    DialogInputBoxText = Application.InputBox( _
        Prompt:=PromptText, _
        Title:=TitleText, _
        Default:=DefaultVal, _
        Type:=2
    )

End Function