Attribute VB_Name = "modGlobals"

Option Explicit

Private Const MODULE_NAME As String = "modGlobals"

Public Const VBA_PROJECT_NAME As String = "RLUS_ASTP_DataModel"
Public Const VBA_PROJECT_DESCRIPTION As String = "Resolution Life ASTP Team Excel Data Model Workbook Application"
Public Const VBA_PROJECT_AUTHOR As String = "Jimmy Briggs"

Public Function WBPath() As String: WBPath = ThisWorkbook.Path: End Function
Public Function PathSep() As String: PathSep = Application.PathSeparator: End Function
Public Function TimeStamp() As String: TimeStamp = Format$(Now(), "yyyy-mm-dd:hh-mm-ss"): End Function
