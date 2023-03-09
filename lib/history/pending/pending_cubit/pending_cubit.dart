import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:serb_courier/history/pending/pending_cubit/pending_model.dart';

part 'pending_state.dart';

class PendingCubit extends Cubit<PendingState> {
  PendingCubit() : super(PendingInitial());
  static PendingCubit get(context)=>BlocProvider.of(context);
  var selectedIndex=0;
   List<String> trackingNum = [
    "#9862846214877",
    "#9862846214880",
    "#9862846214899"
  ];
  void removeItem(){

    trackingNum.removeAt(selectedIndex);
    emit(PendingRemove());
    print(trackingNum.length);
  }
  void selectedCurrentIndex(int index){
    selectedIndex=index;
    emit(PendingSelectedItemState());
  }
}
