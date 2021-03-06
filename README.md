
# Abstract Extract :open_file_folder:
> _Open zip files just like folders in Windows_

![logotype](logo.png)

When you double-click a folder in Windows it opens. As simple as that. Why can't it be as simple when it comes to compressed files?

_Abstract Extract_ is a Windows Batch file that abstracts away any actions required to interact with your compressed files, turning the zip file into the extracted folder with nothing more than a double-click. Just like opening folders in Windows. :smile: 

## What does Abstract Extract do?

When _Abstract Extract_ runs it will...

* extract all files keeping subfolders intact,
* move folders to avoid having a folder with nothing more than a folder inside,
* delete the original compressed file, and
* open up a window with the extracted files.

## How to use?

### As default action when double-clicking archives

This example assumes you have [7-Zip](http://www.7-zip.org/) installed and [added to PATH](https://www.youtube.com/watch?v=qdfjWpeJDnw) variable. 

1. In the file [7-zip-shell-context-menu-defaults.reg](7-zip-shell-context-menu-defaults.reg), look for all lines with

  ```
  @="\"D:\\path\\to\\extract.bat\" \"%1\" "
  ```
2. Modify path to point to the location of the file [extract.bat](extract.bat). Escape any backslash with another backslash.
3. Double-click _7-zip-shell-context-menu-defaults.reg_ to merge with the registry. **Warning! As this modifies the Windows registry, make sure you have a backup or enough knowledge to know what you're doing.**

That's it! Now any time any associated file with 7-zip is opened, _Abstract Extract_ will kick in and [do it's thing](#what-does-abstract-extract-do). Archives can still be opened up with the 7-zip viewer using the context menu or starting 7-zip and browsing for the archive.

#### Will it work with any other software than 7-zip?

_Abstract Extract_ does not depend on 7-zip. It was simply chosen as it is free, fast and open source. Please fork away and modify what's neceesary to make it work with other compression software. Let me know with a pull request if you figured anything out.

In WinRAR, there is a setting called _["Remove redundant folders from extraction path"](http://softwarerecs.stackexchange.com/a/1889)_.


### Command line

```
extract.bat <archive_path>
   <archive_path>  The path to the compressed file to extract
```


## Acknowledgements and resources
* [Make "Extract to \<folder\>" default on double-click](http://superuser.com/a/447791)
* [Make 7-Zip extract to folder when double-clicking archives](https://gist.github.com/oscarb/3296c41843596b05a1887bb28e935636)
* [Robocopy](https://technet.microsoft.com/sv-se/library/cc733145(v=ws.10).aspx)
* [batch file - Set output of a command as a variable (with pipes)](http://stackoverflow.com/questions/14952295/set-output-of-a-command-as-a-variable-with-pipes)
* [Counting lines in Windows command prompt](http://rickardnobel.se/counting-lines-in-windows-command-prompt/)

## License

[MIT](LICENSE)
