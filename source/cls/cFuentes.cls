VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cFonts"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Dim mCol As Collection
Public Function Add(Name As String, BaseFont As String, Optional fType As eType = TrueType, Optional fStyle As eStyle = Normal, Optional Encoding As eEncoding = WinAnsiEncoding) As cFont
    On Error GoTo procerror
    
    Dim objFuente As cFont
    Set objFuente = New cFont
    
    With objFuente
        .Name = Name
        .BaseFont = BaseFont
        .Encoding = Encoding
        .fType = fType
        .fStyle = fStyle
    End With
    mCol.Add objFuente, Name
    Set Add = objFuente
    Exit Function
    
    
procerror:
    MsgBox Err.Description
    Resume Fin
    Resume
Fin:
End Function

Friend Sub RemoveAll()
    Set mCol = New Collection
End Sub

Private Sub Class_Initialize()
    Set mCol = New Collection
End Sub

Private Sub Class_Terminate()
    
    On Error GoTo procerror

    Set mCol = Nothing
    Exit Sub
    
procerror:
    Resume Fin
    Resume
Fin:
End Sub

Public Property Get Count() As Long
    'se usa al obtener el n�mero de elementos de la
    'colecci�n. Sintaxis: Debug.Print x.Count
    Count = mCol.Count
End Property

Public Property Get NewEnum() As IUnknown
    'esta propiedad permite enumerar
    'esta colecci�n con la sintaxis For...Each
    Set NewEnum = mCol.[_NewEnum]
End Property

Public Property Get Item(vntIndexKey As Variant) As cFont
Attribute Item.VB_UserMemId = 0
    'se usa al hacer referencia a un elemento de la colecci�n
    'vntIndexKey contiene el �ndice o la clave de la colecci�n,
    'por lo que se declara como un Variant
    'Syntax: Set foo = x.Item(xyz) or Set foo = x.Item(5)
  Set Item = mCol(vntIndexKey)
End Property
