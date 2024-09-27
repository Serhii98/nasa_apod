import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateless_widget.dart';
import 'package:nasa_apod/src/ui/custom/get_progress.dart';
import 'package:nasa_apod/src/ui/custom/images/base_network_image_dto.dart';

class BaseNetworkImage extends BaseStatelessWidget {
  const BaseNetworkImage({required this.baseNetworkImageDto, super.key});

  final BaseNetworkImageDto baseNetworkImageDto;

  @override
  Widget build(final BuildContext context) {
    return CachedNetworkImage(
      height: baseNetworkImageDto.height,
      width: baseNetworkImageDto.width,
      fit: BoxFit.contain,
      imageUrl: baseNetworkImageDto.url,
      placeholder: (final _, final String url) => const GetProgress(),
      errorWidget: (final _, final String url, final Object error) =>
          const Icon(Icons.image_outlined),
    );
  }
}
