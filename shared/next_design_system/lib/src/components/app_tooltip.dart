import 'package:flutter/material.dart';

import '../core/base_app_popup.dart';

/// The position of the tooltip relative to the target widget.
enum TooltipPosition {
  /// The tooltip will be positioned at the top center of the target widget.
  topCenter,

  /// The tooltip will be positioned at the top left of the target widget.
  bottomCenter,

  /// The tooltip will be positioned at the top right of the target widget.
  bottomLeft,

  /// The tooltip will be positioned at the bottom center of the target widget.
  bottomRight,

  /// The tooltip will be positioned at the bottom left of the target widget.
  topLeft,

  /// The tooltip will be positioned at the bottom right of the target widget.
  topRight,

  /// The tooltip will be positioned at the left center of the target widget.
  leftCenter,

  /// The tooltip will be positioned at the left top of the target widget.
  leftTop,

  /// The tooltip will be positioned at the left bottom of the target widget.
  leftBottom,

  /// The tooltip will be positioned at the right center of the target widget.
  rightCenter,

  /// The tooltip will be positioned at the right top of the target widget.
  rightTop,

  /// The tooltip will be positioned at the right bottom of the target widget.
  rightBottom,
}

/// {@template app_tooltip}
/// A widget that shows a tooltip relative to a target widget.
/// {@endtemplate}
class AppTooltip extends StatefulWidget {
  /// {@macro app_tooltip}
  const AppTooltip({
    super.key,
    required this.title,
    this.subTitle,
    this.position = TooltipPosition.topCenter,
    required this.child,
  });

  /// The title of the tooltip.
  final String title;

  /// The subtitle of the tooltip.
  final String? subTitle;

  /// The position of the tooltip relative to the target widget.
  final TooltipPosition position;

  /// The target widget that will be used to position the tooltip.
  final Widget child;

  @override
  AppTooltipState createState() => AppTooltipState();
}

/// The state of the [AppTooltip] widget.
class AppTooltipState extends State<AppTooltip> {
  late final OverlayPortalController _controller;
  final _tooltipKey = GlobalKey();
  final _targetSize = ValueNotifier<Size>(Size.zero);

  @override
  void initState() {
    super.initState();
    _controller = OverlayPortalController();

    // Measure the tooltip size after the frame is rendered
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final tooltipBox =
            _tooltipKey.currentContext?.findRenderObject() as RenderBox?;
        _targetSize.value = tooltipBox?.size ?? Size.zero;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppPopup(
      follower: (context, targetSize) {
        return Tooltip(
          color: Colors.black,
          position: widget.position,
          title: widget.title,
          description: widget.subTitle,
          targetSize: targetSize,
        );
      },
      controller: _controller,
      followerAnchor: switch (widget.position) {
        TooltipPosition.topCenter => Alignment.bottomCenter,
        TooltipPosition.topLeft => Alignment.bottomLeft,
        TooltipPosition.topRight => Alignment.bottomRight,
        TooltipPosition.leftCenter => Alignment.centerRight,
        TooltipPosition.leftTop => Alignment.topRight,
        TooltipPosition.leftBottom => Alignment.bottomRight,
        TooltipPosition.rightCenter => Alignment.centerLeft,
        TooltipPosition.rightTop => Alignment.topLeft,
        TooltipPosition.rightBottom => Alignment.bottomLeft,
        TooltipPosition.bottomCenter => Alignment.topCenter,
        TooltipPosition.bottomLeft => Alignment.topLeft,
        TooltipPosition.bottomRight => Alignment.topRight,
      },
      targetAnchor: switch (widget.position) {
        TooltipPosition.topCenter => Alignment.topCenter,
        TooltipPosition.topLeft => Alignment.topLeft,
        TooltipPosition.topRight => Alignment.topRight,
        TooltipPosition.leftCenter => Alignment.centerLeft,
        TooltipPosition.leftTop => Alignment.topLeft,
        TooltipPosition.leftBottom => Alignment.bottomLeft,
        TooltipPosition.rightCenter => Alignment.centerRight,
        TooltipPosition.rightTop => Alignment.topRight,
        TooltipPosition.rightBottom => Alignment.bottomRight,
        TooltipPosition.bottomCenter => Alignment.bottomCenter,
        TooltipPosition.bottomLeft => Alignment.bottomLeft,
        TooltipPosition.bottomRight => Alignment.bottomRight,
      },
      offset: switch (widget.position) {
        TooltipPosition.topCenter => const Offset(0, -6),
        TooltipPosition.topLeft => const Offset(0, -6),
        TooltipPosition.topRight => const Offset(0, -6),
        TooltipPosition.leftCenter => const Offset(-6, 0),
        TooltipPosition.leftTop => const Offset(-6, 0),
        TooltipPosition.leftBottom => const Offset(-6, 0),
        TooltipPosition.rightCenter => const Offset(6, 0),
        TooltipPosition.rightTop => const Offset(6, 0),
        TooltipPosition.rightBottom => const Offset(6, 0),
        TooltipPosition.bottomCenter => const Offset(0, 6),
        TooltipPosition.bottomLeft => const Offset(0, 6),
        TooltipPosition.bottomRight => const Offset(0, 6),
      },
      child: widget.child,
    );
  }
}

/// {@template tooltip}
/// A widget that shows a tooltip.
/// {@endtemplate}
class Tooltip extends LeafRenderObjectWidget {
  /// {@macro tooltip}
  const Tooltip({
    super.key,
    required this.color,
    required this.position,
    required this.title,
    this.description,
    this.targetSize = Size.zero,
  });

  /// The color of the tooltip.
  final Color color;

  /// The position of the tooltip relative to the target widget.
  final TooltipPosition position;

  /// The title of the tooltip.
  final String title;

  /// The description of the tooltip.
  final String? description;

  /// The size of the target widget.
  final Size targetSize;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return TooltipBox(
      color: color,
      position: position,
      title: title,
      description: description,
      targetSize: targetSize,
    );
  }

  @override
  void updateRenderObject(BuildContext context, TooltipBox renderObject) {
    renderObject
      ..color = color
      ..position = position
      ..title = title
      ..description = description
      ..targetSize = targetSize;
  }
}

/// {@template tooltip_box}
/// A render object that paints a tooltip.
/// {@endtemplate}
class TooltipBox extends RenderBox {
  /// {@macro tooltip_box}
  TooltipBox({
    required Color color,
    required TooltipPosition position,
    required String title,
    Size targetSize = Size.zero,
    String? description,
  })  : _color = color,
        _position = position,
        _title = title,
        _description = description,
        _targetSize = targetSize,
        acceptedPosition = position;

  Color _color;

  /// get the color of the tooltip.
  Color get color => _color;

  /// set the color of the tooltip.
  set color(Color value) {
    if (_color == value) return;
    _color = value;
    markNeedsPaint();
  }

  TooltipPosition? _position;

  /// get the position of the tooltip.
  TooltipPosition get position => _position ?? TooltipPosition.bottomCenter;

  /// set the position of the tooltip.
  set position(TooltipPosition value) {
    if (_position == value) return;
    _position = value;
    markNeedsLayout();
  }

  String _title;

  /// get the title of the tooltip.
  String get title => _title;

  /// set the title of the tooltip.
  set title(String value) {
    if (_title == value) return;
    _title = value;
    markNeedsLayout();
  }

  /// get the description of the tooltip.
  String? _description;

  /// get the description of the tooltip.
  String get description => _description ?? '';

  /// set the description of the tooltip.
  set description(String? value) {
    if (_description == value) return;
    _description = value;
    markNeedsLayout();
  }

  Size _targetSize;

  /// get the size of the target widget.
  Size get targetSize => _targetSize;

  /// set the size of the target widget.
  set targetSize(Size value) {
    if (_targetSize == value) return;
    _targetSize = value;
    markNeedsLayout();
  }

  /// The painter for the title of the tooltip.
  TextPainter? titlePainter;

  /// The painter for the description of the tooltip.
  TextPainter? descriptionPainter;

  /// The position of the tooltip that will be used to calculate the layout.
  TooltipPosition acceptedPosition;

  @override
  void performLayout() {
    final titleSpan = TextSpan(
      text: _title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 18 / 12,
      ),
    );

    titlePainter = TextPainter(
      text: titleSpan,
      textDirection: TextDirection.ltr,
    );

    TextSpan? descriptionSpan;

    if (_description != null) {
      descriptionSpan = TextSpan(
        text: _description,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          height: 18 / 12,
          fontWeight: FontWeight.w500,
        ),
      );

      descriptionPainter = TextPainter(
        text: descriptionSpan,
        textDirection: TextDirection.ltr,
      );
    }

    titlePainter!.layout(maxWidth: 296);
    descriptionPainter?.layout(maxWidth: 296);

    final arrowSizeAdditionForWidth = switch (_position) {
      TooltipPosition.leftBottom ||
      TooltipPosition.leftTop ||
      TooltipPosition.leftCenter ||
      TooltipPosition.rightBottom ||
      TooltipPosition.rightTop ||
      TooltipPosition.rightCenter =>
        6,
      _ => 0,
    };

    final arrowSizeAdditionForHeight = switch (_position) {
      TooltipPosition.topCenter ||
      TooltipPosition.topLeft ||
      TooltipPosition.topRight ||
      TooltipPosition.bottomCenter ||
      TooltipPosition.bottomLeft ||
      TooltipPosition.bottomRight =>
        6,
      _ => 0,
    };

    size = Size(
      12 * 2 +
          (descriptionPainter?.width ?? titlePainter!.width) +
          arrowSizeAdditionForWidth,
      (descriptionPainter == null ? 8 : 12) * 2 +
          titlePainter!.height +
          (descriptionPainter == null ? 0 : 4) +
          (descriptionPainter?.height ?? 0) +
          arrowSizeAdditionForHeight,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    const arrowHeight = 6.0;

    if (_position == TooltipPosition.leftTop ||
        _position == TooltipPosition.leftBottom ||
        _position == TooltipPosition.rightTop ||
        _position == TooltipPosition.rightBottom) {
      final shouldCenter = size.height < 52;

      if (shouldCenter) {
        if (_position == TooltipPosition.leftTop ||
            _position == TooltipPosition.leftBottom) {
          acceptedPosition = TooltipPosition.leftCenter;
        } else if (_position == TooltipPosition.rightTop ||
            _position == TooltipPosition.rightBottom) {
          acceptedPosition = TooltipPosition.rightCenter;
        }
      }
    }

    final translationValue = switch (acceptedPosition) {
      TooltipPosition.topLeft ||
      TooltipPosition.topRight ||
      TooltipPosition.bottomLeft ||
      TooltipPosition.bottomRight =>
        _targetSize.width >= size.width ? 0 : 20 - _targetSize.width / 2,
      TooltipPosition.leftBottom ||
      TooltipPosition.leftTop ||
      TooltipPosition.rightBottom ||
      TooltipPosition.rightTop =>
        _targetSize.height >= size.height ? 0 : 20 - _targetSize.height / 2,
      _ => 0,
    };

    canvas.translate(
      switch (acceptedPosition) {
        TooltipPosition.topLeft ||
        TooltipPosition.bottomLeft =>
          -translationValue.toDouble(),
        TooltipPosition.topRight ||
        TooltipPosition.bottomRight =>
          translationValue.toDouble(),
        _ => 0.toDouble(),
      },
      switch (acceptedPosition) {
        TooltipPosition.rightTop ||
        TooltipPosition.leftTop =>
          -translationValue.toDouble(),
        TooltipPosition.rightBottom ||
        TooltipPosition.leftBottom =>
          translationValue.toDouble(),
        _ => 0.toDouble(),
      },
    );
    canvas.restore();

    final paint = Paint()
      ..color = _color
      ..style = PaintingStyle.fill;
    final path = Path();

    final maxTextWidth = descriptionPainter?.width ?? titlePainter!.width;
    final totalWidth = 12 * 2 + maxTextWidth;

    final rect = RRect.fromLTRBR(
      switch (acceptedPosition) {
        TooltipPosition.rightBottom ||
        TooltipPosition.rightTop ||
        TooltipPosition.rightCenter =>
          arrowHeight,
        _ => 0,
      },
      switch (acceptedPosition) {
        TooltipPosition.bottomLeft ||
        TooltipPosition.bottomCenter ||
        TooltipPosition.bottomRight =>
          arrowHeight,
        _ => 0,
      },
      switch (acceptedPosition) {
        TooltipPosition.rightBottom ||
        TooltipPosition.rightTop ||
        TooltipPosition.rightCenter =>
          totalWidth - arrowHeight,
        _ => totalWidth,
      },
      switch (acceptedPosition) {
        TooltipPosition.topRight ||
        TooltipPosition.topLeft ||
        TooltipPosition.topCenter =>
          size.height - arrowHeight,
        _ => size.height,
      },
      const Radius.circular(8),
    );
    canvas.drawRRect(rect, paint);

    final additionalTopOffsetForText = switch (acceptedPosition) {
      TooltipPosition.bottomLeft ||
      TooltipPosition.bottomRight ||
      TooltipPosition.bottomCenter =>
        arrowHeight,
      _ => 0,
    };

    final dyOffset = (descriptionPainter == null ? 8 : 12).toDouble() +
        additionalTopOffsetForText;
    titlePainter!.paint(canvas, Offset(12, dyOffset));
    descriptionPainter?.paint(
      canvas,
      Offset(12, dyOffset + titlePainter!.height + 4),
    );

    // Draw the arrow with rounded tip
    final centerDx = totalWidth / 2;
    const arrowWidth = 12.0;

    var startDx = 0.0;
    var endDx = 0.0;

    switch (acceptedPosition) {
      /// for bottom arrow
      case TooltipPosition.topCenter:
        startDx = centerDx - arrowWidth / 2;
        endDx = centerDx + arrowWidth / 2;
        path.moveTo(startDx, size.height - arrowHeight);
        path.lineTo(arrowWidth / 2 + startDx, size.height);
        path.lineTo(endDx, size.height - arrowHeight);
      case TooltipPosition.topLeft:
        startDx = 14;
        endDx = startDx + arrowWidth;
        path.moveTo(startDx, size.height - arrowHeight);
        path.lineTo(arrowWidth / 2 + startDx, size.height);
        path.lineTo(endDx, size.height - arrowHeight);
      case TooltipPosition.topRight:
        startDx = totalWidth - arrowWidth - 14;
        endDx = totalWidth - 14;
        path.moveTo(startDx, size.height - arrowHeight);
        path.lineTo(arrowWidth / 2 + startDx, size.height);
        path.lineTo(endDx, size.height - arrowHeight);

      /// for top arrow
      case TooltipPosition.bottomCenter:
        startDx = centerDx - arrowWidth / 2;
        endDx = centerDx + arrowWidth / 2;
        path.moveTo(startDx, arrowHeight);
        path.lineTo(arrowWidth / 2 + startDx, 0);
        path.lineTo(endDx, arrowHeight);
      case TooltipPosition.bottomLeft:
        startDx = 14;
        endDx = startDx + arrowWidth;
        path.moveTo(startDx, arrowHeight);
        path.lineTo(arrowWidth / 2 + startDx, 0);
        path.lineTo(endDx, arrowHeight);
      case TooltipPosition.bottomRight:
        startDx = totalWidth - arrowWidth - 14;
        endDx = totalWidth - 14;
        path.moveTo(startDx, arrowHeight);
        path.lineTo(arrowWidth / 2 + startDx, 0);
        path.lineTo(endDx, arrowHeight);

      /// for right arrow
      case TooltipPosition.leftCenter:
        path.moveTo(size.width - arrowHeight, size.height / 2 - arrowHeight);
        path.lineTo(size.width, size.height / 2);
        path.lineTo(size.width - arrowHeight, size.height / 2 + arrowHeight);
      case TooltipPosition.leftTop:
        path.moveTo(size.width - arrowHeight, 14);
        path.lineTo(size.width, 14 + arrowWidth / 2);
        path.lineTo(size.width - arrowHeight, 14 + arrowWidth);
      case TooltipPosition.leftBottom:
        path.moveTo(size.width - arrowHeight, size.height - 14);
        path.lineTo(size.width, size.height - 14 - arrowWidth / 2);
        path.lineTo(size.width - arrowHeight, size.height - 14 - arrowWidth);

      /// for left arrow
      case TooltipPosition.rightCenter:
        path.moveTo(arrowHeight, size.height / 2 - arrowWidth / 2);
        path.lineTo(0, size.height / 2);
        path.lineTo(arrowHeight, size.height / 2 + arrowWidth / 2);
      case TooltipPosition.rightTop:
        path.moveTo(arrowHeight, 14);
        path.lineTo(0, 14 + arrowWidth / 2);
        path.lineTo(arrowHeight, 14 + arrowWidth);
      case TooltipPosition.rightBottom:
        path.moveTo(arrowHeight, size.height - 14);
        path.lineTo(0, size.height - 14 - arrowWidth / 2);
        path.lineTo(arrowHeight, size.height - 14 - arrowWidth);
    }

    path.close();
    canvas.drawPath(path, paint);
  }
}
