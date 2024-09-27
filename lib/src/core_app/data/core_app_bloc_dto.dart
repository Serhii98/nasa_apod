import 'package:nasa_apod/src/core/localization/lang_model.dart';

final class CoreAppBlocDto {
  CoreAppBlocDto({
    required this.langModel,
    required this.darkMode,
  });

  final LangModel langModel;
  final bool darkMode;

  CoreAppBlocDto copyWith({
    final LangModel? langModel,
    final bool? darkMode,
  }) {
    return CoreAppBlocDto(
      langModel: langModel ?? this.langModel,
      darkMode: darkMode ?? this.darkMode,
    );
  }
}
