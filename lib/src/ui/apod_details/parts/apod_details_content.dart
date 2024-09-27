import 'package:flutter/material.dart';
import 'package:nasa_apod/src/core/ui/states/base_controlled_stateless.dart';
import 'package:nasa_apod/src/routing/router.dart';
import 'package:nasa_apod/src/ui/apod_details/bloc/apod_details_bloc.dart';
import 'package:nasa_apod/src/ui/apod_details/bloc/apod_details_bloc_state.dart';
import 'package:nasa_apod/src/ui/custom/images/base_network_image.dart';
import 'package:nasa_apod/src/ui/custom/images/base_network_image_dto.dart';
import 'package:nasa_apod/src/utils/elvis.dart';

final class ApodDetailsContent
    extends BaseControlledStateless<ApodDetailsBlocState, ApodDetailsBloc> {
  const ApodDetailsContent({super.key});

  @override
  Widget onBuild(final BuildContext context, final ApodDetailsBlocState state) {
    return InkWell(
      onTap: AppRouter().maybePop,
      child: Hero(
        tag: state.data!.url,
        child: BaseNetworkImage(
          baseNetworkImageDto: BaseNetworkImageDto(
            url: state.data!.url.orEmpty(),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
