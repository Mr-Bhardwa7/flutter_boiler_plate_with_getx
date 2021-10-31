import 'package:flutter_skeleton/src/services/base_client.dart';

import 'base_controller.dart';

class TestController with BaseController {
  void getData() async {
    showLoding('Fetching Data...');
    var response = await BaseClient()
        .get("https://jsonplaceholder.typicode.com", "/todos/1")
        .catchError(handleError);

    if (response == null) return;
    hideLoading();
    print(response);
  }
}
