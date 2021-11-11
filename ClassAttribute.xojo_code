#tag Class
Protected Class ClassAttribute
Implements Possibility
	#tag Method, Flags = &h0
		Sub Constructor(withType as string, inFile as folderitem, atLine as integer, ll as string, extra as string = "", extra2 as string = "")
		  dim possibleNames(-1) as string
		  
		  RandomID = system.Random.InRange(0,1000000000)
		  AttributeType = withType
		  
		  if inFile <> nil then
		    DefinitionLocation = inFile.ShellPath+":"+cstr(atLine)
		  end if
		  
		  select case withType
		  case TypeProperty
		    
		    AttributeName = mid(ll,4).nthfield(" ",1)
		    ExtraInfo.Value(ExtraInfoPropertyType) = nthfield(ll,":",2).nthfield(" ",1).nthfield("(",1)
		    
		  case TypeMethod
		    
		    AttributeName = ll.mid(5)
		    
		    if left(AttributeName,5) = "self." then
		      AttributeName = AttributeName.mid(6)
		      AttributeType = TypeSelfMethod
		    end if
		    
		  case TypeAssociation
		    
		    AttributeName = nthfield(ll,":",2).nthfield(",",1).trim
		    extraInfo.value(ExtraInfoAssociationType) = extra
		    
		  case TypeScope
		    
		    AttributeName = nthfield(ll,":",2).nthfield(",",1).trim
		    
		  case TypeSnippet
		    
		    AttributeName = ll
		    ExtraInfo.Value("description") = extra
		    ExtraInfo.Value("content") = extra2
		    possibleNames.Append(extra)
		    
		    
		  case TypeEnum
		    
		    AttributeName = ll.mid(6).nthfield(":",1)
		    dim enumValues(-1) as string = ll.NthField("[",2).NthField("]",1).split(",")
		    for i as integer = 0 to UBound(enumValues)
		      NestedPossibilities.Append(new ClassAttribute(TypeEnumValue,inFile,atLine,trim(enumValues(i))))
		    next
		    
		  case TypeEnumValue
		    
		    AttributeName = ll
		    
		  end select
		  
		  possibleNames.Append(AttributeName)
		  me.NameVariants = ClassLoader.GetVariantsForName(possibleNames)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExportSnippetText() As String
		  dim s as string
		  
		  s = s + "<snippetItem>"
		  s = s + "<snippetDescription>"+ExtraInfo.Lookup("description","")+"</snippetDescription>"
		  s = s + "<snippetAbbreviation>"+AttributeName+"</snippetAbbreviation>"
		  s = s + "<snippetContent>"+ExtraInfo.Lookup("content","")+"</snippetContent>"
		  s = s + "</snippetItem>"
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub possibility_AddToListBox(lb as listbox)
		  // Part of the Possibility interface.
		  
		  
		  dim extra as string
		  select case AttributeType
		  case TypeAssociation
		    extra = ExtraInfo.Lookup(ExtraInfoAssociationType,"")
		  case TypeProperty
		    extra = ExtraInfo.Lookup(ExtraInfoPropertyType,"")
		  case TypeMethod
		    extra = "method"
		  case TypeSelfMethod
		    extra = "self.method"
		  case TypeScope
		    extra = "scope"
		  case TypeEnum
		    extra = "enum"
		  case TypeSnippet
		    extra = ExtraInfo.Lookup("description","")
		  end select
		  
		  lb.AddRow(AttributeName, extra)
		  lb.RowTag(lb.lastindex) = me
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function possibility_GetDefinitionLocation() As String
		  // Part of the Possibility interface.
		  
		  Return DefinitionLocation
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function possibility_GetName() As String
		  // Part of the Possibility interface.
		  
		  Return AttributeName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function possibility_GetTextColor(defaultColor as color) As color
		  // Part of the Possibility interface.
		  
		  select case AttributeType
		  case TypeAssociation
		    Return rgb(189,115,211)
		  case TypeProperty
		    Return rgb(151,203,254)
		  case TypeMethod,TypeSelfMethod
		    Return rgb(179,133,90)
		  case TypeScope
		    return rgb(107,184,86)
		  case TypeEnum, TypeEnumValue
		    Return rgb(177,167,154)
		  end select
		  
		  Return defaultColor
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function possibility_MatchesSearch(s as String) As Boolean
		  // Part of the Possibility interface.
		  
		  dim sl as integer = s.Length
		  if sl = 0 or AttributeName.left(sl) = s then
		    Return true
		  end if
		  
		  for i as integer = 0 to UBound(NameVariants)
		    if NameVariants(i).Left(sl) = s then
		      Return true
		    end if
		  next
		  
		  if AttributeType = TypeSnippet then
		    if ExtraInfo.Lookup("description","").StringValue.instr(s) <> 0  then
		      Return true
		    end if
		  end if
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AttributeName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		AttributeType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		DefinitionLocation As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mExtraInfo = nil then
			    mExtraInfo = new Dictionary
			  end if
			  
			  Return mExtraInfo
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mExtraInfo = value
			End Set
		#tag EndSetter
		ExtraInfo As Dictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		#tag Note
			//only used for ClassAttribute.AttibuteType = TypeProperty
		#tag EndNote
		Private mExtraInfo As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			used to cache different typings of name for search purposes
		#tag EndNote
		Private NameVariants(-1) As String
	#tag EndProperty

	#tag Property, Flags = &h0
		NestedPossibilities(-1) As ClassAttribute
	#tag EndProperty

	#tag Property, Flags = &h0
		RandomID As Integer
	#tag EndProperty


	#tag Constant, Name = ExtraInfoAssociationType, Type = String, Dynamic = False, Default = \"ExtraInfoAssociationType", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ExtraInfoPropertyType, Type = String, Dynamic = False, Default = \"ExtraInfoPropertyType", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeAssociation, Type = String, Dynamic = False, Default = \"TypeAssociation", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeEnum, Type = String, Dynamic = False, Default = \"TypeEnum", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeEnumValue, Type = String, Dynamic = False, Default = \"TypeEnumValue", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeMethod, Type = String, Dynamic = False, Default = \"TypeMethod", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeProperty, Type = String, Dynamic = False, Default = \"TypeProperty", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeScope, Type = String, Dynamic = False, Default = \"TypeScope", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeSelfMethod, Type = String, Dynamic = False, Default = \"TypeSelfMethod", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeSnippet, Type = String, Dynamic = False, Default = \"TypeSnippet", Scope = Public
	#tag EndConstant


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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AttributeName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AttributeType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefinitionLocation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RandomID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
