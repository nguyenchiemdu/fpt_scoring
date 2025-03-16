import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_exam_response.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  createToJson: true,
  explicitToJson: true,
)
class SubmitExamResponse {
  @JsonKey(name: 'correct_answer')
  final String correctAnswer;
  final String score;

  SubmitExamResponse({
    required this.correctAnswer,
    required this.score,
  });

  factory SubmitExamResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitExamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitExamResponseToJson(this);
}
