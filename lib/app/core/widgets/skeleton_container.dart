import 'package:festpay_pocket_app/app/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SkeletonContainer extends StatefulWidget {
  final double height;
  final double width;
  final Widget? child;
  final List<Color>? colors;
  final BorderRadiusGeometry? borderRadius;

  const SkeletonContainer({
    super.key,
    this.height = 24,
    this.width = 200,
    this.child,
    this.colors,
    this.borderRadius,
  });

  @override
  State<StatefulWidget> createState() => SkeletonState();
}

class SkeletonState extends State<SkeletonContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation gradientPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    )..addListener(() {
        setState(() => {});
      });

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(gradientPosition.value, 0),
          end: Alignment.centerLeft,
          colors: widget.colors ??
              [
                AppTheme.colors.lightGray,
                AppTheme.colors.lightGray2,
                AppTheme.colors.lightGray3,
              ],
        ),
        borderRadius: widget.borderRadius ?? BorderRadius.circular(2),
      ),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
