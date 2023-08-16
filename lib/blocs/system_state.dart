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


