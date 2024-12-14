import 'package:flutter/material.dart';
import 'package:next_design_system/next_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// This file does not exist yet,
// it will be generated in the next step
import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightThemeData = ThemeData(
      extensions: [AppTheme.light()],
      scaffoldBackgroundColor: Colors.white,
    );

    final darkThemeData = ThemeData(
      extensions: [AppTheme.dark()],
      scaffoldBackgroundColor: Colors.black,
    );

    return Widgetbook.material(
      directories: directories,
      integrations: [
        WidgetbookCloudIntegration(),
      ],
      addons: [
        // AccessibilityAddon(),
        TextScaleAddon(
          initialScale: 1.0,
          min: 1.0,
          max: 1.5,
        ),
        ZoomAddon(),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: lightThemeData,
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: darkThemeData,
            )
          ],
          initialTheme: WidgetbookTheme(
            name: 'Light',
            data: lightThemeData,
          ),
        ),
        DeviceFrameAddon(
          devices: [
            ...Devices.ios.all,
            ...Devices.android.all,
            ...Devices.macOS.all,
          ],
          initialDevice: Devices.ios.iPhone13ProMax,
        ),
        InspectorAddon(),
        AlignmentAddon(),
        // BuilderAddon(
        //   name: 'SafeArea',
        //   builder: (_, child) => ColoredBox(
        //     color: Colors.white,
        //     child: child,
        //   ),
        // ),
      ],
    );
  }
}
