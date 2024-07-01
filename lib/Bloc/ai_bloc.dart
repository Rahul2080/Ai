import 'package:ai/Repository/Api/Ai%20Api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/ModelClass/AiModel.dart';

part 'ai_event.dart';
part 'ai_state.dart';

class AiBloc extends Bloc<AiEvent, AiState> {
  late AiModel aiModel;
  AiApi aiApi=AiApi();
  AiBloc() : super(AiInitial()) {
    on<FeatchAi>((event, emit)async {
      emit (AiBlocLoading());
      try{aiModel =await aiApi.getai(event.id);
      emit(AiBlocLoaded());}
          catch(a){emit(AiBlocErrror());}
    });
  }
}
