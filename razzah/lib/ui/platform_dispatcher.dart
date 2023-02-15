
import 'dart:ui';

typedef VoidCallback= void Function();

/// Signature for [PlatformDispatcher.onBeginFrame].
typedef FrameCallback= void Function(Duration duration);

/// Signature for [PlatformDispatcher.onReportTimings].
///
///
/// The callback takes a list of [FrameTiming] because