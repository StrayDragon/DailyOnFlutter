# Functional Description
- [项目描述](doc/ProjectDescription.md)

# TODO (优先级从高到低):
---
- 及时的文档更新
## '挑战' 功能模块
- [ ] 界面设计 (基础UI/UX)
- [ ] 原型设计 (基础架构)
  - [ ] 数据层设计 (Data Layer)
  - [ ] 逻辑层设计 (Business Logical Layer)
  - [ ] 表示层设计 (Presentation Layer)
- [ ] (*.ics)ICalendar格式文件生成器(generator)和解析器(parser), 用于将每日的时间总结至日历, 方便周,月,年级别的总结
## 通用的UI组件 (UI Components(Widgets))
- [ ] 抽离`StackingCardsWidget`,`StackingCard` 为一个可供外部调用的通用组件

# Tech Gaps
---
## 解决序列化(JSON): 使用codegen技术自动生成序列化对象

- 在项目根目录下:
```bash
#  生成序列化定义
flutter packages pub run build_runner build
```
```bash
# 持续生成
flutter packages pub run build_runner watch
```
- 模板
  - 已调好 `djson` 为 Live Templates 触发键

# UI/UX Packages
---
| 类型::介绍与仓库                                             |                           展示动画                           |
| :----------------------------------------------------------- | :----------------------------------------------------------: |
| UI::[炫酷的翻转卡片动效](https://github.com/hnvn/flutter_flip_panel) | ![img](https://github.com/hnvn/flutter_flip_panel/raw/master/screenshots/flip_image.gif?raw=true)![img](https://github.com/hnvn/flutter_flip_panel/raw/master/screenshots/flip_clock.gif?raw=true) |
| UI::[过场Loading动效](https://github.com/jogboms/flutter_spinkit) | ![img](https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/RotatingPlane.gif)![img](https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/Wave.gif) |
| UX::[页面跳转](https://github.com/roughike/page-transformer) | ![PageTransformer sample.](https://github.com/FlutterRocks/page-transformer/raw/master/page_transform_sample.gif) |
| UX::[升级版Drawer](https://github.com/RafaelBarbosatec/hidden_drawer_menu) | <img src="https://github.com/RafaelBarbosatec/hidden_drawer_menu/raw/master/imgs/app2.gif" style="zoom:50%"/> |
| UX::[下拉刷新](https://github.com/aagarwal1012/Liquid-Pull-To-Refresh) | <img src="https://github.com/aagarwal1012/Liquid-Pull-To-Refresh/raw/master/display/liquid.gif?raw=true" style="zoom:50%"/> |
| UX::[圆角卡片列表](https://github.com/ariedov/flutter_snaplist) | ![Showscase gif](https://camo.githubusercontent.com/290da53945fac576d9d362ffe40bcdf836def643/68747470733a2f2f6d656469612e67697068792e636f6d2f6d656469612f3237625448616c797765566f6332707353322f67697068792e676966) |
| UX::[菜单按钮(悬浮球?)](https://github.com/xqwzts/flutter_radial_menu) | ![img](https://github.com/xqwzts/flutter_radial_menu/raw/master/screenshots/demo.gif) |
| UX::[单词小卡片](https://github.com/Ivaskuu/tinder_cards)    | ![Focus for Reddit preview](https://camo.githubusercontent.com/8f5d8d602a62b97584a8fcc7f7c719e48c847d07/68747470733a2f2f692e696d6775722e636f6d2f504d3941684c582e676966) |



