import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/colors/app_colors.dart';
import '../../utils/app_utils.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorWidget;
  final BlendMode? colorBlendMode;
  final FilterQuality filterQuality;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final int? maxWidthDiskCache;
  final int? maxHeightDiskCache;
  final bool grayBackground;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.width,
    this.height,
    this.errorWidget,
    this.placeholder,
    this.colorBlendMode,
    this.filterQuality = FilterQuality.low,
    this.memCacheWidth,
    this.memCacheHeight,
    this.maxWidthDiskCache,
    this.maxHeightDiskCache,
    this.grayBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholderFadeInDuration: const Duration(milliseconds: 1500),
      placeholder: placeholder ??
          (_, __) => const Center(
                child: CupertinoActivityIndicator(radius: 12),
              ),
      errorWidget: errorWidget ??
          (_, __, ___) => Ink(
                width: width,
                height: height,
                decoration: const BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius6,
                  color: LightThemeColors.textFieldBackGround,
                ),
                child: Center(
                  child: SvgPicture.asset('assets/svg/ic_no_image.svg'),
                ),
              ),
      width: width,
      height: height,
      fit: fit,
      colorBlendMode: grayBackground ? BlendMode.multiply : colorBlendMode,
      color: grayBackground ? LightThemeColors.imageBg : null,
      filterQuality: filterQuality,
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      maxWidthDiskCache: maxWidthDiskCache,
      maxHeightDiskCache: maxHeightDiskCache,
    );
  }
}
