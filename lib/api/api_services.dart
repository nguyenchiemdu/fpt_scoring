import 'package:fpt_scoring/api/response/random_question_response.dart';
import 'package:fpt_scoring/api/response/submit_exam_response.dart';
import 'package:injectable/injectable.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@Injectable()
@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.addAll([
      LogInterceptor(
        requestHeader: true,
        request: true,
        requestBody: true,
        responseBody: true,
      ),
    ]);

  @lazySingleton
  ApiService get apiService =>
      ApiService(dio, baseUrl: 'https://fair-puma-badly.ngrok-free.app/');
}

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('random-question')
  Future<RandomQuestionResponse> getRandomQuestion();

  @POST('evaluate_student_answer')
  Future<SubmitExamResponse> submitExam({
    @Query('question', encoded: true) required String question,
    @Query('student_answer', encoded: true) required String answer,
  });
}

// TODO: add service locator later
class RegisterModuleImpl extends RegisterModule {}
