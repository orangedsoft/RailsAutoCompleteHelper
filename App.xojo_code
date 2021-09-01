#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Deactivate()
		  HideApp
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  
		  // this app requires a registered version of MonkeybreadSoftware plugin from here:
		  // https://www.monkeybreadsoftware.net
		  
		  // I put the registration into a separate class to prevent it from being committed to git with registration credentials
		  // So you'll have to make your own MBSRegistration class with RegisterMBS shared method for this to build properly
		  MBSRegistration.RegisterMBS
		  
		  
		  // set up hot key
		  dim keyCode as integer = HotKeyMBS.KeyCodeForText("grave")
		  HotKeyWatcher = new HotKeyMBS(keyCode, HotKeyMBS.ControlKey)
		  AddHandler HotKeyWatcher.KeyDown, WeakAddressOf BringToFront
		  
		  
		  // hide app from dock
		  dim myProcess as ProcessMBS
		  myProcess=new ProcessMBS
		  myProcess.GetCurrentProcess        
		  if myProcess.TransformProcessType(myProcess.kProcessTransformToUIElementApplication) = 0 then
		  end if
		  
		  // set up reload timer
		  AutoReloadTimer = new timer
		  AutoReloadTimer.Period = 180000//3 minutes
		  AutoReloadTimer.RunMode = timer.RunModes.Multiple
		  AddHandler AutoReloadTimer.action, AddressOf ReloadFromTimer
		  
		  
		  
		  LoadPrefs
		  LoadProjectFolder
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClearAll() As Boolean Handles FileClearAll.Action
			
			StartClearAll
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpenProject() As Boolean Handles FileOpenProject.Action
			LoadProjectFolder(true)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function filereloadCurrentProject() As Boolean Handles filereloadCurrentProject.Action
			LoadProjectFolder(false,true)
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub BringToFront(sender as object = nil)
		  if app.MainWindow = nil then
		    app.OpenNewMainWindow
		  end if
		  
		  
		  dim p as ProcessMBS
		  // move all windows to front
		  p=new ProcessMBS
		  p.GetCurrentProcess
		  p.SetFrontProcessWithOptions 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HideApp()
		  if app.MainWindow <> nil then
		    app.MainWindow.Close
		    app.MainWindow = nil
		    
		    for i as integer = WindowCount-1 downto 0
		      window(i).close
		    next
		    
		    sendActivateCommand
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadPrefs()
		  
		  
		  dim ff as FolderItem = SpecialFolder.Preferences.Child("RailsAutoCompleteHelper-last-location.txt")
		  
		  if ff <> nil and ff.Exists then
		    dim textin as TextInputStream = TextInputStream.Open(ff)
		    dim s as string = textin.ReadAll
		    
		    if s.instr("<LastBaseFolderPath>") = 0 then
		      //old save format
		      LastBaseFolderPath = s
		      SearchDeep = true
		    else
		      //new save format
		      LastBaseFolderPath = s.NthField("<LastBaseFolderPath>",2)
		      SearchDeep = s.NthField("<SearchDeep>",2) = "true"
		    end if
		    
		    textin.close
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadProjectFolder(forceSelection as Boolean = false, allowInBackground as boolean = false)
		  if LastBaseFolderPath = "" or forceSelection then
		    dim ff as FolderItem = SelectFolder
		    if ff <> nil then
		      LastBaseFolderPath = ff.NativePath
		    end if
		  end if
		  
		  
		  CurrentProjectFolder = new FolderItem(LastBaseFolderPath, FolderItem.PathModes.Native)
		  
		  if CurrentProjectFolder = nil or CurrentProjectFolder.Exists = false or CurrentProjectFolder.IsFolder = false then
		    LoadProjectFolder(true)
		    Return
		  end if
		  
		  SavePrefs
		  
		  
		  
		  for i as integer = app.WindowCount - 1 downto 0
		    if allowInBackground and window(i) isa WinAutoFiller and WinAutoFiller(window(i)).searchDepth = 0 then
		      //we can keep the main window open in this situation
		    else
		      window(i).close
		    end if
		  next
		  
		  ClassLoader.LoadClassesForProject(CurrentProjectFolder)
		  OpenNewMainWindow(allowInBackground)
		  
		  
		  
		  
		  Exception err
		    LoadProjectFolder(true,allowInBackground)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenNewMainWindow(allowInBackground as Boolean = false)
		  dim ww as WinAutoFiller
		  
		  if allowInBackground and app.MainWindow = nil then
		    Return
		  end if
		  
		  if app.MainWindow <> nil then
		    ww = app.MainWindow
		  else
		    ww = new WinAutoFiller
		  end if
		  
		  ww.loadpossibilities
		  ww.ParentWindow = nil
		  app.MainWindow = ww
		  
		  if not allowInBackground then
		    ww.show
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QueueDelayedKeystrokes(theString as string)
		  myDelayedString = theString
		  dim tt as new timer
		  tt.RunMode = timer.RunModes.Single
		  tt.Period = 500
		  myDelayedStrokesTimer = tt
		  AddHandler tt.action, AddressOf SendDelayedStrokeNow
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReloadFromTimer(sender as object = nil)
		  LoadProjectFolder(false,true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SavePrefs()
		  
		  
		  dim ff as FolderItem = SpecialFolder.Preferences.Child("RailsAutoCompleteHelper-last-location.txt")
		  
		  if ff <> nil and ff.Exists then
		    ff.Delete
		  end if
		  
		  dim textout as TextOutputStream = TextOutputStream.Open(ff)
		  textout.Write "<LastBaseFolderPath>"+LastBaseFolderPath+"<LastBaseFolderPath>"
		  textout.Write "<SearchDeep>"+if(SearchDeep,"true","false")+"<SearchDeep>"
		  textout.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendDelayedStrokeNow(sender as object = nil)
		  sendKeystrokes(myDelayedString)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartClearAll(andShow as Boolean = true)
		  
		  for i as integer = 0 to WindowCount - 1
		    if Application.window(i) <> MainWindow then
		      Application.Window(i).close
		      StartClearAll
		      Return
		    end if
		  next
		  
		  if MainWindow <> nil then
		    if andShow then
		      MainWindow.Show
		    end if
		    MainWindow.ClearAll
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AutoReloadTimer As timer
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentProjectFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected HotKeyWatcher As HotKeyMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		LastBaseFolderPath As String
	#tag EndProperty

	#tag Property, Flags = &h0
		MainWindow As WinAutoFiller
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected myDelayedString As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected myDelayedStrokesTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h0
		SearchDeep As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ShortCutTimer As timer
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="LastBaseFolderPath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
