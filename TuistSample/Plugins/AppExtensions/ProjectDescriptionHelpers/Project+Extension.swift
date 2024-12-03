//
//  Project+Extensions.swift
//  AppExtensions
//
//  Created by Importants on 12/4/24.
//

import ProjectDescription

extension Project {
    public static func project(
        name: String,
        product: Product,
        deploymentTargets: DeploymentTargets,
        schemes: [Scheme] = [],
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return Project(
            name: name,
            targets: [
                .target(
                    name: name,
                    destinations: .iOS,
                    product: product,
                    bundleId: self.teamId + name,
                    deploymentTargets: deploymentTargets,
                    infoPlist: .file(path: Path.plistPath("Info")),
                    sources: ["Sources/**"],
                    resources: resources,
                    dependencies: dependencies,
                    settings: .settings(
                        configurations: Configuration.configure(configurations: Configuration.ConfigScheme.allCases)
                    )
                ),
                .target(
                    name: "\(name)Tests",
                    destinations: .iOS,
                    product: .unitTests,
                    bundleId: self.teamId + "\(name)Tests",
                    infoPlist: .file(path: Path.plistPath("Info")),
                    sources: ["Tests/**"],
                    dependencies: [.target(name: name)]
                ),
            ],
            schemes: schemes
        )
    }

    public static func app(
        name: String,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        self.project(
            name: name,
            product: .app,
            deploymentTargets: self.deployTarget,
            dependencies: dependencies,
            resources: resources
        )
    }

    public static func framework(
        name: String,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        self.project(
            name: name,
            product: .framework,
            deploymentTargets: self.deployTarget,
            dependencies: dependencies,
            resources: resources
        )
    }

}

