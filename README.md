# RailsAutoCompleteHelper.app

![Very autocomplete](https://media.giphy.com/media/lOkLY9GaN779AwE47I/giphy.gif)

 Native Mac app, autocomplete helper for Rails projects that pulls data from model files. 

This app will accept a project folder and load the files located in /app/models/ and search for:
- Methods and self.methods, found by lines that begin with "def "
- Properties, found by the schema information produced by the Annotate gem
- Assocations, found by lines beginning with the various Rails association types

# **Disclaimer**
This is a very rudimentary autocomplete app used for internal purposes. There are many limitations including:
- It doesn't search any folders besides the main app/models/ folder
- It's Mac-only but could be modified to work on Windows if you feel like dealing with declares
- It currently doesn't work smoothly with Mission Control Spaces/full screen
- There will be many false positives/negatives for method/property/association matches since we didn't spend a ton of time accounting for different formats
- It's intended for Rails 6.x

---
## To use the compiled app with your Rails project
1. [Annotate gem](https://github.com/ctran/annotate_models) is required in your Rails project so this app can pull property values from the model.rb files.
2. You'll need to go into System Preferences > Security & Privacy > Privacy > Accessibility, unlock the pane with your system admin password, and drag and drop RailsAutoCompleteHelper.app into the list. You might also have to go back in here and toggle it on and off multiple times since it seems very inconsistent and unreliable.
3. You might also need to allow System Preferences > Security & Privacy > Privacy > Automation > RailsAutoCompleteHelper > System Events
4. Launch the RailsAutoCompleteHelper.app and leave it running in the background. If you're using VSCode you can create a task to automatically launch this app when the Project folder is opened.
5. Press Control-` to bring it to the front to start typing your model name. Select a model to start filtering through properties/methods/associations for the model. Select a property/method/association and the app will attempt to send exactly that property's full name to the last active app, via Applescript.
6. Pressing Escape a bunch will hide the app. Pressing cmd-1 while the app is active will clear all input and start you with a blank field.

---
## Requirements to modify/build the code in this repository
1. [Xojo IDE](https://www.xojo.com) was used to create the app and is required to modify/build
2. [MBS Plugin](https://www.monkeybreadsoftware.net) is required for several of the functions in the app:
3. In the App.open event you'll need to create your own registration process for MBS, as we've .gitignored our registration class to prevent sharing of MBS credentials.