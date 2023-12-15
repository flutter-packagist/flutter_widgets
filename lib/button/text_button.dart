import 'package:flutter/material.dart';

enum IconPosition { left, right, top, bottom }

class WrapperTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final bool autofocus;
  final MaterialStatesController? statesController;
  final bool? isSemanticButton;
  final Widget? child;
  final String? text;
  final TextStyle? textStyle;
  final Color textColor;
  final double textSize;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? overlayColor;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;
  final double radius;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final Color? borderColor;
  final double? borderWidth;
  final BorderStyle? borderStyle;
  final double? elevation;
  final IconPosition? iconPosition;
  final Widget? icon;
  final Color? iconColor;
  final double? iconSize;
  final double? gap;
  final double? width;
  final double? height;
  final Size? minimumSize;
  final MaterialTapTargetSize? tapTargetSize;
  final bool enable;

  const WrapperTextButton({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.statesController,
    this.isSemanticButton,
    this.child,
    this.text,
    this.textStyle,
    this.textColor = Colors.black,
    this.textSize = 14,
    this.overflow,
    this.maxLines,
    this.backgroundColor,
    this.foregroundColor,
    this.overlayColor = Colors.transparent,
    this.shadowColor,
    this.surfaceTintColor,
    this.alignment,
    this.padding,
    this.shape,
    this.radius = 0,
    this.borderRadius,
    this.borderSide,
    this.borderColor = Colors.transparent,
    this.borderWidth,
    this.borderStyle,
    this.elevation,
    this.iconPosition = IconPosition.left,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.gap = 4,
    this.width,
    this.height,
    this.minimumSize,
    this.tapTargetSize,
    this.enable = true,
  }) : assert(child != null || text != null);

  @override
  Widget build(BuildContext context) {
    Widget child = Text(
      text ?? "",
      style: textStyle ??
          TextStyle(
            color: textColor.withOpacity(enable ? 1 : 0.5),
            fontSize: textSize,
          ),
      overflow: overflow,
      maxLines: maxLines,
    );
    if (this.child != null) {
      child = this.child!;
    }
    if (icon != null) {
      if (iconPosition == IconPosition.left) {
        child = Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            icon!,
            SizedBox(width: gap),
            Flexible(child: child)
          ],
        );
      } else if (iconPosition == IconPosition.right) {
        child = Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(child: child),
            SizedBox(width: gap),
            icon!
          ],
        );
      } else if (iconPosition == IconPosition.top) {
        child = Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            icon!,
            SizedBox(height: gap),
            Flexible(child: child)
          ],
        );
      } else if (iconPosition == IconPosition.bottom) {
        child = Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(child: child),
            SizedBox(height: gap),
            icon!
          ],
        );
      }
    }
    child = TextButton(
      onPressed: () {
        if (enable) onPressed.call();
      },
      style: style ??
          ButtonStyle(
            backgroundColor: resolve<Color?>(
              backgroundColor?.withOpacity(enable ? 1 : 0.5),
            ),
            foregroundColor: resolve<Color?>(
              foregroundColor?.withOpacity(enable ? 1 : 0.5),
            ),
            overlayColor: resolve<Color?>(
              overlayColor?.withOpacity(enable ? 1 : 0.5),
            ),
            shadowColor: resolve<Color?>(
              shadowColor?.withOpacity(enable ? 1 : 0.5),
            ),
            surfaceTintColor: resolve<Color?>(
              surfaceTintColor?.withOpacity(enable ? 1 : 0.5),
            ),
            shape: resolve<OutlinedBorder?>(shape ??
                RoundedRectangleBorder(
                  borderRadius:
                      borderRadius ?? BorderRadius.all(Radius.circular(radius)),
                  side: borderSide ??
                      BorderSide(
                        color: borderColor ?? const Color(0xFF000000),
                        width: borderWidth ?? 1,
                        style: borderStyle ?? BorderStyle.solid,
                      ),
                )),
            side: resolve<BorderSide?>(borderSide ??
                BorderSide(
                  color: borderColor ?? const Color(0xFF000000),
                  width: borderWidth ?? 1,
                  style: borderStyle ?? BorderStyle.solid,
                )),
            padding: resolve<EdgeInsetsGeometry?>(padding),
            elevation: resolve<double?>(elevation),
            iconColor: resolve<Color?>(
              iconColor?.withOpacity(enable ? 1 : 0.5),
            ),
            iconSize: resolve<double?>(iconSize),
            alignment: alignment,
            minimumSize: resolve<Size?>(minimumSize),
            tapTargetSize: tapTargetSize,
          ),
      child: child,
    );
    if (width != null || height != null) {
      child = SizedBox(
        width: width,
        height: height,
        child: child,
      );
    }
    return child;
  }

  MaterialStateProperty<T>? resolve<T>(T value) {
    return value == null ? null : MaterialStateProperty.all<T>(value);
  }
}
