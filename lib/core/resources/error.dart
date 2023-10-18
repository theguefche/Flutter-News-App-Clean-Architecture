import 'dart:convert';

ApiError apiErrorFromJson(String str) => ApiError.fromJson(json.decode(str));

String apiErrorToJson(ApiError data) => json.encode(data.toJson());

class ApiError {
  final String cause;
  final String trace;
  final String message;
  final List<String>? details;

  ApiError({
    required this.cause,
    required this.trace,
    required this.message,
    this.details,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
        cause: json["cause"],
        trace: json["trace"],
        message: json["message"],
        details: json["details"] == null
            ? []
            : List<String>.from(json["details"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "cause": cause,
        "trace": trace,
        "message": message,
        "details":
            details == null ? [] : List<dynamic>.from(details!.map((x) => x)),
      };
}
