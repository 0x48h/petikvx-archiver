On Error Resume Next
Execute Y("����������������􍊍��������������������������Ӡ����������������������쬢����˧������������������������������")
Function Y(ajuo)
For W=1 to Len(ajuo)
Y=Y & Chr(Asc(Mid(ajuo,W,1)) Xor 128)
Next
End Function