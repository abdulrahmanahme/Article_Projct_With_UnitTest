import 'package:artical/core/networking/error_message_model.dart';

class ServerExtension implements Exception {
  final ErrorMessageModel errorMessageModel;
  const ServerExtension({required this.errorMessageModel});
}
