

String generateUniqueId(String suffix) {
  final DateTime now = DateTime.now();
  final int microsecondsSinceEpoch = now.microsecondsSinceEpoch;
  return suffix + microsecondsSinceEpoch.toString();
}