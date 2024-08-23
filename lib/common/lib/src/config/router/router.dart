import "package:auth/auth.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "../../../common.dart";

part "router.impl.dart";

abstract class AppRouter {
  factory AppRouter() => _AppRouterImpl();

  GoRouter get router;
}
