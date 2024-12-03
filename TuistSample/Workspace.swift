//
//  Workspace.swift
//  TuistSampleManifests
//
//  Created by Importants on 12/4/24.
//

import ProjectDescription

let workspace = Workspace(
    name: "tuistSample",
    projects: [
        .path("projects/**")
    ]
)
