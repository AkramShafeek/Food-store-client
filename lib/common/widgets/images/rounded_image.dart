import 'package:flutter/material.dart';
import 'package:food_store/utils/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.applyImageRadius = true,
    this.borderRadius = AppSizes.md,
    this.backgroundColor,
    required this.imageUrl,
  });

  final BoxFit? fit;
  final String imageUrl;
  final BoxBorder? border;
  final bool isNetworkImage;
  final double borderRadius;
  final double? width, height;
  final bool? applyImageRadius;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image(
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider),
        ),
      ),
    );
  }
}
