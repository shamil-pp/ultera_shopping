import 'package:uuid/uuid.dart';

class Utils {
  static String generateRandomId() {
    return Uuid().v4();
  }
}
