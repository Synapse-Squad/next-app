import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [FollowerBuilder] is a function that builds a widget that will be shown
typedef FollowerBuilder = Widget Function(
  BuildContext context,
  Size targetSize,
);

/// A widget that shows a popup relative to a target widget.
///
/// The popup is declaratively shown/hidden using an [OverlayPortalController].
///
/// It is positioned relative to the target widget using the [followerAnchor]'
/// and [targetAnchor] properties.
class AppPopup extends StatefulWidget {
  /// Creates a new [AppPopup] widget.
  const AppPopup({
    required this.child,
    required this.follower,
    required this.controller,
    this.offset = Offset.zero,
    this.followerAnchor = Alignment.topCenter,
    this.targetAnchor = Alignment.bottomCenter,
    this.onTap,
    this.onTapOutside,
    super.key,
    this.useTapToOpenPopup = false,
  });

  /// The target widget that will be used to position the follower widget.
  final Widget child;

  /// The widget that will be positioned relative to the target widget.
  final FollowerBuilder follower;

  /// The controller that will be used to show/hide the overlay.
  final OverlayPortalController controller;

  /// The alignment of the follower widget relative to the target widget.
  ///
  /// Defaults to [Alignment.topCenter].
  final Alignment followerAnchor;

  /// The alignment of the target widget relative to the follower widget.
  ///
  /// Defaults to [Alignment.bottomCenter].
  final Alignment targetAnchor;

  /// The offset of the follower widget relative to the target widget.
  /// This is useful for fine-tuning the position of the follower widget.
  ///
  /// Defaults to [Offset.zero].
  final Offset offset;

  /// A callback that is called when the target widget is tapped.
  final VoidCallback? onTap;

  /// A callback that is called when the target widget is tapped outside.
  final VoidCallback? onTapOutside;

  final bool useTapToOpenPopup;

  @override
  State<AppPopup> createState() => _AppPopupState();
}

class _AppPopupState extends State<AppPopup> {
  /// The link between the target widget and the follower widget.
  final _layerLink = LayerLink();
  final _tooltipKey = GlobalKey();
  Size _targetSize = Size.zero;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final tooltipBox =
            _tooltipKey.currentContext?.findRenderObject() as RenderBox?;
        _targetSize = tooltipBox?.size ?? Size.zero;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter:
          widget.useTapToOpenPopup ? null : (_) => widget.controller.show(),
      onExit: widget.useTapToOpenPopup ? null : (_) => widget.controller.hide(),
      child: TapRegion(
        onTapInside: (_) => widget.onTap?.call(),
        groupId: 1,
        child: CompositedTransformTarget(
          // Link the target widget to the follower widget.
          link: _layerLink,
          child: OverlayPortal(
            controller: widget.controller,
            overlayChildBuilder: (context) {
              // It is needed to wrap the follower widget in a widget that
              // fills the space of the overlay.
              // This is needed to make sure that the follower
              // widget is positioned
              // relative to the target widget.
              // If not wrapped, the follower widget will fill the screen and be
              // positioned incorrectly.
              return TapRegion(
                onTapOutside: (_) => widget.onTapOutside?.call(),
                child: Align(
                  child: CompositedTransformFollower(
                    // Link the follower widget to the target widget.
                    link: _layerLink,
                    // The follower widget should not be shown when
                    // the link is broken.
                    showWhenUnlinked: false,
                    followerAnchor: widget.followerAnchor,
                    targetAnchor: widget.targetAnchor,
                    offset: widget.offset,
                    child: widget.follower(context, _targetSize),
                  ),
                ),
              );
            },
            child: SizedBox(
              key: _tooltipKey,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
