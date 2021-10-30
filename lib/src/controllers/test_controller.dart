import 'package:voice_split/src/controllers/base_controller.dart';
import 'package:voice_split/src/services/base_client.dart';

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
