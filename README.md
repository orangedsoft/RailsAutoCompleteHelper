# RailsAutoCompleteHelper.app

![Very autocomplete](https://media.giphy.com/media/lOkLY9GaN779AwE47I/giphy.gif)

 Native Mac app, autocomplete helper for Rails projects that pulls data from model files. 

This app will accept a project folder and load the files located in /app/models/ and search for:
- Methods and self.methods, found by lines that begin with "def "
- Properties, found by the schema information produced by the Annotate gem
- Assocations, found by lines beginning with the various Rails association types
- Scopes, found by lines beginning with "scope "

You can also set up custom abbreviation sets to autocomplete whatever you'd like. With the app focused, press Command-N to open the abbreviations window to create sets and abbreviations.

# **Disclaimer**
This is a very rudimentary autocomplete app used for internal purposes. There are many limitations including:
- It doesn't search any folders besides the main app/models/ folder
- It's Mac-only but could *probably* be modified to work on Windows if you feel like dealing with declares
- There will be many false positives/negatives for method/property/association matches since we didn't spend a ton of time accounting for different formats
- It's intended for Rails 6.x

---
## To use the compiled app with your Rails project
1. Download the compiled Mac App from the [latest GitHub release](https://github.com/orangedsoft/RailsAutoCompleteHelper/releases)
2. [Annotate gem](https://github.com/ctran/annotate_models) is required in your Rails project so this app can pull property values from the model.rb files.
3. You'll need to go into System Preferences > Security & Privacy > Privacy > Accessibility, unlock the pane with your system admin password, and drag and drop RailsAutoCompleteHelper.app into the list. After installing each new version or if you're having any issues, you might also have to go back in here and toggle it on and off multiple times since it seems very inconsistent and unreliable.
4. You will also need to allow System Preferences > Security & Privacy > Privacy > Automation > RailsAutoCompleteHelper > System Events. 
5. Launch the RailsAutoCompleteHelper.app and leave it running in the background. If you're using VSCode you can [create a task to automatically launch this app when the Project folder is opened](https://code.visualstudio.com/updates/v1_30#_run-on-folder-open).
6. **Press Control-`** to bring the app to the front to start typing your model name. Select a model to start filtering through properties/methods/associations for the model. Select a property/method/association and the app will attempt to send exactly that property's full name to the last active app, via Applescript.
7. **Press Escape** a bunch to hide the app.
8. **Press Command-1** while the app is active to clear all input and start you with a blank field.
9. **Press Command-R** to reload all models/functions/properties/associations for the project. The app will automatically do this every 3 minutes.
10. **Press Shift-Return** with an item selected to open its definition file in VSCode, as long as you have the [VSCode CLI](https://code.visualstudio.com/docs/editor/command-line) installed.
11. **Press Command-N** to open the abbreviations editing window. Abbreviation sets are shown along with your models, and can be used to group and autocomplete abbreviations.
12. **Press Command-O** to change the current directory of abbreviation sets. This needs to be set in order to add abbreviations as they are all saved to text files. You can keep multiple directories with different groups of abbreviation sets for different purposes.

---
## Requirements to modify/build the code in this repository
1. [Xojo IDE](https://www.xojo.com) was used to create the app and is required to modify/build
2. [MBS Plugin](https://www.monkeybreadsoftware.net) is required for several of the functions in the app
3. In the App.open event you'll need to create your own registration process for MBS, as we've .gitignored our registration class to prevent sharing of MBS credentials.