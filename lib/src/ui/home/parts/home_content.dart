import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nasa_apod/constants/app_strings.dart';
import 'package:nasa_apod/src/core/ui/states/base_controlled_stateless.dart';
import 'package:nasa_apod/src/ui/custom/images/base_network_image.dart';
import 'package:nasa_apod/src/ui/custom/images/base_network_image_dto.dart';
import 'package:nasa_apod/src/ui/home/bloc/home_bloc.dart';
import 'package:nasa_apod/src/ui/home/bloc/home_bloc_state.dart';
import 'package:nasa_apod/src/ui/home/parts/animated_text.dart';
import 'package:nasa_apod/src/utils/elvis.dart';
import 'package:nasa_apod/values/dimens.dart';

final class HomeContent
    extends BaseControlledStateless<HomeBlocState, HomeBloc> {
  const HomeContent({super.key});

  @override
  Widget onBuild(final BuildContext context, final HomeBlocState state) {
    return Center(
      child: Padding(
        padding: AppPaddings.allPaddingM,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              onTap: () => getBloc(context).navigateApodDetails(
                state.data?.apod.hdurl ?? AppStrings.emptyString,
              ),
              child: Hero(
                tag: state.data?.apod.hdurl ?? AppStrings.emptyString,
                child: BaseNetworkImage(
                  baseNetworkImageDto: BaseNetworkImageDto(
                    url: state.data!.apod.hdurl.orEmpty(),
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                ),
              ),
            ),
            const Gap(AppSizes.sizeM),
            const AnimatedText(),
          ],
        ),
      ),
    );
  }
}
