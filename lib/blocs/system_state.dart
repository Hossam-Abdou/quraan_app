part of 'system_cubit.dart';

@immutable
abstract class SystemState {}

class SystemInitial extends SystemState {}
class Systemindex extends SystemState {}

class GetSurahSuccess extends SystemState {}
class GetSurahError extends SystemState {
  String? error;

  GetSurahError(this.error);
}

class GetAyahSuccess extends SystemState {}
class GetAyahError extends SystemState {
  String? error;

  GetAyahError(this.error);
}

class GetAzkarSuccess extends SystemState {}
class GetAzkarError extends SystemState {
  String? error;

  GetAzkarError(this.error);
}

class GetSalahSuccess extends SystemState {}
class GetSalahError extends SystemState {
  String? error;

  GetSalahError(this.error);
}

class Bottom extends SystemState {}

class ChatRegisterloading extends SystemState {}
class ChatRegisterSuccess extends SystemState {}
class ChatRegisterError   extends SystemState {
  String error;

  ChatRegisterError({required this.error});
}

class ChatLoginloading extends SystemState {}
class ChatLoginSuccess extends SystemState {}
class ChatLoginError   extends SystemState {
  String error;

  ChatLoginError({required this.error});
}



