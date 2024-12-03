//
//  Configuration+Extension.swift
//  AppExtensions
//
//  Created by Importants on 12/4/24.
//

import ProjectDescription

public extension Configuration {
    enum ConfigScheme: ConfigurationName, CaseIterable {
        case debug = "Debug"
        case stage = "Stage"
        case release = "Release"
        
        var URLscheme: String {
            switch self {
            case .release: return "\(Project.appName)"
            case .debug: return "\(Project.appName)-dev"
            case .stage: return "\(Project.appName)-stg"
            }
        }
    }
    
    static func configure(configurations: [ConfigScheme]) -> [Configuration] {
        configurations.map { configScheme -> Configuration in
            let configName = configScheme.rawValue
            let settings: SettingsDictionary = ["URL_SCHEMES": .string(configScheme.URLscheme)]
            
            return configName == .release ?
                .release(
                    name: configName,
                    settings: settings,
                    xcconfig: .xcconfigPath(configName.rawValue)
                ) :
                .debug(
                    name: configName,
                    settings: settings,
                    xcconfig: .xcconfigPath(configName.rawValue)
                )
        }
    }
}
