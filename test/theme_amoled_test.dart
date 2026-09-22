import 'package:fl_lib/fl_lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('toAmoled', () {
    test('a sheet is opaque, so the page it was raised over does not show', () {
      final theme = ThemeData(brightness: Brightness.dark).toAmoled;

      expect(theme.bottomSheetTheme.backgroundColor?.a, 1.0);
    });

    test('a sheet keeps what the theme already said about it', () {
      const shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      );
      final theme = ThemeData(
        brightness: Brightness.dark,
        bottomSheetTheme: const BottomSheetThemeData(
          shape: shape,
          showDragHandle: true,
        ),
      ).toAmoled;

      expect(theme.bottomSheetTheme.shape, shape);
      expect(theme.bottomSheetTheme.showDragHandle, isTrue);
    });
  });
}
