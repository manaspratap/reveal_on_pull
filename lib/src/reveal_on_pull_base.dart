import 'package:flutter/material.dart';

class RevealOnPull extends StatefulWidget {
  const RevealOnPull({
    required this.scrollController,
    required this.animationDuration,
    required this.widgetToRevealHeight,
    required this.widgetToReveal,
    required this.scrollableChild,
    super.key,
  });

  final ScrollController scrollController;
  final Duration animationDuration;
  final double widgetToRevealHeight;
  final Widget widgetToReveal;
  final Widget scrollableChild;

  @override
  State<RevealOnPull> createState() => _RevealOnPullState();
}

class _RevealOnPullState extends State<RevealOnPull> {
  double scrollOffset = 0;
  double previousScrollOffset = 0;

  bool isAnimationActive = false;

  void onPointerMove(PointerMoveEvent event) {
    final newScrollOffset = event.position.dy;
    if (newScrollOffset > previousScrollOffset) {
      // scrolling up
      if (widget.scrollController.hasClients &&
          widget.scrollController.position.extentBefore == 0) {
        // at start
        if (scrollOffset <= widget.widgetToRevealHeight) {
          // until widgetToReveal is completely revealed
          scrollOffset += event.delta.dy;
          if (scrollOffset > widget.widgetToRevealHeight) {
            scrollOffset = widget.widgetToRevealHeight;
          }
          isAnimationActive = false;
          setState(() {});
        }
      }
    } else if (newScrollOffset < previousScrollOffset) {
      // scrolling down
      if (scrollOffset >= 0) {
        // if widgetToReveal is visible, and
        // until widgetToReveal is completely hidden
        scrollOffset += event.delta.dy;
        if (scrollOffset < 0) {
          scrollOffset = 0;
        }
        isAnimationActive = false;
        // pause scrolling down when widgetToReveal is visible
        // to synchronize scroll
        widget.scrollController.jumpTo(0);
        setState(() {});
      }
    }
    previousScrollOffset = newScrollOffset;
  }

  void onPointerUp(PointerUpEvent event) {
    if (scrollOffset <= widget.widgetToRevealHeight) {
      // if pointer is up before widgetToReveal is in transition:
      // return to either start or completed state
      if (scrollOffset < widget.widgetToRevealHeight / 2) {
        resetOffsetValues(0);
      } else {
        resetOffsetValues(widget.widgetToRevealHeight);
      }
      isAnimationActive = true;
      setState(() {});
    }
  }

  void resetOffsetValues(double value) {
    scrollOffset = value;
    previousScrollOffset = value;
  }

  @override
  Widget build(BuildContext context) {
    // -1 in top position to cover off decimal rounding
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerMove: onPointerMove,
      onPointerUp: onPointerUp,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration:
                isAnimationActive ? widget.animationDuration : Duration.zero,
            top: scrollOffset - widget.widgetToRevealHeight - 1,
            child: widget.widgetToReveal,
          ),
          AnimatedPositioned(
            duration:
                isAnimationActive ? widget.animationDuration : Duration.zero,
            top: scrollOffset - 1,
            bottom: 0,
            left: 0,
            right: 0,
            child: widget.scrollableChild,
          ),
        ],
      ),
    );
  }
}
