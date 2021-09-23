#tag Module
Protected Module Globals
	#tag Method, Flags = &h0
		Sub CenterMe(extends w as window)
		  w.Left = Screen(0).AvailableWidth / 2 - w.Width / 2
		  w.Top = Screen(0).AvailableHeight / 2 - w.Height / 2
		End Sub
	#tag EndMethod


End Module
#tag EndModule
