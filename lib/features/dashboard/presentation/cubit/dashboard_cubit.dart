import 'package:business_card_scanner/core/data/model/card_model.dart';
import 'package:business_card_scanner/core/domain/usecase/get_all_card_data_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetAllCardDataUsecase getAllCardDataUsecase;
  DashboardCubit({
    required this.getAllCardDataUsecase,
  }) : super(DashboardInitial());

  void getAllCardData() {
    emit(DashboardState(isLoading: true));
    try {
      final res = getAllCardDataUsecase(params: null);
      res.fold((l) {
        emit(DashboardState(isLoading: false, cardDataList: state.cardDataList,));
      }, (data) {
        emit(DashboardState(isLoading: false, cardDataList: data, allCardData: data));
      },);
    } catch (e) {
      emit(DashboardState(isLoading: false, cardDataList: state.cardDataList));
    }
  }

  void searchCards(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(cardDataList: state.allCardData));
      return;
    }

    final filtered = state.allCardData.where((card) {
      return (card.name?.toLowerCase().contains(query.toLowerCase()) ?? false)||
            (card.email?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
            (card.phone?.toLowerCase().contains(query.toLowerCase()) ?? false);
    }).toList();

    emit(state.copyWith(cardDataList: filtered));
  }
}
