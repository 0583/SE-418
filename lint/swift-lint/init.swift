swiftlint(
    mode: :lint,                            // SwiftLint模式: :lint (默认) 或者 :autocorrect
    executable: "Pods/SwiftLint/swiftlint", // SwiftLint的程序路径 (可选的). 对于用CocoaPods集成SwiftLint时很重要
    path: "/path/to/lint",                  // 特殊的检查路径 (可选的)
    output_file: "swiftlint.result.json",   // 检查结果输出路径 (可选的)
    reporter: "json",                       // 输出格式 (可选的)
    config_file: ".swiftlint-ci.yml",       // 配置文件的路径 (可选的)
    files: [                                // 指定检查文件列表 (可选的)
        "AppDelegate.swift",
        "path/to/project/Model.swift"
    ],
    ignore_exit_status: true,               // 允许fastlane可以继续执行甚至是Swiftlint返回一个非0的退出状态(默认值: false)
    quiet: true,                            // 不输出像‘Linting’和‘Done Linting’的状态日志 (默认值: false)
    strict: true                            // 发现警告时报错? (默认值: false)
)