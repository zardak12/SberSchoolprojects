//
//  ViewController.swift
//  SwiftObjective
//
//  Created by Марк Шнейдерман on 11.07.2021.
//

import UIKit
import ObjcLibraryFirstModule
import SwiftLibraryFirst

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
          //MARK: - Swift
        let swiftLibraryFirst = SwiftLibraryFirst()
        let swiftLibrarySecond = swiftLibraryFirst.createLibrary()
        
          //MARK: - Objective-C
        
        let objcLibraryFirst = ObjcLibraryFirst()
        let objcLibrarySecond = objcLibraryFirst.nextLib
    }


}

