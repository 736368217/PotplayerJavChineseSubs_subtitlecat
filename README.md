# PotPlayer SubtitleCat 字幕搜索插件

[![Platform](https://img.shields.io/badge/platform-Windows-blue)](https://potplayer.tv/)
[![Language](https://img.shields.io/badge/language-ActionScript-orange)](#)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Version](https://img.shields.io/badge/version-3.0-blue)](#版本说明)

为 [PotPlayer](https://potplayer.tv/) 提供的在线字幕搜索与下载插件，数据源来自 [SubtitleCat.com](https://www.subtitlecat.com)，去除文件名中的无效字符，优先选择中文字幕。**无需注册，无需 API 密钥，开箱即用**。

从 3.0 版本开始，插件会同时搜索 SubtitleCat 和迅雷字幕库；迅雷结果会添加 **`（迅雷）`** 标识。

---

## 目录

- [3.0 新功能](#30-新功能)
- [功能特性](#功能特性)
- [安装步骤](#安装步骤)
- [使用方法](#使用方法)
- [工作原理](#工作原理)
- [支持的语言](#支持的语言)
- [文件说明](#文件说明)
- [常见问题](#常见问题)
- [版本说明](#版本说明)
- [致谢](#致谢)
- [许可证](#许可证)

---

## 3.0 新功能

- 新增迅雷字幕源，与 SubtitleCat 搜索结果合并显示
- 迅雷字幕名称和保存文件名中会显示 **`（迅雷）`** 标识
- 支持直接下载迅雷返回的 `.srt`、`.ass` 等字幕格式
- SubtitleCat 无结果或暂时不可用时，仍会继续返回迅雷字幕

![迅雷字幕搜索结果](https://cdn.jsdelivr.net/gh/736368217/PotplayerJavChineseSubs_subtitlecat@main/image/QQ20260718-235316.png)

---

## 功能特性

- **双字幕源**：一次搜索同时查询 SubtitleCat 和迅雷字幕库
- **来源标识**：迅雷字幕统一在名称后显示 `（迅雷）`
- **独立容错**：一个字幕源不可用时，仍会保留另一个字幕源的结果
- **格式支持**：迅雷字幕支持接口返回的 `.srt`、`.ass` 等格式
- **零配置**：SubtitleCat.com 为公开访问网站，无需注册账号或申请 API 密钥
- **自动解析**：根据视频文件名自动提取电影/剧集标题，支持季/集号识别（`S01E02` 格式）
- **智能清理**：自动移除文件名中的网站前缀、视频扩展名、分辨率/画质标签（`-1080p`、`-4K`、`-FHD` 等）
- **中文优先**：搜索到字幕后优先下载中文（简体/繁体）字幕，若无中文则自动回退到任意 `.srt` 文件
- **超广语种覆盖**：内置 90+ 种语言的名称到代码映射表，UI 界面提供 27 种常用语言快速筛选
- **轻量高效**：单文件 ActionScript 实现，无外部依赖，即拷即用

---

## 安装步骤

### 1. 确保 PotPlayer 已更新至最新版本

从 [PotPlayer 官网](https://potplayer.tv/) 下载并安装最新版本。

### 2. 下载插件

下载本仓库中的两个文件：

| 文件 | 用途 |
|------|------|
| `SubtitleSearch - SubtitleCat.as` | 插件主程序（ActionScript 源代码） |
| `SubtitleSearch - SubtitleCat.ico` | 插件图标 |

### 3. 复制到 PotPlayer 插件目录

![1](https://cdn.jsdelivr.net/gh/736368217/PotplayerJavChineseSubs_subtitlecat@main/image/QQ20260709-115100.png)
![2](https://cdn.jsdelivr.net/gh/736368217/PotplayerJavChineseSubs_subtitlecat@main/image/QQ20260709-115134.png)

打开 PotPlayer，按 `F5` 打开 **选项** 面板，依次进入：

```
扩展功能 -> 在线字幕搜索 -> 打开文件夹
```

将上述两个文件复制到打开的文件夹中。

### 4. 验证安装

![3](https://cdn.jsdelivr.net/gh/736368217/PotplayerJavChineseSubs_subtitlecat@main/image/QQ20260709-115423.png)

在 PotPlayer 中打开任意视频，右键选择：

```
字幕 -> 在线字幕搜索 -> 在线字幕搜索设置
```

点击"再次搜索"可刷新列表。在搜索列表中看到 **SubtitleCat** 即表示安装成功。

---

## 使用方法

### 基本搜索

![4](https://cdn.jsdelivr.net/gh/736368217/PotplayerJavChineseSubs_subtitlecat@main/image/115247.png)


![5](https://cdn.jsdelivr.net/gh/736368217/PotplayerJavChineseSubs_subtitlecat@main/image/QQ20260709-115500.png)
1. 使用 PotPlayer 播放视频文件
2. 右键播放画面，选择 **字幕** -> **在线字幕搜索** -> **下载字幕**
3. 插件会自动根据文件名搜索匹配的字幕
4. 在结果列表中选中字幕，点击下载即可自动加载

### 迅雷字幕结果

![6](https://cdn.jsdelivr.net/gh/736368217/PotplayerJavChineseSubs_subtitlecat@main/image/QQ20260718-235316.png)

迅雷字幕会与 SubtitleCat 结果显示在同一列表中，文件名示例如下：

```text
SSNI-497（迅雷）.ass
SSNI-497（迅雷）.srt
```

### 快捷键绑定

可以在 PotPlayer 选项中为该功能绑定快捷键，提高操作效率：

1. 按 `F5` 打开选项
2. 进入 **快捷键** 项
3. 搜索"在线字幕搜索"并设置你偏好的快捷键

### 手动搜索

如果自动解析的文件名不准确（例如蓝光原盘的 `000000.m2ts`），可以点击搜索面板中的 **按标题搜索**，手动输入影片名称进行搜索。

### 电视剧搜索

插件支持电视剧的季/集号自动识别。例如：

- 文件名为 `Game.of.Thrones.S01E02.mkv` 时，自动搜索 `Game of Thrones S01E02`
- 文件名为 `Breaking.Bad.S03E05.1080p.mkv` 时，自动搜索 `Breaking Bad S03E05`

---

## 工作原理

插件通过解析 SubtitleCat.com 的网页内容来获取字幕信息，核心流程如下：

### 搜索流程

```
视频文件名 -> 清理标题（移除扩展名/分辨率标签等）
           -> 拼接搜索 URL（/index.php?search=标题）
           -> HTTP GET 获取搜索结果 HTML
           -> 解析 HTML，提取字幕子页面链接和标题
           -> 返回搜索结果列表（最多 60 条）
```

### 下载流程

```
选择字幕 -> 进入字幕详情页
         -> 解析页面中的 .srt 文件链接
         -> 优先匹配 zh-CN / zh-TW 中文链接
         -> 无中文时回退到任意 .srt 链接
         -> 通过 translate_from_server_folder() 函数兜底解析
         -> 返回字幕文件内容
```

### 迅雷搜索与下载流程

```
清理后的标题 -> 请求迅雷字幕接口
             -> 解析字幕名称、格式和下载地址
             -> 在名称后添加“（迅雷）”标识
             -> 合并到 PotPlayer 搜索结果
             -> 通过迅雷直链下载所选字幕
```

SubtitleCat 和迅雷使用独立的解析与下载分支，一个来源失败不会阻断另一个来源。

### 标题清理规则

插件会按以下顺序清理原始文件名：

1. 移除类似 `xxx.com@` 或 `xxx.net@` 的网站前缀
2. 移除视频文件扩展名（`.mp4`、`.mkv`、`.avi`、`.wmv`、`.mov`、`.ts`、`.m2ts` 等 20 种格式）
3. 循环移除末尾的清晰度/画质标签（`-4K`、`-1080p`、`-720p`、`-480p`、`-HD`、`-FHD`、`-UHD`、`-SD` 等）

---

## 支持的语言

插件内置了 90 种以上的语言代码映射，以下是 PotPlayer 界面中可直接选择的 27 种语言：

| 语言 | 代码 | 语言 | 代码 | 语言 | 代码 |
|------|------|------|------|------|------|
| English | `en` | French | `fr` | German | `de` |
| Spanish | `es` | Italian | `it` | Portuguese | `pt` |
| Russian | `ru` | Arabic | `ar` | Dutch | `nl` |
| Swedish | `sv` | Norwegian | `no` | Finnish | `fi` |
| Polish | `pl` | Turkish | `tr` | Thai | `th` |
| Vietnamese | `vi` | Indonesian | `id` | Hindi | `hi` |
| Japanese | `ja` | Korean | `ko` | Danish | `da` |
| Greek | `el` | Hungarian | `hu` | Czech | `cs` |
| Romanian | `ro` | Simplified Chinese | `zh-CN` | Traditional Chinese | `zh-TW` |

后端支持的完整语种列表（90+ 种）见源代码中的 `InitLangMap()` 函数。

---

## 文件说明

```
.
├── README.md                              # 项目说明文档
├── LICENSE                                # MIT 许可证
├── SubtitleSearch - SubtitleCat.as        # 插件源代码（ActionScript）
└── SubtitleSearch - SubtitleCat.ico       # 插件图标
```

### 源代码结构

| 函数 | 行号 | 功能 |
|------|------|------|
| `InitLangMap()` | 12-143 | 初始化 90+ 种语言的名称到代码映射表 |
| `LangTable` | 145-174 | PotPlayer UI 显示的 27 种语言列表 |
| `HtmlSpecialCharsDecode()` | 176-186 | HTML 实体解码 |
| `IsVideoExtension()` | 188-195 | 判断字符串是否为视频文件扩展名 |
| `CleanTitle()` | 197-256 | 清理视频标题（去前缀/去扩展名/去画质标签） |
| `GetTitle()` | 258-261 | 返回插件名称 |
| `GetVersion()` | 263-266 | 返回插件版本号 |
| `GetDesc()` | 268-271 | 返回插件描述信息 |
| `GetLanguages()` | 283-297 | 返回 UI 支持的语言代码列表 |
| `ServerCheck()` / `ServerLogin()` | 299-309 | 认证桩方法（SubtitleCat 无需登录） |
| `MapLangCode()` | 311-318 | 语言名称到代码的映射 |
| `SubtitleWebSearch()` | 320-344 | 构建 SubtitleCat 的网页搜索 URL |
| `SubtitleSearch()` | 346-421 | 核心搜索功能，解析搜索结果 HTML |
| `SubtitleDownload()` | 423-516 | 核心下载功能，提取字幕文件下载链接 |

3.0 版本新增的核心函数：

| 函数 | 功能 |
|------|------|
| `ExtractJAVCode()` | 提取并规范化 JAV 番号 |
| `AppendXunleiResults()` | 请求迅雷字幕接口并合并搜索结果 |
| `SubtitleDownload()` 迅雷分支 | 识别迅雷结果并通过直链下载字幕 |

---

## 常见问题

### Q: 插件搜索不到字幕？

- 检查网络连接是否正常，确保可以访问 `subtitlecat.com`
- 尝试手动输入影片标题搜索
- 如果影片较新或较为冷门，可能 SubtitleCat 暂无对应字幕

### Q: 为什么只显示一个字幕源的结果？

- 两个来源相互独立。某个来源没有匹配字幕、响应超时或暂时无法访问时，插件仍会显示另一个来源成功返回的结果

### Q: 如何识别迅雷字幕？

- 迅雷字幕名称和保存文件名中都带有 **`（迅雷）`** 标识，例如 `SSNI-497（迅雷）.srt`

### Q: 下载的字幕与视频不同步？

- 这通常是由于字幕版本与视频版本不匹配导致（如帧率不同、片头时长不同等）
- 可以在 PotPlayer 中使用快捷键 `[`（延迟字幕）和 `]`（提前字幕）进行微调

### Q: 是否需要注册 SubtitleCat 账号？

- 不需要。SubtitleCat.com 为完全公开访问的免费字幕网站，插件以访客模式工作


---

## 版本说明

### 3.0

- 集成迅雷字幕搜索与直接下载
- 搜索结果增加“（迅雷）”来源标识
- 保留 SubtitleCat 中文搜索与下载功能
- 提升单一字幕源不可用时的容错能力

---

## 致谢

- 本项目基于 [Exhen/PotplayerChineseSubs_assrt](https://github.com/Exhen/PotplayerChineseSubs_assrt) 的插件框架开发
- 字幕数据来源于 [SubtitleCat.com](https://www.subtitlecat.com)，感谢该网站提供的免费字幕服务
- 感谢 [Simon7612](https://github.com/Simon7612) 的贡献
- 感谢迅雷字幕服务提供可用的字幕检索结果

---

## 许可证

本项目采用 [MIT License](LICENSE) 开源协议。

---
## Star History

<a href="https://www.star-history.com/?repos=736368217%2FPotplayerJavChineseSubs_subtitlecat&type=date&legend=top-left">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/chart?repos=736368217/PotplayerJavChineseSubs_subtitlecat&type=date&theme=dark&legend=top-left&sealed_token=bvdFN4vh1ZQyIdAfREZB4AsVCHRmEwo6k1VKj5DWJXtCU5fx4AIwMdpkpRJC57GWFhvc2cAZokOG6-qbDNnLI0icH-Q_t6PDi4rmCD2jbo5TwxzfSWmUn-M-udpwfH8Y19wUqm5Z6Lzf9vNbH1TQW5SLhq_mxj4mSj7Ywr7LlNC_oJMR3IUhm2J0QVE4" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/chart?repos=736368217/PotplayerJavChineseSubs_subtitlecat&type=date&legend=top-left&sealed_token=bvdFN4vh1ZQyIdAfREZB4AsVCHRmEwo6k1VKj5DWJXtCU5fx4AIwMdpkpRJC57GWFhvc2cAZokOG6-qbDNnLI0icH-Q_t6PDi4rmCD2jbo5TwxzfSWmUn-M-udpwfH8Y19wUqm5Z6Lzf9vNbH1TQW5SLhq_mxj4mSj7Ywr7LlNC_oJMR3IUhm2J0QVE4" />
   <img alt="Star History Chart" src="https://api.star-history.com/chart?repos=736368217/PotplayerJavChineseSubs_subtitlecat&type=date&legend=top-left&sealed_token=bvdFN4vh1ZQyIdAfREZB4AsVCHRmEwo6k1VKj5DWJXtCU5fx4AIwMdpkpRJC57GWFhvc2cAZokOG6-qbDNnLI0icH-Q_t6PDi4rmCD2jbo5TwxzfSWmUn-M-udpwfH8Y19wUqm5Z6Lzf9vNbH1TQW5SLhq_mxj4mSj7Ywr7LlNC_oJMR3IUhm2J0QVE4" />
 </picture>
</a>
