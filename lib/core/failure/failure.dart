class Failure {
  final String message;

  const Failure({this.message = "Something went wrong"});
  @override
  String toString() {
    return message.toString();
  }
}