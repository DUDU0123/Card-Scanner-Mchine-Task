part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final bool isLoading;
  final List<CardModel> cardDataList;
  final List<CardModel> allCardData;
  const DashboardState({
    this.isLoading = false,
    this.cardDataList = const [],
    this.allCardData = const [],
  });

  DashboardState copyWith({
    bool? isLoading,
    List<CardModel>? cardDataList,
    List<CardModel>? allCardData,
  }){
    return DashboardState(
      allCardData: allCardData ?? this.allCardData,
      cardDataList: cardDataList ?? this.cardDataList,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [isLoading, cardDataList, allCardData];
}

final class DashboardInitial extends DashboardState {}
