import "package:auth/auth.dart";
import "package:dio/dio.dart";
import "package:flutter_test/flutter_test.dart";
import "package:http_mock_adapter/http_mock_adapter.dart";
import "package:http_mock_adapter/src/handlers/request_handler.dart";

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  const String email = "email@example.com";
  const String password = "password";
  const String id = "1";

  setUp(() {
    dio = Dio(BaseOptions(validateStatus: (int? status) => true));
    dioAdapter = DioAdapter(dio: dio);
  });

  tearDown(() {
    dio.close();
  });

  group("Auth", () {
    group("register()", () {
      test("Success: should return a UserBase object", () async {
        dioAdapter.onPost(
          "/public/register",
          (MockServer e) => e.reply(200, <String, Object>{
            "_id": id,
            "email": email,
          }),
          data: <String, String>{
            "email": email,
            "password": password,
          },
        );

        final Auth auth = Auth(dio);
        final UserAuth userAuth = UserAuth(email: email, password: password);

        final UserBase result = await auth.register(userAuth);

        expect(result.id, id);
        expect(result.email, email);
        expect(result.name, isNull);
      });

      test("Failure: user already exists", () {
        dioAdapter.onPost(
          "/public/register",
          (MockServer e) => e.reply(403, null),
          data: <String, String>{"email": email},
        );

        final Auth auth = Auth(dio);
        final UserAuth userAuth = UserAuth(email: email, password: "password");

        expect(() async => await auth.register(userAuth),
            throwsA(isA<InvalidCredentialsException>()));
      });
    });

    group("login()", () {
      test("Success: should return a UserBase", () async {
        dioAdapter.onPost(
          "/public/login",
          (MockServer e) => e.reply(
            200,
            <String, dynamic>{
              "email": email,
              "_id": id,
            },
          ),
          data: <String, String>{
            "email": email,
            "password": password,
          },
        );

        final Auth auth = Auth(dio);

        final UserBase result =
            await auth.login(UserAuth(email: email, password: password));

        expect(result.id, id);
        expect(result.email, email);

        expect(auth.user, result);
      });

      test(
          "Failure: if user does not exist or the password is wrong, should throw InvalidCredentialsException",
          () {
        dioAdapter.onPost(
          "/public/login",
          (MockServer e) => e.reply(401, null),
          data: <String, String>{
            "email": email,
            "password": password,
          },
        );

        final Auth auth = Auth(dio);

        expect(
          () async =>
              await auth.login(UserAuth(email: email, password: password)),
          throwsA(isA<InvalidCredentialsException>()),
        );

        expect(auth.user, isNull);
      });
    });
  });
}
