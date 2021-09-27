#tag Menu
Begin Menu MainMenuBar
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Value = "&File"
      Index = -2147483648
      Text = "&File"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin MenuItem FileOpenProject
         SpecialMenu = 0
         Value = "Open Project..."
         Index = -2147483648
         Text = "Open Project..."
         ShortcutKey = "O"
         Shortcut = "Cmd+O"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileReloadCurrentProject
         SpecialMenu = 0
         Value = "Reload Current Project"
         Index = -2147483648
         Text = "Reload Current Project"
         ShortcutKey = "R"
         Shortcut = "Cmd+R"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Value = "-"
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Value = "#App.kFileQuit"
         Index = -2147483648
         Text = "#App.kFileQuit"
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Value = "&Edit"
      Index = -2147483648
      Text = "&Edit"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Value = "&Undo"
         Index = -2147483648
         Text = "&Undo"
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditSeparator1
         SpecialMenu = 0
         Value = "-"
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Value = "Cu&t"
         Index = -2147483648
         Text = "Cu&t"
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Value = "&Copy"
         Index = -2147483648
         Text = "&Copy"
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Value = "&Paste"
         Index = -2147483648
         Text = "&Paste"
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Value = "#App.kEditClear"
         Index = -2147483648
         Text = "#App.kEditClear"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditSeparator2
         SpecialMenu = 0
         Value = "-"
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditSelectAll
         SpecialMenu = 0
         Value = "Select &All"
         Index = -2147483648
         Text = "Select &All"
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileClearAll
         SpecialMenu = 0
         Value = "Clear All"
         Index = -2147483648
         Text = "Clear All"
         ShortcutKey = "1"
         Shortcut = "Cmd+1"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem SnippetsMenu
      SpecialMenu = 0
      Value = "Snippets"
      Index = -2147483648
      Text = "Snippets"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin MenuItem SnippetsOpenSnippetsFolder
         SpecialMenu = 0
         Value = "Open Snippets Folder..."
         Index = -2147483648
         Text = "Open Snippets Folder..."
         ShortcutKey = "O"
         Shortcut = "Cmd+Option+O"
         MenuModifier = True
         MacOptionKey = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator0
         SpecialMenu = 0
         Value = "-"
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem SnippetsEditSnippet
         SpecialMenu = 0
         Value = "Edit Snippets..."
         Index = -2147483648
         Text = "Edit Snippets..."
         ShortcutKey = "N"
         Shortcut = "Cmd+N"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem WindowMenu
      SpecialMenu = 0
      Value = "Window"
      Index = -2147483648
      Text = "Window"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin MenuItem WindowCloseWindow
         SpecialMenu = 0
         Value = "Close Window"
         Index = -2147483648
         Text = "Close Window"
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
End
#tag EndMenu
