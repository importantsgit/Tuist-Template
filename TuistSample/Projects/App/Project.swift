import ProjectDescription
import AppExtensions

let project = Project.app(
    name: Module.app.name,
    dependencies: [
        Module.utils
    ].map(\.project),
    resources: .default
)
