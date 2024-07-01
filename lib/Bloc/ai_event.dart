part of 'ai_bloc.dart';

@immutable
sealed class AiEvent {}
class FeatchAi extends AiEvent{
  final String id;
  FeatchAi ({required this.id});
}