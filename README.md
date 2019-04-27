# daily

# 解决序列化(JSON): 使用codegen技术自动生成序列化对象
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
```dart
import 'package:json_annotation/json_annotation.dart';

part '<该文件名>.g.dart';
@JsonSerializable()
class <实体名> {
    // 字段们...

    <实体名>();

    %s
    factory <实体名>.fromJson(Map<String,dynamic> json) => _$<实体名>FromJson(json);
    Map<String, dynamic> toJson() => _$<实体名>ToJson(this);
}
```
