import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/custom%20shapes/curved_card_image_edges.dart';
import 'package:food_store/utils/constants/sizes.dart';

class CurvedImageContainer extends StatelessWidget {
  const CurvedImageContainer({
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    required this.image,
    this.alignment = Alignment.center,
  });

  final double? height;
  final double? width;
  final BoxFit? fit;
  final String image;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomImageCurvedEdges(),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.md),
            topRight: Radius.circular(AppSizes.md),
            bottomRight: Radius.circular(AppSizes.md),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        height: height,
        width: width,
        child: Image(
          fit: fit,
          alignment: alignment,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
