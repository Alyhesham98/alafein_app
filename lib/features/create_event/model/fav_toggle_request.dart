import 'dart:convert';

class FavToggleRequest {
  int submissionId;

  FavToggleRequest({
    required this.submissionId,
  });

  @override
  String toString() {
    return 'Create(submissionId: $submissionId)';
  }

  factory FavToggleRequest.fromMap(Map<String, dynamic> data) =>
      FavToggleRequest(
        submissionId: data['submissionId'] as int,
      );

  Map<String, dynamic> toMap() => {
        'submissionId': submissionId,
      };

  factory FavToggleRequest.fromJson(String data) {
    return FavToggleRequest.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  FavToggleRequest copyWith({
    int? submissionId,
  }) {
    return FavToggleRequest(
      submissionId: submissionId ?? this.submissionId,
    );
  }
}
