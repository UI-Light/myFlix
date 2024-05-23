import "package:flutter/material.dart";

class SliverDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  SliverDelegate({
    required this.height,
    required this.child,
  });

  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return height != oldDelegate.height || child != oldDelegate.child;
  }
}
