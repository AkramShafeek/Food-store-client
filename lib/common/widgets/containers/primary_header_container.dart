import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/custom%20shapes/curved_edges.dart';
import 'package:food_store/utils/constants/colors.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: Container(
        color: AppColors.primary,
        child: SizedBox(
          child: Stack(
            children: [
              /// Background decorations
              const BackgroundDecor1(),
              const BackgroundDecor2(),

              /// Render the child passed on top of background
              child
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundDecor2 extends StatelessWidget {
  const BackgroundDecor2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      right: -300,
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(400),
        ),
      ),
    );
  }
}

class BackgroundDecor1 extends StatelessWidget {
  const BackgroundDecor1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -150,
      right: -250,
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(400),
        ),
      ),
    );
  }
}
