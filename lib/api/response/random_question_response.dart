import 'package:freezed_annotation/freezed_annotation.dart';

part 'random_question_response.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  createToJson: true,
  explicitToJson: true,
)
class RandomQuestionResponse {
  final String question;

  RandomQuestionResponse({
    required this.question,
  });

  factory RandomQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$RandomQuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RandomQuestionResponseToJson(this);
}
