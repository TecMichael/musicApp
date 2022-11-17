class GenericResponse {
  String? message;
  bool? error;
  // this is a class function
  GenericResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
  }
}
