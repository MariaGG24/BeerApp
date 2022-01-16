
//
//  RGBMacDirUtils.swift
//
// Updated 3-11-2017
// Updated 11-10-2018
//
import Foundation

//MARK: ----------------
//MARK: RGBMacDirUtils
//MARK: ----------------
fileprivate let dfm = FileManager.default

//
//MARK: URLS of essential directories in macOS
//
/// Return the URL of the user's home directory
public func homeURL() -> URL {
  if #available(macOS 10.12, *) {
    return dfm.homeDirectoryForCurrentUser
  }
  else {
    return dfm.urls(for: FileManager.SearchPathDirectory.userDirectory,
                    in: FileManager.SearchPathDomainMask.userDomainMask).first!
  }
}

/// Return the URL of the tmp directory
public func tmpURL() -> URL {
  if #available(macOS 10.12, *) {
    return dfm.temporaryDirectory
  } else {
    // Fallback on earlier versions
    return URL(string: NSTemporaryDirectory())!
  }
}

///Return the URL of the user's Documents directory
public func documentsURL() -> URL {
  return dfm.urls(for: FileManager.SearchPathDirectory.documentDirectory,
                  in: FileManager.SearchPathDomainMask.userDomainMask).first!
}

/// Return the URL of the User's Library directory
public func libraryURL() -> URL {
  return dfm.urls(for: FileManager.SearchPathDirectory.libraryDirectory,
                  in: FileManager.SearchPathDomainMask.userDomainMask).first!
  
}

/// Return the URL of the User's Desktop directory
public func desktopURL() -> URL {
  return homeURL().appendingPathComponent("Desktop")
}

/// Return the URL of the a file in a folder on the Desktop folder of the user
public func pathTo(file fileName:String, inDesktopFolder folderName:String) -> URL {
  return desktopURL().appendingPathComponent(folderName).appendingPathComponent(fileName)
}
//
//MARK: Paths to essential directories in macOS
//

public func homePath() -> String {
  return homeURL().path
}


public func tmpPath() -> String{
  return tmpURL().path
}


public func documentsPath() -> String {
  return documentsURL().path
}


public func libraryPath() -> String {
  return libraryURL().path
}


public func desktopPath() -> String {
  return desktopURL().path
}

//MARK: isDir? isHidden?

public func isDirectory(url: URL) -> Bool {
  var isDir: ObjCBool = false;
  dfm.fileExists(atPath: url.path, isDirectory: &isDir)
  return isDir.boolValue;
}

public func isDirectory(url: URL) -> (objectExists: Bool, objecIsDirectory:Bool) {
  var isDir: ObjCBool = false;
  let doesExist = dfm.fileExists(atPath: url.path, isDirectory: &isDir)
  return (doesExist, isDir.boolValue)
}

public func isDirectory(path: String) -> Bool {
  var isDir: ObjCBool = false;
  dfm.fileExists(atPath: path, isDirectory: &isDir)
  return isDir.boolValue;
}

public func isHidden(url : URL) -> Bool {
  return url.lastPathComponent.hasPrefix(".")
}

//MARK: find files in given dir with given ext (or all with *)

//
// Given the URL of a directory and an extension, this function produces a list
// of URLs with that extension.
//
// Case is not meaningful for extensions
//

public  func listOfFilesIn(directory: URL, withExtension ext : String) -> [URL] {
  
  do {
    let contents = try dfm.contentsOfDirectory(at: directory,
                                               includingPropertiesForKeys: nil ,
                                               options: .skipsSubdirectoryDescendants)
    let justFilesNoDirs =  contents.filter() { !isDirectory(url: $0) }
    return ext == "*" ? justFilesNoDirs : justFilesNoDirs.filter() { $0.pathExtension == ext }
  } catch {
    print("\nCould not list files in " + directory.path)
    print("\(error)")
    return [URL]()
  }
}

//MARK:  Find dirs in given dir

//
// Given the URL of a directory and an extension, this function produces a list
// of URLs with that extension.
//
// Case is not meaningful for extensions
//

public  func listOfDirectoriesIn(directory: URL) -> [URL] {
  
  do {
    let contents = try dfm.contentsOfDirectory(at: directory,
                                               includingPropertiesForKeys: nil ,
                                               options: .skipsSubdirectoryDescendants)
    return contents.filter() { isDirectory(url: $0) }
  } catch {
    print("\nCould not list directories in " + directory.path)
    print("\(error)")
    return [URL]()
  }
}

//MARK: Peccata minuta
//
/// Parameter is a String, normally from url.lastPathComponent
//
public func splitIntoNameAndExtension(total:String) -> [String]? {
  
  let parts = total.components(separatedBy: ".")
  
  guard
    parts.count == 2,
    let name = parts.first,
    !name.isEmpty,
    let ext = parts.last,
    !ext.isEmpty
    else
  { return nil }
  
  return [name, ext]
}

// MARK: Input [URL], shows on terminal if URL is dir or file (if object exists)
//
// This method is actually like the next one, but it gives back nothing.
// Just prints to the terminal
//
public func showContentsOf(list : [URL]) -> Void {
  
  for item in list where dfm.fileExists(atPath: item.path) {
    print(item.path.padding(toLength: 80,
                            withPad: " ",
                            startingAt: 0)
      + "is a"
      + (isHidden(url: item) ? " hidden" : "")
      + (isDirectory(url: item) ? " directory" : " file"))
  }
} // End of showContentsOf:


// MARK: Input [URL], output String showing if URL is dir or file (for existing objects)
//
// This method is actually equal to the previous one, except it gives back a String
// that can be used as a parameter or printed directly.
//
public func transformURLsOfObjectsIntoListFilesOrDirsInAString(list : [URL]) -> String {
  
  var result : String = ""
  for item in list where dfm.fileExists(atPath: item.path) {
    result += item.path.padding(toLength: 80,
                                withPad: " ",
                                startingAt: 0)
      + "is a"
      + (isHidden(url: item) ? " hidden" : "")
      + (isDirectory(url: item) ? " directory" : " file")
      + "\n"
    
  }
  return result
} // End of prettyPrintURLsIn
