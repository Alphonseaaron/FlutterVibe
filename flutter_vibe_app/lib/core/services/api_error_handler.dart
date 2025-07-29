import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/shared/utils/toast_handler.dart';
import 'package:http/http.dart' as http;

void handleApiError(BuildContext context, http.Response response) {
  switch (response.statusCode) {
    case 400:
      showToast(
        context: context,
        message: 'Bad request',
        level: ToastLevel.error,
      );
      break;
    case 401:
      showToast(
        context: context,
        message: 'Unauthorized',
        level: ToastLevel.error,
      );
      break;
    case 403:
      showToast(
        context: context,
        message: 'Forbidden',
        level: ToastLevel.error,
      );
      break;
    case 404:
      showToast(
        context: context,
        message: 'Not found',
        level: ToastLevel.error,
      );
      break;
    case 500:
      showToast(
        context: context,
        message: 'Internal server error',
        level: ToastLevel.error,
      );
      break;
    default:
      showToast(
        context: context,
        message: 'An unknown error occurred',
        level: ToastLevel.error,
      );
  }
}
