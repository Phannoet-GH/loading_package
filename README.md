# loading_package

[![pub package](https://img.shields.io/pub/v/loading_package.svg)](https://pub.dev/packages/loading_package)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A lightweight and customizable loading indicator package for Flutter applications. Easily display progress indicators, spinners, and loading overlays with custom colors, sizing, and status messages.

---

## Features

- ⚡ **Lightweight & Fast**: Minimal dependencies, easy to plug into any Flutter app.
- 🎨 **Highly Customizable**: Customize colors, dimensions, stroke widths, and animations.
- 💬 **Status Messages**: Option to display descriptive loading messages beneath the indicator.
- 📱 **Multi-Platform**: Seamlessly works on Android, iOS, Web, macOS, Windows, and Linux.

---

## Getting Started

### Installation

Run this command in your Flutter project terminal:

```bash
flutter pub add loading_package
```

Or add `loading_package` directly to your `pubspec.yaml` file:

```yaml
dependencies:
  loading_package: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## Usage

### 1. Import the package

```dart
import 'package:loading_package/loading_package.dart';
```

### 2. Basic Loading Indicator

Use the default loading indicator anywhere in your widget tree:

```dart
const Center(
  child: LoadingIndicator(),
)
```

### 3. Customized Loading Indicator

Customize the size, color, stroke width, and loading message:

```dart
LoadingIndicator(
  size: 50.0,
  color: Colors.blueAccent,
  strokeWidth: 4.0,
  message: 'Loading data, please wait...',
  messageStyle: TextStyle(
    fontSize: 16.0,
    color: Colors.grey[700],
    fontWeight: FontWeight.w500,
  ),
)
```

### 4. Popup Loading Dialog

Display a modal loading popup dialog during asynchronous operations:

```dart
// Show popup loading dialog
PopupLoading.show(
  context,
  message: 'Please wait...',
);

// Perform async task...
await Future.delayed(const Duration(seconds: 2));

// Dismiss popup loading dialog
PopupLoading.hide(context);
```

### 5. Full Example

```dart
import 'package:flutter/material.dart';
import 'package:loading_package/loading_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Loading Package Example'),
        ),
        body: const Center(
          child: LoadingIndicator(
            size: 45.0,
            color: Colors.deepPurple,
            strokeWidth: 4.0,
            message: 'Fetching information...',
          ),
        ),
      ),
    );
  }
}
```

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `size` | `double` | `40.0` | The diameter/dimension of the loading indicator. |
| `color` | `Color?` | `Theme primary` | Color of the progress spinner. |
| `strokeWidth` | `double` | `4.0` | Thickness of the spinner stroke. |
| `message` | `String?` | `null` | Optional text message displayed under the spinner. |
| `messageStyle` | `TextStyle?` | `null` | Text styling for the optional loading message. |
| `spacing` | `double` | `16.0` | Spacing between the indicator and the message. |

---

## Contributing

Contributions are welcome! If you encounter issues or have feature requests:

1. Fork the repository on [GitHub](https://github.com/Phannoet-GH/loading_package).
2. Create your feature branch (`git checkout -b feature/amazing-feature`).
3. Commit your changes (`git commit -m 'Add amazing feature'`).
4. Push to your branch (`git push origin feature/amazing-feature`).
5. Open a Pull Request.

To report bugs or suggest enhancements, please file an issue on the [Issue Tracker](https://github.com/Phannoet-GH/loading_package/issues).

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
