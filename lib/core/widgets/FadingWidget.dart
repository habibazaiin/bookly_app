// flutter_fading_widget.dart
// Reusable fading wrapper that receives a child and animates it in/out.
// Usage: Wrap any widget you want to fade in/out with FadingWidget.

import 'package:flutter/material.dart';

/// FadingWidget
/// - [child]: the widget to display (required)
/// - [duration]: animation duration (default 450ms)
/// - [curve]: animation curve (default Curves.easeInOut)
/// - [delay]: optional delay before animation starts
/// - [placeholder]: optional widget shown until the first fade-in completes
/// - [autoPlay]: if true will play the fade-in on mount
/// - [repeat]: if true will keep fading in/out (useful for subtle attention animation)
class FadingWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration? delay;
  final Widget? placeholder;
  final bool autoPlay;
  final bool repeat;
  final bool fadeOutOnDispose;
  final VoidCallback? onEnd;

  const FadingWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 450),
    this.curve = Curves.easeInOut,
    this.delay,
    this.placeholder,
    this.autoPlay = true,
    this.repeat = false,
    this.fadeOutOnDispose = false,
    this.onEnd,
  }) : super(key: key);

  @override
  State<FadingWidget> createState() => _FadingWidgetState();
}

class _FadingWidgetState extends State<FadingWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  bool _showPlaceholder = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _opacity = CurvedAnimation(parent: _controller, curve: widget.curve);

    _showPlaceholder = widget.placeholder != null;

    if (widget.autoPlay) {
      if (widget.delay != null) {
        Future.delayed(widget.delay!, () {
          if (!mounted) return;
          _play();
        });
      } else {
        _play();
      }
    }

    if (widget.repeat) {
      _controller.addStatusListener((s) {
        if (s == AnimationStatus.completed) _controller.reverse();
        else if (s == AnimationStatus.dismissed) _controller.forward();
      });
    }

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // After the first fade in, hide placeholder
        if (_showPlaceholder) setState(() => _showPlaceholder = false);
        widget.onEnd?.call();
      }
    });
  }

  void _play() {
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant FadingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If child changed and we want to re-run animation
    if (oldWidget.child.key != widget.child.key) {
      _showPlaceholder = widget.placeholder != null;
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    if (widget.fadeOutOnDispose) {
      // try to animate out quickly before disposing
      try {
        _controller.reverse().then((_) {});
      } catch (_) {}
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If a placeholder is provided and still active, cross-fade
    if (_showPlaceholder && widget.placeholder != null) {
      return AnimatedBuilder(
        animation: _opacity,
        builder: (context, _) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Opacity(opacity: 1 - _opacity.value, child: widget.placeholder),
              Opacity(opacity: _opacity.value, child: widget.child),
            ],
          );
        },
      );
    }

    // Simple fade for the child
    return FadeTransition(opacity: _opacity, child: widget.child);
  }
}

