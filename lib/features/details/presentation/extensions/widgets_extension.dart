import 'package:flutter/material.dart';

extension SliverToBoxPadding on Widget {
  Widget get toSliver {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child:this,
      ),
    );
  }
}
