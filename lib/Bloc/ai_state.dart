part of 'ai_bloc.dart';

@immutable
sealed class AiState {}

final class AiInitial extends AiState {}
class AiBlocLoading extends AiState {}
class AiBlocLoaded extends AiState {}
class AiBlocErrror extends AiState {}