import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:safe_password_with_hasura/src/config/firebase_initialize.dart';

/// Custom FlutterError to handle the error reporting.
///
/// This class require Firebase initialize
class AnalyticsError {
  void _initCrashlytics() {
    while (FirebaseInitialize().initialized == false) {
      Future.delayed(const Duration(milliseconds: 100));
    }
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  /// This method is used to report the error to the Firebase Crashlytics.
  ///
  /// This method wrap the [runZonedGuarded] method to handle
  /// the error reporting.
  Future<void> zoneGuarded(
    Future<void> Function() safeFunction,
  ) async {
    runZonedGuarded(
      () async {
        await safeFunction();
        _initCrashlytics;
      },
      (error, stackTrace) async {
        kDebugMode
            ? null
            : await FirebaseCrashlytics.instance.recordError(error, stackTrace);
      },
    );
  }
}
