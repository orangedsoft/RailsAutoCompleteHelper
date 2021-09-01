#tag Interface
Protected Interface Possibility
	#tag Method, Flags = &h0
		Sub possibility_AddToListBox(lb as listbox)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function possibility_GetDefinitionLocation() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function possibility_GetName() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function possibility_GetTextColor(defaultColor as color) As color
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function possibility_MatchesSearch(s as String) As Boolean
		  
		End Function
	#tag EndMethod


End Interface
#tag EndInterface
