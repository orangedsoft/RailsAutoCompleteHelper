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
   Title           =   "#@"
   Type            =   "7"
   Visible         =   True
   Width           =   278
   Begin TextField EDSearch
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &c38383800
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
   Begin Listbox LBPossible
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
      Width           =   263
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Deactivate()
		  if ParentWindow <> nil then
		    self.Close
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  dim newStyle As UInt64 = 0 //no titlebar, not resizeable
		  if self.Resizeable then newStyle = 8 //no titlebar and resizeable
		  
		  soft declare sub setStyleMask lib "Cocoa.framework" selector "setStyleMask:" (id As Ptr, mask As UInt64)
		  setStyleMask(Ptr(self.Handle), newStyle)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AttemptCloseForParent(theKeyCausingAttempt as integer = 0) As Boolean
		  if ParentWindow = nil then
		    if theKeyCausingAttempt = 27 then //escap only to close
		      app.HideApp
		      Return true
		    else
		      Return false
		    end if
		  else
		    ParentWindow.EDSearch.SetFocus
		    self.close
		    Return true
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CleanForAssociations(s as string) As string
		  
		  if left(s,2) = "@$" then
		    Return mid(s,3)
		  else
		    Return s
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
		  if self.ChildWindow <> nil then
		    self.ChildWindow.Close
		    self.ChildWindow = nil
		  end if
		  
		  
		  EDSearch.SelectionLength = 0
		  mCurrentSearch = ""
		  lastKeyWasDelete = true
		  
		  select case searchDepth
		  case 0
		    dim ww as new WinAutoFiller
		    ww.searchDepth = me.searchDepth + 1
		    ww.searchDepthClass = EDSearch.text
		    ww.LoadPossibilities
		    ww.ParentWindow = self
		    self.ChildWindow = ww
		    ww.show
		    
		  case 1
		    //copy result
		    dim cc as new Clipboard
		    cc.Text = EDSearch.Text
		    sendKeystrokes(EDSearch.Text)
		    app.StartClearAll(false)
		    app.HideApp
		    
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadPossibilities()
		  redim possibilities(-1)
		  redim possibilitiesInfo(-1)
		  
		  
		  if searchDepthClass <> "" then
		    LBFolderName.Text = searchDepthClass
		  elseif app.CurrentProjectFolder <> nil then
		    LBFolderName.Text = app.CurrentProjectFolder.Name
		  end if
		  
		  select case searchDepth
		  case 0
		    for i as integer = 0 to UBound(ClassLoader.CurrentClasses)
		      possibilities.Append(ClassLoader.CurrentClasses(i).ClassName)
		      possibilitiesInfo.Append("")
		    next
		  case 1
		    for i as integer = 0 to UBound(ClassLoader.CurrentClasses)
		      if ClassLoader.CurrentClasses(i).ClassName = searchDepthClass then
		        for j as integer = 0 to UBound(ClassLoader.CurrentClasses(i).FoundProperties)
		          possibilities.Append(ClassLoader.CurrentClasses(i).FoundProperties(j).Left)
		          possibilitiesInfo.Append(ClassLoader.CurrentClasses(i).FoundProperties(j).Right)
		        next
		        for j as integer = 0 to UBound(ClassLoader.CurrentClasses(i).FoundMethods)
		          if left(ClassLoader.CurrentClasses(i).FoundMethods(j),5) = "self." then
		            possibilities.Append(ClassLoader.CurrentClasses(i).FoundMethods(j).mid(6))
		            possibilitiesInfo.Append("selfmethod")
		          else
		            possibilities.Append(ClassLoader.CurrentClasses(i).FoundMethods(j))
		            possibilitiesInfo.Append("method")
		          end if
		        next
		        
		        for j as integer = 0 to UBound(ClassLoader.CurrentClasses(i).FoundAssociations)
		          possibilities.Append(ClassLoader.CurrentClasses(i).FoundAssociations(j).Left)
		          possibilitiesInfo.Append(ClassLoader.CurrentClasses(i).FoundAssociations(j).Right)
		        next
		        
		        exit
		      end if
		    next
		    
		    
		  end select
		  
		  possibilities.SortWith(possibilitiesInfo)
		  SearchPossibilities
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
		  
		  for i as integer = 0 to UBound(possibilities)
		    if sl = 0 or possibilities(i).left(sl) = CurrentSearch then
		      LBPossible.AddRow(possibilities(i),CleanForAssociations(possibilitiesInfo(i)))
		      LBPossible.RowTag(LBPossible.lastindex) = possibilitiesInfo(i)
		      
		      if hasExpandedFirstPossibility = false and sl > 0 then
		        hasExpandedFirstPossibility = true
		        EDSearch.Text = possibilities(i)
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
			    
			    LBPossible.ColumnCount = 2
			    LBPossible.ColumnWidths = "*,90"
			  end if
			  
			  
			  
			End Set
		#tag EndSetter
		ParentWindow As WinAutoFiller
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		possibilities(-1) As String
	#tag EndProperty

	#tag Property, Flags = &h0
		possibilitiesInfo(-1) As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			0 = classes
			1 = methods/properties of a class
		#tag EndNote
		searchDepth As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		searchDepthClass As String
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
		    CurrentSearch = CurrentSearch + key
		  end select
		  
		  
		  lastKeyWasDelete = false
		  Return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events LBPossible
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  if me.Selected(row) then
		    g.forecolor = rgb(50,50,150)
		  else
		    g.forecolor = rgb(20,20,20)
		  end if
		  g.FillRectangle 0,0,g.Width,g.Height
		  
		  
		  
		  Return true
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  g.forecolor = rgb(240,240,240)
		  
		  if row > -1 and row < me.listcount and column > -1 and column < me.ColumnCount then
		    if searchDepth > 0 then
		      
		      if left(me.RowTagAt(row),2) = "@$" then
		        g.forecolor = rgb(189,115,211)
		      else
		        select case me.RowTagAt(row)
		        case "method","selfmethod"
		          g.forecolor = rgb(179,133,90)
		        else
		          //property
		          g.forecolor = rgb(151,203,254)
		        end select
		      end if
		      
		    end if
		  end if
		  
		End Function
	#tag EndEvent
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
		Name="searchDepthClass"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
