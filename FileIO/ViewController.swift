//
//  ViewController.swift
//  FileIO
//
//  Created by Techmaster on 8/30/16.
//  Copyright © 2016 Techmaster Vietnam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var citys: [String] = ["ha noi", "hai phong"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //        readFileFromAppDirectory("data.txt")
        //        readWriteFile()
        let fm: FileMan = FileMan()
//        fm.readLines("/Users/chung/Documents/test.txt");
//        fm.appendStringToFile("/Users/chung/Documents/test3.txt", text: "Add theem")
//        fm.appendArrayToFile("/Users/chung/Documents/test2.txt", array: citys)
        fm.readWords("/Users/chung/Documents/SHA1.txt")
        
        
    }
    func readFileFromAppDirectory(file: String) {
        
        
        if let path = NSBundle.mainBundle().URLForResource("data", withExtension: "txt"){
            //            reading
            do {
                let text = try NSString(contentsOfURL: path, encoding: NSUTF8StringEncoding)
                print (text)
            }
            catch {/* error handling here */}
            
        }
    }
    func readWriteFile() {
        let file = "file.txt" //this is the file. we will write to and read from it
        
        let text = "some text" //just a text
        
        if let dir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = NSURL(fileURLWithPath: dir).URLByAppendingPathComponent(file)
            
            //writing
            do {
                try text.writeToURL(path, atomically: false, encoding: NSUTF8StringEncoding)
            }
            catch {/* error handling here */}
            
            //reading
            do {
                let text2 = try NSString(contentsOfURL: path, encoding: NSUTF8StringEncoding)
                print (text2)
            }
            catch {/* error handling here */}
        }
    }
    
}

