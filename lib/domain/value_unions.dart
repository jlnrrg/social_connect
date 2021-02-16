import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_unions.freezed.dart';

@freezed
abstract class SocialShareWidget with _$SocialShareWidget {
  const factory SocialShareWidget.show() = _Show;
  const factory SocialShareWidget.edit() = _Edit;
  const factory SocialShareWidget.ask() = _Ask;
}

@freezed
abstract class SocialAccountVisibility with _$SocialAccountVisibility {
  const factory SocialAccountVisibility.public() = _Public;
  const factory SocialAccountVisibility.onRequest() = _OnRequest;
}
