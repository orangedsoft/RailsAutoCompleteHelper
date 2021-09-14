#tag Class
Protected Class ClassLoader
Implements Possibility
	#tag Method, Flags = &h0
		Function DoLoad(withFile as FolderItem) As Boolean
		  
		  if withFile = nil or withFile.Exists=false then
		    return false 
		  end if
		  
		  
		  me.ClassName = withFile.Name.NthField(".",1)
		  me.ClassDefinitionLocation = withFile.ShellPath
		  
		  
		  dim associationTypes(-1) as string = split("belongs_to,has_many,has_one,has_and_belongs_to_many",",")
		  
		  dim emptyLinesRemaining as integer = 0
		  dim currentMode as integer = 0
		  dim linePosition as integer = 0
		  //0 base
		  //1 schema stasrt
		  //2 properties start in schema
		  //3 methods
		  
		  
		  dim tt as TextInputStream = TextInputStream.Open(withFile)
		  if tt=nil then return false 
		  
		  do until tt.EndOfFile
		    dim ll as string = tt.ReadLine
		    linePosition = linePosition + 1
		    
		    if ll = "# == Schema Information" then
		      currentMode = 1
		      
		    elseif ll.nthfield(":",1) = "# Table name" and currentMode = 1 then
		      currentMode = 2
		      emptyLinesRemaining = 2
		      
		    elseif ll.left(6) = "class " or ll.left(7) = "module " then
		      currentMode = 3
		      
		    else
		      
		      select case currentMode 
		      case 2
		        
		        if ll = "#" then
		          emptyLinesRemaining = emptyLinesRemaining - 1
		          if emptyLinesRemaining <= 0 then
		            currentMode = 0
		          end if
		          Continue
		        end if
		        
		        MyAttributes.Append(new ClassAttribute(ClassAttribute.TypeProperty,withFile,linePosition,ll))
		      case 3
		        
		        ll = trim(ll)
		        
		        if ll.left(4) = "def " then
		          //it's a method
		          MyAttributes.Append(new ClassAttribute(ClassAttribute.TypeMethod,withFile,linePosition,ll))
		        elseif ll.left(6) = "scope " then
		          //it's a scope
		          MyAttributes.Append(new ClassAttribute(ClassAttribute.TypeScope,withFile,linePosition,ll))
		        else
		          //check if it's an association
		          for aa as integer = 0 to UBound(associationTypes)
		            if ll.left(associationTypes(aa).Length) = associationTypes(aa) then
		              MyAttributes.Append(new ClassAttribute(ClassAttribute.TypeAssociation,withFile,linePosition,ll,associationTypes(aa)))
		              exit
		            end if
		          next
		        end if
		        
		      end select
		    end if
		  loop
		  
		  me.NameVariants = GetVariantsForName(me.ClassName)
		  tt.Close
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetVariantsForName(n as string) As string()
		  
		  dim s(-1) as string
		  s.Append(n.ReplaceAll("_",""))
		  s.Append(n.ReplaceAll(" ",""))
		  
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub LoadClassesForProject(f as FolderItem)
		  redim CurrentClasses(-1)
		  
		  if f<>nil and f.Exists and f.IsFolder then
		    dim classFolder as FolderItem = f.Child("app").Child("models")
		    LoadClassesFromFolder(classFolder)
		  end if
		  
		  
		  Exception err
		    msgbox "Couldn't find the models folder."
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub LoadClassesFromFolder(f as FolderItem)
		  if f <> nil and f.Exists and f.IsFolder then
		    for i as integer = 0 to f.Count-1
		      dim classFile as FolderItem = f.ChildAt(i)
		      if classFile <> nil and classFile.Exists then
		        if classFile.IsFolder and app.SearchDeep then
		          LoadClassesFromFolder(classFile)
		        elseif classFile.Name.right(3) = ".rb" then
		          dim cl as new ClassLoader
		          if cl.DoLoad(classFile) then
		            CurrentClasses.Append(cl)
		          end if
		        end if
		      end if
		    next
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub possibility_AddToListBox(lb as listbox)
		  // Part of the Possibility interface.
		  
		  lb.AddRow(ClassName)
		  lb.RowTag(lb.lastindex) = me
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function possibility_GetDefinitionLocation() As String
		  // Part of the Possibility interface.
		  
		  Return ClassDefinitionLocation
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function possibility_GetName() As String
		  // Part of the Possibility interface.
		  
		  Return ClassName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function possibility_GetTextColor(defaultColor as color) As color
		  // Part of the Possibility interface.
		  
		  Return defaultColor
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function possibility_MatchesSearch(s as String) As Boolean
		  // Part of the Possibility interface.
		  
		  dim sl as integer = s.Length
		  if sl = 0 or ClassName.left(sl) = s then
		    Return true
		  end if
		  
		  for i as integer = 0 to UBound(NameVariants)
		    if NameVariants(i).Left(sl) = s then
		      Return true
		    end if
		  next
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		#tag Note
			only used for classes, not methods/properties/associations
		#tag EndNote
		ClassDefinitionLocation As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ClassName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared CurrentClasses(-1) As ClassLoader
	#tag EndProperty

	#tag Property, Flags = &h0
		MyAttributes(-1) As ClassAttribute
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			used to cache different typings of name for search purposes
		#tag EndNote
		Private NameVariants(-1) As String
	#tag EndProperty


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
			Name="ClassName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClassDefinitionLocation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
