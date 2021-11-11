#tag Window
Begin Window WinAutoFiller
   Backdrop        =   0
   BackgroundColor =   &c38383800
   Composite       =   False
   DefaultLocation =   "0"
   FullScreen      =   False
   HasBackgroundColor=   True
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   356
   ImplicitInstance=   False
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1789523967
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   ""
   Type            =   "7"
   Visible         =   True
   Width           =   278
   Begin TextField EDSearch
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
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   8
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &cE3F0FD00
      Tooltip         =   ""
      Top             =   41
      Transparent     =   True
      Underline       =   False
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   263
   End
   Begin LBPossibilityDisplayer LBPossible
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
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   "0"
      GridLinesVerticalStyle=   "0"
      HasBorder       =   True
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   272
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   8
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   75
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   263
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label LBFolderName
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   8
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &cA7A7A700
      Tooltip         =   ""
      Top             =   11
      Transparent     =   False
      Underline       =   False
      Value           =   "- Project"
      Visible         =   True
      Width           =   207
   End
   Begin CheckBox CHDeep
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "deep"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   10.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   220
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Search for concerns/etc in subfolders of your /app/models/ folder"
      Top             =   11
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   False
      VisualState     =   "0"
      Width           =   50
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  if app.MainWindow = self then
		    app.MainWindow = nil
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub Deactivate()
		  if ParentWindow <> nil and ChildWindow = nil then
		    self.Close
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  'dim newStyle As UInt64 = 0 //no titlebar, not resizeable
		  'if self.Resizeable then newStyle = 8 //no titlebar and resizeable
		  '
		  'soft declare sub setStyleMask lib "Cocoa.framework" selector "setStyleMask:" (id As Ptr, mask As UInt64)
		  'setStyleMask(Ptr(self.Handle), newStyle)
		  
		  
		  
		  'self.NSWindowMBS.collectionbehavior = NSWindowMBS.NSWindowCollectionBehaviorFullScreenAuxiliary + NSWindowMBS.NSWindowCollectionBehaviorMoveToActiveSpace
		  self.NSWindowMBS.collectionbehavior = NSWindowMBS.NSWindowCollectionBehaviorFullScreenAuxiliary + NSWindowMBS.NSWindowCollectionBehaviorCanJoinAllSpaces
		  
		  
		  // enable dark mode
		  dim t as string = NSAppearanceMBS.NSAppearanceNameDarkAqua
		  dim a as NSAppearanceMBS = NSAppearanceMBS.appearanceNamed(t)
		  if a <>nil then
		    NSAppearanceMBS.setCurrentAppearance a
		    NSAppearanceMBS.setAppearance(self, a)
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AttemptCloseForParent(theKeyCausingAttempt as integer = 0) As Boolean
		  if ParentWindow = nil then
		    if theKeyCausingAttempt = 27 then //escap only to close
		      app.ClearStoredInitialSearch
		      app.HideApp
		      Return true
		    else
		      Return false
		    end if
		  else
		    //ParentWindow.EDSearch.SetFocus //we don't want to do this now that it's a global floating window
		    self.close
		    Return true
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearAll()
		  CurrentSearch = ""
		  EDSearch.SetFocus
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConfirmSelection()
		  LastConfirmedSearch = mCurrentSearch
		  
		  
		  if Keyboard.AsyncShiftKey then
		    dim snippetPath as string
		    
		    if LBPossible.SelectedRowIndex <> -1 then
		      if IsForSnippets then
		        dim cc as ClassLoader = GetClassLoaderParent
		        if cc <> nil then
		          snippetPath = cc.GetSnippetPath(LBPossible.RowTagAt(LBPossible.SelectedRowIndex))
		        end if
		      elseif searchDepth = 0 then
		        dim cc as ClassLoader = LBPossible.RowTagAt(LBPossible.SelectedRowIndex)
		        if cc.ExtraInfo.Lookup("IsSnippetSet",false) = true then
		          snippetPath = cc.GetSnippetPath
		        end if
		      end if
		    end if
		    
		    if snippetPath <> "" then
		      //try to show in snippets editor
		      WinSnippets.attemptShowSnippetPath(snippetPath)
		    else
		      //open the file in vscode
		      try
		        dim pp as Possibility = LBPossible.RowTagAt(LBPossible.SelectedRowIndex)
		        dim sh as new shell
		        dim shellCode as string = "/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code -g "+pp.possibility_GetDefinitionLocation
		        sh.Execute(shellCode)
		      catch
		      end try
		    end if
		    Return
		  end if
		  
		  
		  if self.ChildWindow <> nil then
		    self.ChildWindow.Close
		    self.ChildWindow = nil
		  end if
		  
		  
		  EDSearch.SelectionLength = 0
		  mCurrentSearch = ""
		  lastKeyWasDelete = true
		  
		  if searchDepth = 0 or _
		    (LBPossible.SelectedRowIndex <> -1 and ClassAttribute(LBPossible.RowTagAt(LBPossible.SelectedRowIndex)).AttributeType = ClassAttribute.TypeEnum) then
		    
		    dim ww as new WinAutoFiller
		    ww.searchDepth = me.searchDepth + 1
		    ww.SearchDepthClassLoaderName = EDSearch.text
		    if LBPossible.SelectedRowIndex <> -1 and LBPossible.RowTagAt(LBPossible.SelectedRowIndex) isa ClassAttribute then ww.searchDepthClassAttributeObject = LBPossible.RowTagAt(LBPossible.SelectedRowIndex)
		    ww.LoadPossibilities
		    ww.ParentWindow = self
		    self.ChildWindow = ww
		    ww.show
		    
		  else
		    //type the text into the previous editor
		    dim result as string
		    if IsForSnippets and LBPossible.SelectedRowIndex <> -1 then
		      result = ClassAttribute(LBPossible.RowTagAt(LBPossible.SelectedRowIndex)).ExtraInfo.Lookup("content","")
		    else
		      result = EDSearch.Text
		    end if
		    app.StartClearAll(false,true)
		    app.HideApp
		    app.QueueDelayedKeystrokes(result)//this will attempt to hide app and send to frontmost app
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetClassLoaderParent() As ClassLoader
		  if SearchDepthClassLoaderName = "" then
		    Return nil
		  end if
		  
		  for each cc as ClassLoader in ClassLoader.CurrentClasses
		    if cc.ClassName = SearchDepthClassLoaderName then
		      Return cc
		    end if
		  next
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadPossibilities()
		  IsLoading = true
		  
		  redim possibilities(-1)
		  dim possibilitiesNames(-1) as string
		  
		  if searchDepth = 0 then
		    CHDeep.Visible = true
		    CHDeep.value = app.SearchDeep
		  end if
		  
		  if SearchDepthClassLoaderName <> "" then
		    LBFolderName.Text = SearchDepthClassLoaderName
		  elseif app.CurrentProjectFolder <> nil then
		    LBFolderName.Text = app.CurrentProjectFolder.Name
		  end if
		  
		  select case searchDepth
		  case 0
		    for each cc as ClassLoader in ClassLoader.CurrentClasses
		      possibilities.Append(cc)
		      possibilitiesNames.Append(cc.possibility_GetName)
		    next
		  case 1
		    dim cc as ClassLoader = self.GetClassLoaderParent
		    if cc <> nil then
		      if cc.ExtraInfo.Lookup("IsSnippetSet",false) then
		        SetupForSnippets
		      end if
		      
		      for each ct as ClassAttribute in cc.MyAttributes
		        possibilities.Append(ct)
		        possibilitiesNames.Append(ct.possibility_GetName)
		      next
		    end if
		  case 2
		    if searchDepthClassAttributeObject <> nil then
		      for each ct as ClassAttribute in searchDepthClassAttributeObject.NestedPossibilities
		        possibilities.Append(ct)
		        possibilitiesNames.Append(ct.possibility_GetName)
		      next
		    end if
		  end select
		  
		  possibilitiesNames.SortWith(possibilities)
		  SearchPossibilities
		  
		  
		  Finally
		    IsLoading = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResizeWindowForPossibilities()
		  dim WantsHeight as integer = LBPossible.RowCount * LBPossible.RowHeight + LBPossible.top + 12
		  dim maxHeight as integer = screen(0).AvailableHeight - self.top 
		  self.height = if(WantsHeight > maxHeight, maxHeight, WantsHeight)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SearchPossibilities()
		  IsConductingSearch = true
		  
		  LBPossible.deleteallrows
		  
		  dim sl as integer = CurrentSearch.Length
		  dim hasExpandedFirstPossibility as Boolean
		  
		  for each pp as Possibility in possibilities
		    if pp.possibility_MatchesSearch(CurrentSearch) then
		      pp.possibility_AddToListBox(LBPossible)
		      
		      if hasExpandedFirstPossibility = false and sl > 0 then
		        hasExpandedFirstPossibility = true
		        EDSearch.Text = pp.possibility_GetName
		        EDSearch.SelectionStart = sl
		        EDSearch.SelectionLength = EDSearch.text.length - edsearch.SelectionStart
		        LBPossible.listindex = LBPossible.lastindex
		      end if
		    end if
		  next
		  
		  ResizeWindowForPossibilities
		  IsConductingSearch = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetupForSnippets()
		  IsForSnippets = true
		  LBPossible.DefaultRowHeight = 40
		  LBPossible.ColumnWidths = "*,0"
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ChildWindow As WinAutoFiller
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCurrentSearch
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCurrentSearch = value
			  EDSearch.Text = mCurrentSearch
			  
			  SearchPossibilities
			End Set
		#tag EndSetter
		CurrentSearch As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		IsConductingSearch As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		IsForSnippets As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsLoading As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		LastConfirmedSearch As String
	#tag EndProperty

	#tag Property, Flags = &h0
		lastKeyWasDelete As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentSearch As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mParentWindow As WinAutoFiller
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mParentWindow
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mParentWindow = value
			  
			  if mParentWindow = nil then
			    self.Left = screen(0).AvailableLeft
			    self.top = screen(0).AvailableTop
			  else
			    self.left = mParentWindow.Left + mParentWindow.Width + 2
			    self.top = mParentWindow.top
			    self.Width = 390
			    
			    if IsForSnippets = false then
			      LBPossible.ColumnCount = 2
			      LBPossible.ColumnWidths = "*,90"
			    end if
			  end if
			  
			  
			  
			End Set
		#tag EndSetter
		ParentWindow As WinAutoFiller
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		possibilities(-1) As Possibility
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			0 = classes
			1 = methods/properties of a class
		#tag EndNote
		searchDepth As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		searchDepthClassAttributeObject As ClassAttribute
	#tag EndProperty

	#tag Property, Flags = &h0
		SearchDepthClassLoaderName As String
	#tag EndProperty


#tag EndWindowCode

#tag Events EDSearch
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  //3 = enter
		  //8 = backspace
		  //9 = tab
		  
		  //13 = return
		  
		  //27 = escape
		  
		  //28 = left
		  //29 = right
		  //30 = up
		  //31 = down
		  //32 = space
		  
		  //46 = .
		  
		  //96 = `
		  
		  //127 = delete
		  
		  
		  select case asc(key)
		  case 13,9,3,46,29///affirmative
		    ConfirmSelection
		  case 8,127,27,28///deletive
		    if CurrentSearch = "" and AttemptCloseForParent(asc(key)) then
		      Return true
		    end if
		    
		    if lastKeyWasDelete then
		      //two deletes goes to beginning
		      CurrentSearch = ""
		    else
		      CurrentSearch = CurrentSearch.Left(CurrentSearch.Length - 1)
		      lastKeyWasDelete = true
		      Return true //return early so we don't set lastkeywasdelete=false later
		    end if
		  case 31//down
		    LBPossible.SetFocus
		    if LBPossible.listCount > LBPossible.listindex + 1 then
		      LBPossible.listindex = LBPossible.listindex + 1
		    end if
		  case 30//up
		    LBPossible.SetFocus
		    if LBPossible.listcount > 0 then
		      LBPossible.listindex = LBPossible.listcount - 1
		    end if
		    
		  else
		    CurrentSearch = CurrentSearch + if(asc(key) = 32,"_",key)
		  end select
		  
		  
		  lastKeyWasDelete = false
		  Return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events LBPossible
	#tag Event
		Sub Change()
		  if IsConductingSearch = false and me.listindex <> -1 then
		    EDSearch.Text = me.cell(me.listindex,0)
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  select case asc(key)
		  case 13,9,3///affirmative
		    //load next window
		    ConfirmSelection
		  case 8,127,27///deletive
		    CurrentSearch = ""
		    EDSearch.SetFocus
		    Return true
		  else
		    
		  end select
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  if row > -1 and row<me.listcount then
		    me.listindex = row
		    ConfirmSelection
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function WantsIsForSnippets() As Boolean
		  Return IsForSnippets
		End Function
	#tag EndEvent
	#tag Event
		Function WantsSearchDepth() As integer
		  Return searchDepth
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events CHDeep
	#tag Event
		Sub Action()
		  if IsLoading = false then
		    app.SearchDeep = me.value
		    app.SavePrefs
		    app.LoadProjectFolder(false,1)
		  end if
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
	#tag ViewProperty
		Name="lastKeyWasDelete"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentSearch"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="IsConductingSearch"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="searchDepth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SearchDepthClassLoaderName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LastConfirmedSearch"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="IsForSnippets"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
