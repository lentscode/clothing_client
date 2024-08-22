import "package:auth/auth.dart";
import "package:bloc_test/bloc_test.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";

import "../../mocks.dart";

void main() {
  late Auth auth;
  const String email = "email@example.com";
  const String password = "password";
  const String id = "1";

  setUp(() {
    auth = MockAuth();
    registerFallbackValue(UserAuth(email: email, password: password));
  });

  group("AuthCubit", () {
    group("Initial state", () {
      test("initial state: register", () {
        final AuthCubit cubit = AuthCubit(
          loginUseCase: (String email, String password) => LoginUseCase(
            email: email,
            password: password,
            auth: auth,
          ),
          registerUseCase: (String email, String password) => RegisterUseCase(
            auth: auth,
            email: email,
            password: password,
          ),
        );
        expect(cubit.state, isA<AuthInitial>());
        expect(cubit.state.mode, AuthMode.register);
      });

      test("initial state: login", () {
        final AuthCubit cubit = AuthCubit(
            loginUseCase: (String email, String password) => LoginUseCase(
                  email: email,
                  password: password,
                  auth: auth,
                ),
            registerUseCase: (String email, String password) => RegisterUseCase(
                  auth: auth,
                  email: email,
                  password: password,
                ),
            initialMode: AuthMode.login);
        expect(cubit.state, isA<AuthInitial>());
        expect(cubit.state.mode, AuthMode.login);
      });
    });
    
    group("Registration", () {
      blocTest<AuthCubit, AuthState>(
        "Success: on register call, should emit AuthLoading and AuthSuccess",
        build: () => AuthCubit(
          loginUseCase: (String email, String password) => LoginUseCase(
            email: email,
            password: password,
            auth: auth,
          ),
          registerUseCase: (String email, String password) => RegisterUseCase(
            auth: auth,
            email: email,
            password: password,
          ),
        ),
        setUp: () {
          when(() => auth.register(any())).thenAnswer(
            (_) async => UserBase(id: id, email: email),
          );
        },
        act: (AuthCubit cubit) => cubit.call(email, password),
        expect: () => <TypeMatcher<AuthState>>[isA<AuthLoading>(), isA<AuthSuccess>()],
        verify: (AuthCubit cubit) {
          expect(cubit.state, isA<AuthSuccess>());
          expect((cubit.state as AuthSuccess).user.email, email);
        },
      );

      blocTest<AuthCubit, AuthState>(
        "Failure: should emit AuthError",
        build: () => AuthCubit(
          loginUseCase: (String email, String password) => LoginUseCase(
            email: email,
            password: password,
            auth: auth,
          ),
          registerUseCase: (String email, String password) => RegisterUseCase(
            email: email,
            password: password,
            auth: auth,
          ),
        ),
        setUp: () => when(() => auth.register(any())).thenThrow(Exception()),
        act: (AuthCubit cubit) => cubit.call(email, password),
        expect: () => <TypeMatcher<AuthState>>[isA<AuthLoading>(), isA<AuthError>()],
        verify: (AuthCubit cubit) {
          expect(cubit.state, isA<AuthError>());
        },
      );
    });

    group("Login", () {
      blocTest<AuthCubit, AuthState>(
        "Success: on register call, should emit AuthLoading and AuthSuccess",
        build: () => AuthCubit(
          loginUseCase: (String email, String password) => LoginUseCase(
            email: email,
            password: password,
            auth: auth,
          ),
          registerUseCase: (String email, String password) => RegisterUseCase(
            auth: auth,
            email: email,
            password: password,
          ),
          initialMode: AuthMode.login,
        ),
        setUp: () {
          when(() => auth.login(any())).thenAnswer(
            (_) async => UserBase(id: id, email: email),
          );
        },
        act: (AuthCubit cubit) => cubit.call(email, password),
        expect: () => <TypeMatcher<AuthState>>[isA<AuthLoading>(), isA<AuthSuccess>()],
        verify: (AuthCubit cubit) {
          expect(cubit.state, isA<AuthSuccess>());
          expect((cubit.state as AuthSuccess).user.email, email);
        },
      );

      blocTest<AuthCubit, AuthState>(
        "Failure: should emit AuthError",
        build: () => AuthCubit(
          loginUseCase: (String email, String password) => LoginUseCase(
            email: email,
            password: password,
            auth: auth,
          ),
          registerUseCase: (String email, String password) => RegisterUseCase(
            email: email,
            password: password,
            auth: auth,
          ),
          initialMode: AuthMode.login,
        ),
        setUp: () => when(() => auth.login(any())).thenThrow(Exception()),
        act: (AuthCubit cubit) => cubit.call(email, password),
        expect: () => <TypeMatcher<AuthState>>[isA<AuthLoading>(), isA<AuthError>()],
        verify: (AuthCubit cubit) {
          expect(cubit.state, isA<AuthError>());
        },
      );
    });

    group("Switch Modes", () {
      blocTest<AuthCubit, AuthState>("",
          build: () => AuthCubit(
                loginUseCase: (String email, String password) => LoginUseCase(
                  email: email,
                  password: password,
                  auth: auth,
                ),
                registerUseCase: (String email, String password) => RegisterUseCase(
                  email: email,
                  password: password,
                  auth: auth,
                ),
              ),
          act: (AuthCubit cubit) => cubit.switchMode(),
          expect: () => <TypeMatcher<AuthState>>[isA<AuthState>()],
          verify: (AuthCubit cubit) => expect(cubit.state.mode, AuthMode.login));
    });
  });
}
