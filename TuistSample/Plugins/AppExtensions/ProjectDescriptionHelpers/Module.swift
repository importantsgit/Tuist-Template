//
//  Module.swift
//  AppExtensions
//
//  Created by Importants on 12/4/24.
//

import ProjectDescription

public enum Module {
    case app
    case utils
    
    public var name: String {
        switch self {
        case .app:
            return "App"
        case .utils:
            return "Utils"
        }
    }
    
    public var path: ProjectDescription.Path {
        .relativeToRoot("Projects/" + self.name)
    }
    
    public var project: TargetDependency {
        .project(target: self.name, path: self.path)
    }
}

extension Module: CaseIterable {}
