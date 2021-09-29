# C 語言的第一個專案

使用 GNU Make 工具，建立 C 語言專案
使用以下工具鏈建立並編譯此專案

## 工具版本及環境紀錄

- GNU Make - 4.2.1
- GCC - 8.1.0
- GDB - 8.1
- Doxygen - 1.9.1 (選用)
    - XeLatex (選用)
- Visual Studio Code 字形 - [Fira Code](https://github.com/tonsky/FiraCode) (選用)

## 使用方式

在編譯之前請先確認所有的程式碼檔案是否都已存檔。

### 編譯方法

1. 編譯快捷鍵 (Visual Studio code)
    `Ctrl`+`Shift`+`B`
2. 編譯指令
    在 Terminal 中下 `make all` 命令

### 除錯方式

1. 整合介面下 Debug (Visual Studio Code)
    在程式碼頁面下按 `F5`
2. 在 Terminal 下 gdb <build>/<filename>.exe 命令
    > exe 檔 為 windows 執行檔副檔名，若不同作業系統請自行更換副檔名

### Makefile 自定義

1. 請自行視情況更換執行檔附檔名 .run(Linux) .exe(Windows)

### Visual Studio Code 建議套件

1. [C/C++ Compile Run](https://marketplace.visualstudio.com/items?itemName=danielpinto8zz6.c-cpp-compile-run)
    直接從 Command Terminal 或按“f6”或“f7”編譯並執行 C/C++ 打開的文件
2. [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
    C/C++ 擴展為 Visual Studio Code 添加了對 C/C++ 的程式語言支持，包括 IntelliSense 和除錯等功能。

# 相關文件
- [更新紀錄](./Documents/Update_History.md)
