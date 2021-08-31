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
		  
		  
		  ///this app requires a registered version of MonkeybreadSoftware plugin from here:
		  ///https://www.monkeybreadsoftware.net
		  
		  ///I put the registration into a separate class to prevent it from being committed to git with registration credentials
		  ///So you'll have to make your own MBSRegistration class with RegisterMBS shared method for this to build properly
		  MBSRegistration.RegisterMBS
		  
		  
		  
		  dim keyCode as integer = HotKeyMBS.KeyCodeForText("grave")
		  HotKeyWatcher = new HotKeyMBS(keyCode, HotKeyMBS.ControlKey)
		  AddHandler HotKeyWatcher.KeyDown, WeakAddressOf BringToFront
		  
		  
		  
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


	#tag Method, Flags = &h0
		Sub BringToFront(sender as object = nil)
		  dim p as ProcessMBS
		  
		  // move all windows to front
		  p=new ProcessMBS
		  p.GetCurrentProcess
		  p.SetFrontProcessWithOptions 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckForGlobalShortCut(sender as object = nil)
		  if Keyboard.AsyncControlKey  then
		    bringToFront
		  end
		  
		  if Keyboard.AsyncKeyDown(96) and Keyboard.AsyncControlKey then
		    bringToFront
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HideApp()
		  dim p as ProcessMBS
		  
		  p=new ProcessMBS
		  p.GetCurrentProcess
		  p.visible = false
		  
		  
		  'HideAppScript
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadPrefs()
		  
		  
		  dim ff as FolderItem = SpecialFolder.Preferences.Child("RailsAutoCompleteHelper-last-location.txt")
		  
		  if ff <> nil and ff.Exists then
		    dim textin as TextInputStream = TextInputStream.Open(ff)
		    LastBaseFolderPath = textin.readall
		    textin.close
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadProjectFolder(forceSelection as Boolean = false)
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
		    window(i).close
		  next
		  
		  ClassLoader.LoadClassesForProject(CurrentProjectFolder)
		  
		  dim ww as new WinAutoFiller
		  ww.loadpossibilities
		  ww.ParentWindow = nil
		  app.MainWindow = ww
		  ww.show
		  
		  
		  
		  
		  Exception err
		    LoadProjectFolder(true)
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
		Sub SavePrefs()
		  
		  
		  dim ff as FolderItem = SpecialFolder.Preferences.Child("RailsAutoCompleteHelper-last-location.txt")
		  
		  if ff <> nil and ff.Exists then
		    ff.Delete
		  end if
		  
		  dim textout as TextOutputStream = TextOutputStream.Open(ff)
		  textout.Write LastBaseFolderPath
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
