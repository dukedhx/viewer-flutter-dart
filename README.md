[![License](http://img.shields.io/:license-mit-blue.svg)](http://opensource.org/licenses/MIT)
[![Autodesk Forge](https://img.shields.io/badge/Autodesk-Forge-orange.svg)](https://forge.autodesk.com/)
[![Flutter](https://img.shields.io/badge/Flutter-Dart-green.svg)](https://flutter.dev/)
[![Platform](https://img.shields.io/badge/Platform-iOS|Android|Web-green.svg)](https://forge.autodesk.com/)

## Description

Original blog: https://forge.autodesk.com/blog/kick-start-2020-cross-platform-viewer-apps-flutter

Sample project to load Viewer models locally for cross-platform apps built with Flutter.

The wheel never stops in the developer's world and Flutter is gaining huge momentum for recent years so let's see how one should build Viewer Apps with Flutter today and our demo would cover how to load models locally from within client! In fairness it's not exactly as straight forward to bundle Viewer models with the apps and we had addressed this topic here, here and here previously. But with the advent of such a massive game changer like Flutter there goes all the pain and anguish so let the fun begin right away!

# Why Flutter

Flutter is Google's UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase, AOT (Ahead Of Time) compiled to fast, predictable, native code, which allows almost all of Flutter to be written in Dart - a sound typed, client-optimized, object-oriented, class defined, garbage-collected language using a C -style syntax for apps on multiple platforms, server and clients alike. This not only makes Flutter fast, virtually everything (including all the widgets) can be customized.

# Project Structure

- `assets`: static resources including Viewer HTML and SVF model files
- `android`: scaffolded/generated Android platform code
- `ios`: scaffolded/generated iOS platform code
- `lib`: Flutter Dart code

Surely we'd still need to fall back as always to WebView to load Viewer scripts as well as the models since Viewer is yet to be implemented in any native form. However we'd be able to load models as bundled resources by starting a local http server on client and it gets even better: we'd be able to build to iOS, Android and even web targets using exactly the same Dart code and Flutter project/dependencies settings! Now let's walk through the dependencies as well the structure of our sample app here:

- Jaguar: client side http server
- Jaguar Flutter asset:  serve Flutter assets 
- Flutter WebView plugin: WebView module for iOS, Android and Web  
- Flutter icon plugin: custom icons and splash screens

# Setup and Run

## Prerequisites
- [Flutter](https://flutter.dev/docs/get-started/editor)
- [iOS](https://flutter.dev/docs/get-started/editor)
- [Android](https://flutter.dev/docs/get-started/editor), when integrating with existing projects be sure to migrate to [Androidx](https://developer.android.com/jetpack/androidx/) since it’s required by the “flutter_webview_plugin”.

## Setup

- Clone project: https://github.com/dukedhx/viewer-flutter-dart
- Set up your favorite IDE with Flutter
- Put your SVF model files to the “assets” folder and change the URL in `assets/index.html` to point to the SVF entry file accordingly (see here to download the SVF files from Forge)
- If you place your model files in other directory than `assets/model` make sure the path is referenced in `pubspec.yaml`:

```

flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true
  assets:
      - assets/
      - assets/model/
      - path/to/your/model/
      - path/to/your/model/subdirs
      # ...
```

- Verify Flutter installation and readiness: `flutter doctor`
- Set up pods if you haven’t: `pod setup`
- Navigate to project folder and set up the dependencies: `flutter get pub`
 

## Build and Run:

- Run on emulators: `flutter run`
- Build to platform targets: `flutter build ios` / `flutter build apk`

# Q&A

> Blank screen/WebView won't load?

The Jaguar server won't resolve the serve future somehow on some oses/devices so set up a timer for the WebView to load after a few secs while the server gets started:

```
    final server = Jaguar();
    //...
    server.serve(); //

    Timer timer = new Timer(new Duration(seconds: 5), () =>
    flutterWebviewPlugin.launch('http://localhost:8080/',
        rect: new Rect.fromLTWH(
          0.0,
          100.0,
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height - 100,
    )));
```

Also try use the IP addr `127.0.0.1` instead of `localhost`

> The `Flutter WebView plugin` won't compile?

when integrating with existing projects be sure to migrate to [Androidx](https://developer.android.com/jetpack/androidx/) since it’s required by the “flutter_webview_plugin”.


# License

[MIT](http://opensource.org/licenses/MIT)

# Written By

[Bryan Huang](https://www.linkedin.com/in/bryan-huang-1447b862) - Forge Partner Development https://forge.autodesk.com
