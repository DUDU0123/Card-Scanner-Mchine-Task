part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final bool isLoading;
  final List<CardModel> cardDataList;
  const DashboardState({
    this.isLoading = false,
    this.cardDataList = const [],
  });

  @override
  List<Object> get props => [isLoading, cardDataList];
}

final class DashboardInitial extends DashboardState {}
