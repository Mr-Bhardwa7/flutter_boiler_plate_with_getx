import 'package:flutter_skeleton/src/core/utilities/dailog_helper.dart';
import 'package:flutter_skeleton/src/services/app_exceptions.dart';

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      DialogHelper.showErrorDialog(description: error.message);
    } else if (error is FetchDataException) {
      DialogHelper.showErrorDialog(description: error.message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(
        description: "Opps! It took longer to respond.",
      );
    }
  }

  showLoding(String message) {
    DialogHelper.showLoding(message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
