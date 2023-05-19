# What to eat today

#### Video Demo:  [https://youtu.be/lRqUNJdXbFc]
#### Description:

I'm Jenway from Qingdao,China and this is my final project of Harvard CS50X 2023

It's a Flutter App to help me choose what to eat today,that,actually means what I'm gonna have in my school's cafeteria

It include 4 major files in lib\

- main.dart is the entrance of the app
- screens\home_screen.dart is the main interface of the app
- widgets\choice_card.dart is a widget that display strings in the home screen
- database\database_helper.dart provides method that read data from the database and return a random choice

The data of choices is stored in assets\database.db, which , i manually input the data into a .csv file then using sqlite's csv mode to get it

It actually will copy itself if there's no copy in `ApplicationDocumentsDirectory` , because i had thought about add a function for users to change the data 

> below are **not related** to the intro of the final project

## sdu_meal

山大今天吃什么,爱来自东里村的饭

> at the same time as my final project of CS50X 2023

## 这是什么

这是个用来决定吃什么的 APP ,Built with flutter 3.7

它的功能如下:

- 决定吃什么
- 没了

5 月 15 号的中午和 frd 在上英语课，突然想到这个点子，就花了一天写了这样一个十分简单乃至简陋的 APP ，老实说，写完之后点了两次我就不再打开它了，因为我就算得到一个随机的答案也照样会纠结...

我现在是很有打算拿这个来水 CS50 的 Final Project，虽然它和毛胚房没什么区别，但它确实是我基于用编程知识来解决生活问题的想法来做的

> 其实是拖延症拖延到快期末周了，事情太多了

### Material Design 3

打算开始写的时候发现 flutter 更新了，新版本支持 MD3 风格，我就打开了这个选项，你别说，还蛮好看的

### .db && sqlite

这个程序的逻辑非常直白，点一下按钮，随机从选项中显示一个 choice，随机很好说，掉包就行，这种东西总不需要手写随机算法，再者我也写不出来的喵🐱

众所周知，食堂的窗口有时是会变的，所以有必要提供可修改的接口，于是我就想起来上次在 CS50X 上那个用 Flask 框架的作业是用的 sqlite 数据库，这学期数据导论也教了点，于是我就用 .db 存数据

嘛，就是调用 flutter 里一个 `sqflite` 库写两句 SQL 语句，一点技术含量没有。

界面更是简陋的很，因为，原来这样一个简单功能的界面，我都不知道该怎么设计 /(ㄒoㄒ)/~~

**痛苦** 的是安卓文件系统，完全没有这方面经验的我在无数次碰壁后,开着 Android Studio 的 logcat 翻了大半天

我将 databae.db 放在了 `assets` 目录下，在编译时会被打包进 APK,但是该目录内的文件在程序打包发布以后就是只读的。

显然不满足可读写的要求，所以就要把他复制到`应用专属的文件目录`下

道理很简单，但写起来老是出错，给我气的半死，最后打 [Stackoverflow](https://stackoverflow.com/questions/65862680/importing-existing-sqlite-database-in-flutter) 上 copy 了一段代码跑成功了😵

这里用 `path_provider` 库的`getApplicationDocumentsDirectory` 方法获得 `应用专属的文件目录`

然后用 `rootBundle.load` 方法读取我用***挨个食堂窗口***记录下来的 CSV 转成的 database，复制到目标目录

> 然后我懒得写修改方法了哈哈

> 连同历史记录功能也一起咕咕咕了

写完后给 Jeff 看了看,原来 Jeff 的一个大二学长也用 flutter 做了一个 [题库 APP](https://github.com/Kelfvin/JianTi)，是用 `json` 存储的题库

有空试试用 json 存储数据

### 安卓 APK 的打包

这次打包出来发给 frd 用，结果 ta 手机显示这是 32位的，可能造成手机发热卡顿种种，我寻思我这玩意虽然简陋，但也比某些 APP 要节能吧啊喂

后来发现，`flutter build apk --split-per-abi` 命令会打包出来三个版本的 

- arm64-v8a: 64位支持，目前主流的版本
- armeabi-v7a: ARM v7
- x86_64: x86 架构的手机

我发的是 `armeabi-v7a` 版本的安装包，提示 32位是理所应当的，我把 `arm64-v8a` 的版本发过去，就没有这么多问题了

至于 iOS ，穷学生买不起 Mac ~(￣▽￣)~*

## CS50X 2023

这门课为我燃起了对计算机科学的热爱，让我难以忘怀，虽然这份 final project 很粗糙，但是，它是我为了解决生活中的问题所去写的，我觉得这十分契合要求

> All that we ask is that you build something of interest to you, that you solve an actual problem, that you impact your community, or that you change the world. Strive to create something that outlives this course.

改变世界我做不到，甚至连改变自己的忧郁也做不到，但是这就说明我还在走着吧，那么或许就有一点希望
