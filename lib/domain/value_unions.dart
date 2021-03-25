import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_unions.freezed.dart';

@freezed
class SocialShareWidget with _$SocialShareWidget {
  const factory SocialShareWidget.show() = _Show;
  const factory SocialShareWidget.edit() = _Edit;
  const factory SocialShareWidget.ask() = _Ask;
}
