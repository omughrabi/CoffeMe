//
//  FileManager-DocumentsDirectory.swift
//  CoffeMe
//
//  Created by Omar on 20.08.23.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
