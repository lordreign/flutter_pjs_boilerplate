# flutter_pjs_boilerplate

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## json serializable
flutter pub run build_runner build

## 적용 라이브러리
```
bloc, flutter_bloc, hydrated_bloc > 상태관리 사용 > 좀더 보완필요...
hive: 독립적인 storage
flutter_dotenv: environment variable
json_annotation: json serialize에 사용.. 사용할만함..
easy_localization: localization 라이브러리
dio: http client
equatable: object 비교할때 편함
flutter_displaymode: 안드로이드에서 issue(https://github.com/flutter/flutter/issues/35162)를 고치는데 활용..
path_provider: hive의 저장 경로에 사용

// TODO
bloc, flutter_bloc, hydrated_bloc을 활용한 적절한 개발패턴 적용 필요...
```