import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Local/Component.dart';
import '../../Local/constants.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit(): super(HomeIntialStates());
  static HomeCubit get(context) => BlocProvider.of(context);
  List listCard = [
    createThreeMainCard(
        num: '18',
        firstWord: 'Successful',
        secondWord: 'delivered',
        colorOfCard: mainDarkColor),
    createThreeMainCard(
        num: '42',
        firstWord: 'Total',
        secondWord: 'picked up',
        colorOfCard: mainLightColor),
    createThreeMainCard(
        num: '53',
        firstWord: 'Cash',
        secondWord: 'collected',
        colorOfCard: grayColor,
        textColor: mainDarkColor),
  ];
  bool isConfirmThePath = false ;
  void onpressConfermPath(){
    isConfirmThePath = ! isConfirmThePath ;
    emit(HomePressedConferimPathStates());
  }


}