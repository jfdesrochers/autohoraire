#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode 2
DetectHiddenWindows, On

Menu, PQuart, Add, Associés, MenuHandler
Menu, PQuart, Disable, Associés
Menu, PQuart, Add
Menu, PQuart, Add, Semaine, MenuHandler
Menu, PQuart, Disable, Semaine
Menu, PQuart, Add, 730-16, MenuHandler
Menu, PQuart, Add, 750-17, MenuHandler
Menu, PQuart, Add, 750-1730, MenuHandler
Menu, PQuart, Add, 750-12, MenuHandler
Menu, PQuart, Add, 750-13, MenuHandler
Menu, PQuart, Add, 750-14, MenuHandler
Menu, PQuart, Add, 9-17, MenuHandler
Menu, PQuart, Add, 9-18, MenuHandler
Menu, PQuart, Add, 10-19, MenuHandler
Menu, PQuart, Add, 12-2115, MenuHandler
Menu, PQuart, Add, 13-2115, MenuHandler
Menu, PQuart, Add, 14-2115, MenuHandler
Menu, PQuart, Add, 16-2115, MenuHandler
Menu, PQuart, Add, 17-2115, MenuHandler
Menu, PQuart, Add, 1730-2115, MenuHandler
Menu, PQuart, Add, Weekend, MenuHandler
Menu, PQuart, Disable, Weekend
Menu, PQuart, Add, 850-1715, MenuHandler
Menu, PQuart, Add, 850-16, MenuHandler
Menu, PQuart, Add, 950-1715, MenuHandler
Menu, PQuart, Add, 950-16, MenuHandler
Menu, PQuart, Add, 12-17, MenuHandler
Menu, PQuart, Add, Pauses, MenuHandler
Menu, PQuart, Disable, Pauses
Menu, PQuart, Add, 10-15, MenuHandler
Menu, PQuart, Add, 10-16, MenuHandler
Menu, PQuart, Add, 11-15, MenuHandler
Menu, PQuart, Add, 11-16, MenuHandler
Menu, PQuart, Add, Directeur, MenuHandler
Menu, PQuart, Disable, Directeur
Menu, PQuart, Add
Menu, PQuart, Add, 6-15, MenuHandler
Menu, PQuart, Add, 7-16, MenuHandler
Menu, PQuart, Add, 730-17, MenuHandler
Menu, PQuart, Add, 8-17, MenuHandler
Menu, PQuart, Add, 12-21, MenuHandler
Menu, PQuart, Add, 830-1730, MenuHandler
Menu, PQuart, Add, 930-1730, MenuHandler

return

MenuHandler:
  itm := A_ThisMenuItem
  query = -
  qStart := SubStr(itm, 1, InStr(itm, query)-1)
  qEnd := SubStr(itm, InStr(itm, query)+1)
  if (qStart > 100)
    qtStart := qStart / 100
  else
    qtStart := qStart
  if (qEnd > 100)
    qtEnd := qEnd / 100
  else
    qtEnd := qEnd
  tot := qtEnd - qtStart
  if (qtStart >= 12) && (tot >= 8.70)
  {
    pStart=16
    pEnd=17
  } else 
  if (qtStart >= 12) && (tot >= 5.5)
  {
    pStart=16
    pEnd=1630
  } else
  if (qtStart < 12) && (tot >= 8.70)
  {
    pStart=12
    pEnd=13
  } else 
  if (qtStart < 12) && (tot >= 5.5)
  {
    pStart=12
    pEnd=1230
  } else {
    pStart=0
    pEnd=0
  }

  WinActivate, Ajouter un quart
  if WinActive("Ajouter un quart")
  {
    Sleep 100
    Send %qStart%
    Sleep 100
    Send {Tab}
    Sleep 100
    if (pStart > 0)
    {
      Send %pStart%
      Sleep 100
      Send +{Tab}
      Sleep 100
      Send +{Tab}
      Sleep 100
      Send +{Tab}
      Sleep 100
      Send +{Tab}
      Sleep 100
      Send {Space}
      Sleep 100
      Send {Tab}
      Sleep 100
      Send {Tab}
      Sleep 100
      Send p
      Sleep 100
      Send {Tab}
      Sleep 100
      Send {Tab}
      Sleep 100
      Send %pEnd%
      Sleep 100
      Send +{Tab}
      Sleep 100
      Send +{Tab}
      Sleep 100
      Send +{Tab}
      Sleep 100
      Send +{Tab}
      Sleep 100
      Send {Space}
      Sleep 100
      Send {Tab}
      Sleep 100
      Send {Tab}
      Sleep 100
      Send n
      Sleep 100
      Send {Tab}
      Sleep 100
      Send {Tab}
      Sleep 100
    }
    Send %qEnd%
  }
return

MButton::
  if WinActive("Ajouter un quart") {
    MouseGetPos mx, my
    Menu, PQuart, Show, %mx%, %my%
  }
return