#tag Class
Protected Class ClassLoader
	#tag Method, Flags = &h0
		Function DoLoad(withFile as FolderItem) As Boolean
		  
		  if withFile = nil or withFile.Exists=false then
		    return false 
		  end if
		  
		  
		  me.ClassName = withFile.Name.NthField(".",1)
		  me.ClassDefinitionLocation = withFile.ShellPath
		  
		  
		  DefinitionLocations = new Dictionary
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
		        
		        dim propName as string= mid(ll,4).nthfield(" ",1)
		        dim propType as string = nthfield(ll,":",2).nthfield(" ",1).nthfield("(",1)
		        
		        FoundProperties.Append(new pair(propName, propType))
		        DefinitionLocations.Value("property::"+cstr(FoundProperties.Ubound)) = withFile.ShellPath+":"+cstr(linePosition)
		        
		      case 3
		        
		        ll = trim(ll)
		        if ll.left(4) = "def " then
		          //it's a method
		          FoundMethods.Append(ll.mid(5))
		          DefinitionLocations.Value("method::"+cstr(FoundMethods.Ubound)) = withFile.ShellPath+":"+cstr(linePosition)
		        else
		          //check if it's an association
		          for aa as integer = 0 to UBound(associationTypes)
		            if ll.left(associationTypes(aa).Length) = associationTypes(aa) then
		              dim ascName as string = nthfield(ll,":",2).nthfield(",",1).trim
		              FoundAssociations.Append(new pair(ascName,"@$"+associationTypes(aa)))
		              DefinitionLocations.Value("association::"+cstr(FoundAssociations.Ubound)) = withFile.ShellPath+":"+cstr(linePosition)
		              exit
		            end if
		          next
		        end if
		        
		      end select
		    end if
		  loop
		  
		  
		  tt.Close
		  Return true
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mDefinitionLocations = nil then
			    mDefinitionLocations = new Dictionary
			  end if
			  
			  Return mDefinitionLocations
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefinitionLocations = value
			End Set
		#tag EndSetter
		DefinitionLocations As Dictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		FoundAssociations(-1) As pair
	#tag EndProperty

	#tag Property, Flags = &h0
		FoundMethods(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			left = name, : right= type
		#tag EndNote
		FoundProperties(-1) As Pair
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			
			key = "method/property/association::index"
			value = filepath:line
		#tag EndNote
		Private mDefinitionLocations As Dictionary
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
	#tag EndViewBehavior
End Class
#tag EndClass
