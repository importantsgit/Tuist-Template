//
//  Path+Extension.swift
//  AppExtensions
//
//  Created by Importants on 12/4/24.
//

import ProjectDescription

extension Path {
    public static func plistPath(_ plistName: String) -> Path {
         .relativeToRoot("SupportFiles/InfoPlist/\(plistName).plist")
    }
    
    public static func xcconfigPath(_ xcconfigName: String) -> Path {
        .relativeToRoot("SupportFiles/XCConfigs/\(xcconfigName).xcconfig")
    }
}
