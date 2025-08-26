
struct NormalizedBuildSettings: Encodable, CustomStringConvertible {
    struct Target: Encodable {
        private let keys = [
            "PATH",
            "USER",
            "UID",
            "HOME",
            "DEVELOPER_DIR",
            "LEGACY_DEVELOPER_DIR",
            "PROJECT_DIR",
            "BUILD_DIR",
            "TARGET_BUILD_DIR",
            // Cache
            "CACHE_ROOT",
            "CCHROOT",
            "CLANG_MODULES_BUILD_SESSION_FILE",
            "COMPILATION_CACHE_CAS_PATH",
            "SDK_STAT_CACHE_DIR",
            "SDK_STAT_CACHE_PATH",
            "DEPLOYMENT_TARGET_SUGGESTED_VALUES",
            "AVAILABLE_PLATFORMS"
        ]

        private(set) var variables: [String: String]
        private(set) var buildSettings: [String: String]
        
        init(target: CMD.xcodebuild.BuildSettings.TargetSettings) {
            variables = [:]
            buildSettings = target
            
            for key in keys {
                moveToVars(key: key)
            }
        }
        
        private mutating func moveToVars(key: String) {
            if let value = buildSettings[key] {
                variables[key] = value
                for (settingKey, settingValue) in buildSettings {
                    buildSettings[settingKey] = settingValue.replaceXCConfig(value: value, with: "$\(key)")
                }
            }
        }
    }
    
    let targets: [String: Target]
    
    init(buildSttings: CMD.xcodebuild.BuildSettings) {
        var targets: [String: Target] = [:]
        for (targetKey, target) in buildSttings.targets {
            targets[targetKey] = Target(target: target)
        }
        self.targets = targets
    }
    
    var description: String {
        return prettyJsonString(object: self.targets)
    }
}
