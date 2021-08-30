#tag Class
Protected Class ClassLoader
	#tag Method, Flags = &h0
		Function DoLoad(withFile as FolderItem) As Boolean
		  
		  if withFile = nil or withFile.Exists=false then
		    return false 
		  end if
		  
		  
		  me.ClassName = withFile.Name.NthField(".",1)
		  
		  
		  
		  dim associationTypes(-1) as string = split("belongs_to,has_many,has_one,has_and_belongs_to_many",",")
		  
		  dim emptyLinesRemaining as integer = 0
		  dim currentMode as integer = 0
		  //0 base
		  //1 schema stasrt
		  //2 properties start in schema
		  //3 methods
		  
		  
		  dim tt as TextInputStream = TextInputStream.Open(withFile)
		  if tt=nil then return false 
		  
		  do until tt.EndOfFile
		    dim ll as string = tt.ReadLine
		    
		    if ll = "# == Schema Information" then
		      currentMode = 1
		      
		    elseif ll.nthfield(":",1) = "# Table name" and currentMode = 1 then
		      currentMode = 2
		      emptyLinesRemaining = 2
		      
		    elseif ll.left(6) = "class " then
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
		        
		      case 3
		        
		        ll = trim(ll)
		        if ll.left(4) = "def " then
		          //it's a method
		          FoundMethods.Append(ll.mid(5))
		        else
		          //check if it's an association
		          for aa as integer = 0 to UBound(associationTypes)
		            if ll.left(associationTypes(aa).Length) = associationTypes(aa) then
		              dim ascName as string = nthfield(ll,":",2).nthfield(",",1).trim
		              FoundAssociations.Append(new pair(ascName,"@$"+associationTypes(aa)))
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
		    
		    for i as integer = 0 to classFolder.Count-1
		      dim classFile as FolderItem = classFolder.ChildAt(i)
		      if classFile <> nil and classFile.Name.right(3) = ".rb" then
		        dim cl as new ClassLoader
		        if cl.DoLoad(classFile) then
		          CurrentClasses.Append(cl)
		        end if
		      end if
		    next
		  end if
		  
		  
		  Exception err
		    msgbox "Could find the models folder."
		    
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ClassName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared CurrentClasses(-1) As ClassLoader
	#tag EndProperty

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
	#tag EndViewBehavior
End Class
#tag EndClass
