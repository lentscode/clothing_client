import "package:auth/auth.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:shared/shared.dart";
import "package:wardrobe/wardrobe.dart";

import "../../../common.dart";

part "router.impl.dart";

/// App router.
abstract class AppRouter {
  /// Creates a new instance of [AppRouter].
  factory AppRouter() => _AppRouterImpl();

  /// Gets the [GoRouter] instance.
  GoRouter get router;
}
