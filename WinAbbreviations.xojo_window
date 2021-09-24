#tag Window
Begin Window WinAbbreviations
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   "0"
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   572
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   400
   MinimumWidth    =   900
   Resizeable      =   True
   Title           =   "Abbreviations"
   Type            =   "0"
   Visible         =   True
   Width           =   900
   Begin GroupBox GroupBox1
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   473
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   11
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   60
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   225
      Begin Listbox LBSets
         AllowAutoDeactivate=   True
         AllowAutoHideScrollbars=   True
         AllowExpandableRows=   False
         AllowFocusRing  =   True
         AllowResizableColumns=   False
         AllowRowDragging=   False
         AllowRowReordering=   False
         Bold            =   False
         ColumnCount     =   1
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   22
         DropIndicatorVisible=   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         GridLinesHorizontalStyle=   "0"
         GridLinesVerticalStyle=   "0"
         HasBorder       =   True
         HasHeader       =   True
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         HeadingIndex    =   -1
         Height          =   449
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         InitialValue    =   "Abbreviation Sets"
         Italic          =   False
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         RequiresSelection=   False
         RowSelectionType=   "0"
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   72
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   208
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
   End
   Begin GroupBox GB1
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   477
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   244
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   56
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   300
      Begin LBPossibilityDisplayer LBAbbreviations
         AllowAutoDeactivate=   True
         AllowAutoHideScrollbars=   True
         AllowExpandableRows=   False
         AllowFocusRing  =   True
         AllowResizableColumns=   False
         AllowRowDragging=   False
         AllowRowReordering=   False
         Bold            =   False
         ColumnCount     =   2
         ColumnWidths    =   "*,0"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   40
         DropIndicatorVisible=   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   0
         GridLinesHorizontalStyle=   "0"
         GridLinesVerticalStyle=   "0"
         HasBorder       =   True
         HasHeader       =   False
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         HeadingIndex    =   -1
         Height          =   384
         Index           =   -2147483648
         InitialParent   =   "GB1"
         InitialValue    =   ""
         Italic          =   False
         Left            =   254
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         RequiresSelection=   False
         RowSelectionType=   "0"
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   137
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   279
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Label Label2
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GB1"
         Italic          =   False
         Left            =   254
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlignment   =   "3"
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   104
         Transparent     =   False
         Underline       =   False
         Value           =   "Set Title:"
         Visible         =   True
         Width           =   83
      End
      Begin TextField EDSetTitle
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "GB1"
         Italic          =   False
         Left            =   346
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   103
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Value           =   ""
         Visible         =   True
         Width           =   187
      End
      Begin TextField EDFileName
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "GB1"
         Italic          =   False
         Left            =   346
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   72
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Value           =   ".abv"
         Visible         =   True
         Width           =   187
      End
      Begin Label Label1
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GB1"
         Italic          =   False
         Left            =   254
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlignment   =   "3"
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   73
         Transparent     =   False
         Underline       =   False
         Value           =   "File Name:"
         Visible         =   True
         Width           =   83
      End
   End
   Begin GroupBox GB2
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   477
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   554
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   56
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   335
      Begin TextField EDAbbreviation
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "GB2"
         Italic          =   False
         Left            =   650
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   72
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Value           =   ""
         Visible         =   True
         Width           =   230
      End
      Begin TextField EDDescription
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "GB2"
         Italic          =   False
         Left            =   650
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   103
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Value           =   ""
         Visible         =   True
         Width           =   230
      End
      Begin TextArea EDContent
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   True
         AllowStyledText =   True
         AllowTabs       =   True
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         Height          =   386
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "GB2"
         Italic          =   False
         Left            =   564
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Multiline       =   True
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   136
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Value           =   ""
         Visible         =   True
         Width           =   316
      End
      Begin Label Label4
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GB2"
         Italic          =   False
         Left            =   574
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlignment   =   "3"
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   104
         Transparent     =   False
         Underline       =   False
         Value           =   "Description:"
         Visible         =   True
         Width           =   64
      End
      Begin Label Label3
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GB2"
         Italic          =   False
         Left            =   564
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlignment   =   "3"
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   73
         Transparent     =   False
         Underline       =   False
         Value           =   "Abbreviation:"
         Visible         =   True
         Width           =   74
      End
   End
   Begin Label STPath
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   11.0
      FontUnit        =   0
      Height          =   36
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   162
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &c79797900
      Tooltip         =   ""
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Value           =   "None"
      Visible         =   True
      Width           =   626
   End
   Begin PushButton BTNChange
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Change..."
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   11.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton BTNNewSet
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "New Set"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   11.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   162
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   539
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   66
   End
   Begin PushButton BTNDeleteSet
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Delete"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   11.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   539
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   60
   End
   Begin Label STPathLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   11.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "3"
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   11
      Transparent     =   False
      Underline       =   False
      Value           =   "Abbreviations Path:"
      Visible         =   True
      Width           =   130
   End
   Begin PushButton BTNNewAbbreviation
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "New Abbreviation"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   11.0
      FontUnit        =   0
      Height          =   19
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   414
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   540
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   119
   End
   Begin PushButton BTNDeleteAbbreviation
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Delete"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   11.0
      FontUnit        =   0
      Height          =   19
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   254
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   540
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   60
   End
   Begin PushButton BTNSave
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Save"
      Default         =   True
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   809
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   539
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  LoadListboxes
		End Sub
	#tag EndEvent

	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  if CheckHasUnsavedChanges(true) then
		    Return true
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  LoadInitialData
		  self.centerMe
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddAbbreviationToList(c as ClassAttribute)
		  if c = nil then
		    Return
		  end if
		  
		  //check to update existing row
		  dim existingRowIndex as integer = -1
		  for i as integer = 0 to LBAbbreviations.RowCount - 1
		    if ClassAttribute(LBAbbreviations.RowTagAt(i)).RandomID = c.RandomID then
		      existingRowIndex = i
		      exit
		    end if
		  next
		  
		  if existingRowIndex = -1 then
		    LBAbbreviations.AddRow("")
		    existingRowIndex = LBAbbreviations.LastAddedRowIndex
		  end if
		  
		  if existingRowIndex <> -1 and existingRowIndex < LBAbbreviations.RowCount then
		    LBAbbreviations.CellValueAt(existingRowIndex,0) = c.AttributeName
		    LBAbbreviations.CellValueAt(existingRowIndex,1) = c.ExtraInfo.Lookup("description","")
		    LBAbbreviations.RowTagAt(existingRowIndex) = c
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckHasUnsavedChanges(showWarning as Boolean = true) As Boolean
		  if HasUnsavedChanges and showWarning then
		    dim msgd as new MessageDialog
		    dim msgb as MessageDialogButton
		    
		    msgd.Message="Would you like to save the changes made to your abbreviation set(s)?"
		    
		    
		    msgd.ActionButton.Caption = "Save"
		    msgd.CancelButton.Caption = "Cancel"
		    msgd.CancelButton.Visible = true
		    msgd.AlternateActionButton.Caption = "Don't Save"
		    msgd.AlternateActionButton.Visible = true
		    
		    msgb=msgd.ShowModal
		    select case msgb
		    case msgd.ActionButton
		      SaveChanges
		    case msgd.AlternateActionButton
		      Return false
		    end select
		  end if
		  
		  Return HasUnsavedChanges
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EditSelectedAbbreviation()
		  LoadListboxes(2)
		  EDAbbreviation.SetFocus
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EditSelectedSet()
		  LoadListboxes(1)
		  EDFileName.SetFocus
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSelectedSetData() As String
		  dim ss as string
		  dim lb as string = chr(13) + chr(13)
		  
		  ss = ss + "<abbreviationSetTitle>" + EDSetTitle.Text + "<abbreviationSetTitle>" + lb
		  
		  for i as integer = 0 to LBAbbreviations.RowCount - 1
		    dim cc as ClassAttribute = LBAbbreviations.RowTagAt(i)
		    ss = ss + cc.ExportAbbreviationText + lb
		  next
		  
		  Return ss
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadInitialData()
		  STPath.Text = if(app.LastAbbreviationsPath = "", "None", app.LastAbbreviationsPath)
		  LoadedAbbreviationsDirectory = app.CurrentAbbreviationsFolder
		  
		  TempData = new Dictionary
		  
		  if app.CurrentAbbreviationsFolder <> nil and app.CurrentAbbreviationsFolder.Exists and app.CurrentAbbreviationsFolder.IsFolder then
		    for i as integer = 0 to app.CurrentAbbreviationsFolder.Count - 1
		      dim f as FolderItem = app.CurrentAbbreviationsFolder.ChildAt(i)
		      if f.Exists and f.Name.Right(4) = ".abv" then
		        dim textin as TextInputStream = TextInputStream.Open(f)
		        if textin <> nil then
		          TempData.Value(f.Name) = new pair(system.Random.InRange(0,1000000000), textin.ReadAll)
		          textin.close
		        end if
		      end if
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadListboxes(specificBox as integer = -1)
		  if isLoading then
		    Return
		  end if
		  
		  isLoading = true
		  
		  dim selectedSetTag, selectedAbbreviationTag as variant
		  dim previousFocus as RectControl = self.Focus
		  dim previousFocusSelectionStart as integer
		  if previousFocus <> nil and previousFocus isa TextField then
		    previousFocusSelectionStart = TextField(previousFocus).SelectionStart
		  end if
		  
		  if LBSets.SelectedRowIndex <> -1 then
		    selectedSetTag = LBSets.RowTagAt(LBSets.SelectedRowIndex)
		  end if
		  
		  if LBAbbreviations.SelectedRowIndex <> -1 then
		    selectedAbbreviationTag = LBAbbreviations.RowTagAt(LBAbbreviations.SelectedRowIndex)
		  end if
		  
		  if specificBox <= 0 then
		    //load sets
		    LBSets.RemoveAllRows
		    
		    for i as integer = 0 to TempData.KeyCount-1
		      dim v as Variant = TempData.Value(TempData.key(i))
		      if v.type = v.TypeString then
		        
		      elseif v isa pair then
		        //most likely a pair
		        LBSets.AddRow(TempData.Key(i).StringValue)
		        LBSets.RowTagAt(LBSets.LastAddedRowIndex) = pair(v).Left
		        
		        if LBSets.RowTagAt(LBSets.LastAddedRowIndex) = selectedSetTag then
		          LBSets.SelectedRowIndex = LBSets.LastAddedRowIndex
		        end if
		      end if
		    next
		  end if
		  
		  if specificBox <= 1 then
		    //load selected set
		    LBAbbreviations.RemoveAllRows
		    EDSetTitle.Text = ""
		    EDFileName.Text = ""
		    
		    if LBSets.SelectedRowIndex <> -1 then
		      dim fileName as string = LBSets.CellValueAt(LBSets.SelectedRowIndex,0)
		      dim v as Variant = TempData.Lookup(fileName,nil)
		      
		      if v isa pair then
		        dim cc as new ClassLoader
		        if cc.DoLoadAbbreviations(nil,new pair(fileName, pair(v).right)) then
		          
		          EDSetTitle.Text = cc.ExtraInfo.Lookup("abbreviationSetTitle","")
		          EDFileName.Text = fileNAme
		          
		          for each a as ClassAttribute in cc.MyAttributes
		            AddAbbreviationToList(a)
		          next
		        end if
		      end if
		    end if
		  end if
		  
		  
		  if specificBox <= 2 then
		    //load selected abbreviation for editing
		    EDAbbreviation.Text = ""
		    EDContent.Text = ""
		    EDDescription.Text = ""
		    if LBAbbreviations.SelectedRowIndex <> -1 then
		      dim c as ClassAttribute = LBAbbreviations.RowTagAt(LBAbbreviations.SelectedRowIndex)
		      EDDescription.Text = c.ExtraInfo.Lookup("description","")
		      EDContent.Text = c.ExtraInfo.Lookup("content","")
		      EDAbbreviation.Text = c.AttributeName
		    end if
		  end if
		  
		  Finally
		    isLoading = false
		    
		    if previousFocus <> nil then
		      previousFocus.SetFocus
		      
		      if previousFocus isa TextField then
		        TextField(previousFocus).SelectionStart = previousFocusSelectionStart
		        TextField(previousFocus).SelectionLength = 0
		      end if
		    end if
		    
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveChanges()
		  dim baseFolder as FolderItem = self.LoadedAbbreviationsDirectory
		  
		  if baseFolder = nil or baseFolder.Exists = false or baseFolder.IsFolder = false then
		    msgbox "The selected abbreviations folder could not be found."
		    Return
		  end if
		  
		  
		  for i as integer = 0 to TempData.KeyCount - 1
		    dim v as variant = TempData.Value(TempData.key(i))
		    dim f as FolderItem = baseFolder.Child(TempData.key(i))
		    if v.Type = Variant.TypeString and v = "deleted" then
		      //delete the file
		      f.Delete
		    elseif v isa pair then
		      dim textOut as TextOutputStream = TextOutputStream.create(f)
		      if textOut <> nil then
		        textOut.Write(pair(v).Right)
		        textOut.Close
		      end if
		    end if
		  next
		  
		  
		  HasUnsavedChanges = false
		  app.LoadProjectFolder(false,2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateAbbreviation()
		  if isLoading then
		    Return
		  end if
		  
		  if LBAbbreviations.SelectedRowIndex = -1 then
		    Return
		  end if
		  
		  dim myAttribute as ClassAttribute = LBAbbreviations.RowTagAt(LBAbbreviations.SelectedRowIndex)
		  
		  dim previousID as integer = -1
		  if myAttribute <> nil then
		    previousID = myAttribute.RandomID
		  end if
		  
		  myAttribute = new ClassAttribute(ClassAttribute.TypeAbbreviation,nil,0,EDAbbreviation.Text,EDDescription.Text,EDContent.Text)
		  
		  if previousID <> -1 then
		    myAttribute.RandomID = previousID
		  end if
		  
		  AddAbbreviationToList(myAttribute)
		  UpdateSet(true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateSet(isFromAbbreviationUpdate as Boolean = false)
		  //saves all data for currently selected set to memory
		  
		  if isLoading then
		    Return
		  end if
		  
		  if LBSets.SelectedRowIndex = -1 then
		    Return
		  end if
		  
		  
		  dim previousName as string = LBSets.CellValueAt(LBSets.SelectedRowIndex,0)
		  dim previousData as variant = TempData.Lookup(previousName,nil)
		  dim previousID as integer = -1
		  if previousData.Type = Variant.TypeString then
		    //probably deleted
		  elseif previousData isa Pair then
		    previousID = pair(previousData).Left
		  end if
		  
		  if previousID = -1 then
		    previousID = system.Random.InRange(0,1000000000)
		  end if
		  
		  dim newName as string = EDFileName.Text
		  if previousName <> newName then
		    TempData.Value(previousName) = "deleted"
		  end if
		  
		  LBSets.CellValueAt(LBSets.SelectedRowIndex,0) = newName
		  TempData.Value(newName) = new pair(previousID, GetSelectedSetData)
		  HasUnsavedChanges = true
		  
		  if isFromAbbreviationUpdate = false then
		    LoadListboxes
		  end if
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mHasUnsavedChanges
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHasUnsavedChanges = value
			  
			  self.Changed = value
			  BTNSave.Enabled = value
			  
			End Set
		#tag EndSetter
		HasUnsavedChanges As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		isLoading As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		LastAcceptedFileName As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LoadedAbbreviationsDirectory As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHasUnsavedChanges As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			key is file name
			value is a pair, left = random ID, right = file data
			value is "deleted" if the set needs to be deleted
		#tag EndNote
		TempData As Dictionary
	#tag EndProperty


#tag EndWindowCode

#tag Events LBSets
	#tag Event
		Sub Change()
		  BTNDeleteSet.Enabled = me.SelectedRowCount > 0
		  GB1.Enabled = me.SelectedRowCount > 0
		  EditSelectedSet
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LBAbbreviations
	#tag Event
		Sub Change()
		  BTNDeleteAbbreviation.Enabled = me.SelectedRowCount > 0
		  gb2.Enabled = me.SelectedRowCount > 0
		  EditSelectedAbbreviation
		End Sub
	#tag EndEvent
	#tag Event
		Function WantsIsForAbbreviations() As Boolean
		  Return true
		End Function
	#tag EndEvent
	#tag Event
		Function WantsSearchDepth() As integer
		  return 1
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events EDSetTitle
	#tag Event
		Sub TextChange()
		  UpdateSet
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EDFileName
	#tag Event
		Sub TextChange()
		  if me.Text="" then
		    Return
		  end if
		  
		  if me.Text.right(4) <> ".abv" then
		    if LastAcceptedFileName <> "" and me.text.length > 4 then
		      me.Text = LastAcceptedFileName
		    else
		      dim fixedName as string = me.Text + ".abv"
		      me.Text = fixedName
		      me.SelectionStart = fixedName.length - 4
		      LastAcceptedFileName = fixedName
		    end if
		    Return
		  else
		    LastAcceptedFileName = me.Text
		  end if
		  
		  UpdateSet
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EDAbbreviation
	#tag Event
		Sub TextChange()
		  UpdateAbbreviation
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EDDescription
	#tag Event
		Sub TextChange()
		  UpdateAbbreviation
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EDContent
	#tag Event
		Sub TextChange()
		  UpdateAbbreviation
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BTNChange
	#tag Event
		Sub Action()
		  app.SelectAbbreviationsFolder
		  if CheckHasUnsavedChanges = false then
		    LoadInitialData
		    LoadListboxes
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BTNNewSet
	#tag Event
		Sub Action()
		  dim newName as string
		  dim i as integer
		  do
		    i = i + 1
		    newName = "New Set "+cstr(i)+".abv"
		  loop until TempData.HasKey(newName) = false
		  
		  dim randomID as integer = system.Random.InRange(0,1000000000)
		  TempData.Value(newName) = new pair(randomID,"")
		  
		  LBSets.AddRow(newName)
		  LBSets.RowTagAt(LBSets.LastAddedRowIndex) = randomID
		  LBSets.SelectedRowIndex = LBSets.LastAddedRowIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BTNDeleteSet
	#tag Event
		Sub Action()
		  if LBSets.SelectedRowIndex <> -1 then
		    TempData.Value(LBSets.CellValueAt(LBSets.SelectedRowIndex,0)) = "deleted"
		    LBSets.RemoveRowAt(LBSets.SelectedRowIndex)
		    HasUnsavedChanges = true
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BTNNewAbbreviation
	#tag Event
		Sub Action()
		  dim cc as new ClassAttribute(ClassAttribute.TypeAbbreviation,nil,0,"","New Abbreviation","")
		  AddAbbreviationToList(cc)
		  LBAbbreviations.SelectedRowIndex = LBAbbreviations.LastAddedRowIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BTNDeleteAbbreviation
	#tag Event
		Sub Action()
		  for i as integer = LBAbbreviations.RowCount DownTo 0
		    if LBAbbreviations.Selected(i) then
		      LBAbbreviations.RemoveRowAt(i)
		    end if
		  next
		  
		  UpdateSet
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BTNSave
	#tag Event
		Sub Action()
		  SaveChanges
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
