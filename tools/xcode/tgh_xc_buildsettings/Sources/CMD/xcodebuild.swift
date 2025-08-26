import Foundation

extension CMD {
    struct xcodebuild {
        enum Action: String, Codable {
            case archive = "archive"
            case build = "build"
        }

        fileprivate struct BuildSettingsTargetDTO: Decodable {
            let action: Action
            let target: String
            let buildSettings: [String: String]
        }

        struct BuildSettings: CustomStringConvertible, Encodable {
            typealias TargetSettings = [String: String]
            let targets: [String: TargetSettings]
            
            fileprivate init(targetsDTO: [BuildSettingsTargetDTO]) throws {
                var targets: [String: TargetSettings] = [:]
                
                for target in targetsDTO {
                    targets[target.target] = target.buildSettings
                }
                                
                self.targets = targets
            }
            
            var description: String {
                prettyJsonString(object: self)
            }
        }

        static func showBuildSettings(dir: String? = nil, action: Action? = nil) throws -> BuildSettings {
            let tool = "/usr/bin/xcodebuild"
            var args = ["-showBuildSettings", "-json"]
            if let action {
                args.append(contentsOf: ["-action", action.rawValue])
            }
            let result = try run(tool: tool, dir: dir, arguments: args)
            
            guard result.exitCode == 0 else {
                throw result
            }
                        
            let targetsDTO = try JSONDecoder().decode([BuildSettingsTargetDTO].self, from: result.stdoutData)
            
            return try BuildSettings(targetsDTO: targetsDTO)
        }
    }
}
