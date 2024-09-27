import 'package:nasa_apod/src/core/messaging/message_type.dart';

final class MessageDto {
  MessageDto({
    required this.message,
    required this.type,
  });

  final String message;
  final MessageType type;
}
