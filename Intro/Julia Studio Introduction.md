Julia Studio Introduction
================================================

#### Getting Started
- You can launch Julia Studio by locating its icon and double clicking. This will open the Julia Studio environment. Once open, you will notice that the IDE has three main tabs.
- The first tab, Welcome, is selected by default when you launch Julia Studio. This tab shows you your most recently opened files for easy access. It also shows a list of sessions. 
- When you exit Julia Studio, a snapshot of your current workspace is stored as a session. 
- To restore the session automatically when you start Julia Studio, select File > Session Manager > Restore last session on startup.
- The Welcome tab also provides quick links for creating and opening files. You can also jump to the Edit tab to browse for files on your file system.
- Let's begin by creating a new file in Julia Studio. 
- If this is your first time creating a project, you can do this through the file menu, by going to File > New File, or by clicking on the New File icon in the welcome tab. 
- Alternatively, you can create new files using the CTRL/CMD-N hotkey.This will bring up the new file dialog.
 
#### Hello World
- Let's call this file, hello.jl and place it in any directory. 
- It's good practice to create one location for all your julia files and call it, "julia". Finally, confirm your settings.

#### Editing and Running Files
The main screen for working with files is the Edit tab. There are a lot of ways to configure this screen based on your preferences, but by default you should see your file system on the left and the active file on the right. Double clicking files in the file system pane will open them in the edit tab. You can choose between open files by selecting from the chooser at the top of the editor pane. Since we just created `hello.jl`, it should already be open in the main pane.

<pre><code>
# In hello.jl
	 
println("Hello, World!")
</code></pre>

We are using Julia's `println` method to log a message to the console. Now we just need to run the file. This can be done by pressing the green run button in the upper right corner. The run button will always run the active file.
You'll notice that this opens the console automatically. The console's visibility can be toggled by clicking the word "Console" where it appears at the bottom.
 
You can also run files manually by using Julia's include command. This command can be used in the console or within other files. Including a file evaluates its contents and can be used to modularize your programs by splitting subsets of logic or libraries into individual files. 
In the console you have to giveinclude the complete absolute path. This is made easy by right-clicking on the file name in the file system panel and choosing "Copy absolute path" and then pasting it in the console with Ctrl-V
<pre><code>
# In the console
	 
include("/yourDirectory/hello.jl")
</code></pre>
When you run this command you should see output in your console.
To illustrate how to use this command within another file, create another file called main.jl and add:
<pre><code>
# In main.jl
 
include("hello.jl")
</code></pre>
If you then run `main.jl` you should see the output from hello.jl in the console.

