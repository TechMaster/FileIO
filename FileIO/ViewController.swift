//
//  ViewController.swift
//  FileIO
//
//  Created by Techmaster on 8/30/16.
//  Copyright © 2016 Techmaster Vietnam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        readFileFromAppDirectory("data.txt")
        readWriteFile()
        
    }
    func readFileFromAppDirectory(file: String) {
        
        if let path = NSBundle.mainBundle().URLForResource("data", withExtension: "txt"){
            //reading
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

