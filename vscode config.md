### tab轮询自动补全设置：

keybindings.json中配置

```json
[
    {
        "key": "tab",
        "command": "acceptSelectedSuggestion",
        "when": "suggestWidgetVisible && textInputFocus"
    },
    {
        "key": "shift+tab",
        "command": "acceptSelectedSuggestion",
        "when": "suggestWidgetVisible && textInputFocus"
    },
    {
        "key": "tab",
        "command": "selectNextSuggestion",
        "when": "editorTextFocus && suggestWidgetMultipleSuggestions && suggestWidgetVisible"
    },
    {
        "key": "shift+tab",
        "command": "selectPrevSuggestion",
        "when": "editorTextFocus && suggestWidgetMultipleSuggestions && suggestWidgetVisible"
    }
]
```

### 关闭预览模式

预览模式即打开新的文件会覆盖当前文件，不会另开新页面。

enablePreivew:false

### cursor blinking

关闭光标闪烁

## 快捷键

shift + f12 查看调用该函数的引用

在vim插件中自定义快捷键(vscode自定义快捷键的when实在是找不到哪个是非编辑模式)

```json
// settings.json
    // nmap
    "vim.normalModeKeyBindings": [
        {
            "before": ["<leader>","m"],
            "commands": [
                "highlightwords.addHighlight"   // 一个类似于mark.vim的单词高亮插件
            ]
        }
    ],
    
    // remote ssh
    "remote.SSH.remotePlatform": {
        "$remote_server_name": "linux",
    },
    "remote.SSH.path": "D:\\software\\Git\\usr\\bin\\ssh.exe",
```

remote ssh设置： 用win10自带的ssh会出现Bad owner or permissions on C:\\Users\\xxx/.ssh/config, 将ssh换成git带的后解决该问题
