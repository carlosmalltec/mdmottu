import 'package:equatable/equatable.dart';

class RequestAuth extends Equatable {
  final String? login;
  final String? password;

  const RequestAuth({this.login, this.password});

  RequestAuth copyWith({String? login, String? password}) => RequestAuth(
        login: login ?? this.login,
        password: password ?? this.password,
      );

  toMap() => {'login': login, 'senha': password};

  @override
  List<Object?> get props => [login, password];
}
