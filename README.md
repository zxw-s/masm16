# MASM README（16位）

> 经典 **16 位 DOS 实模式汇编**项目，基于 MASM + TLINK 编译，适用于 DOSBox / Masm32 环境，实现基础汇编功能演示。

## 📁 目录结构

```Plain
masm16-demo/├── src/            # 汇编源码目录│   └── main.asm    # 主程序源码├── build/          # 编译产物（obj/exe/map，自动生成）├── Makefile        # 一键编译脚本├── README.md       # 项目说明└── .gitignore      # 忽略编译产物
```

## 🔧 编译环境

依赖工具：**MASM.exe、TLINK.exe**

运行环境：DOSBox / Windows 32位控制台 / Masm32 工具集

主流配置：使用 DOSBox 运行 16 位程序，解决 64 位系统不兼容问题

## ⚙️ 编译与运行

### 一键编译（推荐）

```Plain
makemake runmake clean
```

### 手动编译命令

```Plain
# 1. 汇编：asm -> objmasm src/main.asm build/main.obj;# 2. 链接：obj -> exetlink build/main.obj,build/main.exe;# 3. 运行build/main.exe
```

注：命令末尾分号表示**跳过所有交互提问**，直接静默编译

## 📝 编译参数说明

- **masm**：微软16位汇编编译器，将汇编源码编译为目标文件 .obj

- **tlink**：16位链接器，将obj文件链接为可执行 .exe 文件

- 16位程序仅支持 DOS 实模式，无法直接在 64 位 Windows 原生终端运行

## 🚩 常见问题

- `masm/tlink 不是内部命令`：未配置工具环境变量，需将 MASM 工具目录加入环境变量

- `64位系统无法运行`：使用 DOSBox 模拟器运行 16 位程序

- 编译无报错但黑屏/无输出：检查程序是否缺少 `int 21h` 中断退出逻辑

# Git提交规范

```plain
feat: 新增xxx汇编demo
fix: 修复汇编链接报错
docs: 更新README说明
refactor: 重构汇编代码
```

## 📄 开源协议

MIT License
