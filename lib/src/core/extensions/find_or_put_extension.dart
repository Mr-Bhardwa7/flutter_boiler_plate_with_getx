import 'package:get/get.dart';

extension FindOrPut on GetInterface {
  S findOrPut<S>(
    S dependency, {
    String? tag,
    bool permanent = false,
    InstanceBuilderCallback<S>? builder,
  }) {
    if (GetInstance().isRegistered<S>(tag: tag)) {
      return GetInstance().find<S>(tag: tag);
    }
    return GetInstance().put<S>(dependency, tag: tag, permanent: permanent);
  }
}
