import 'package:business_card_scanner/core/constants/app_colors.dart';
import 'package:business_card_scanner/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:business_card_scanner/features/dashboard/presentation/widgets/card_data_show_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    getAllCards();
    super.initState();
  }

  Future<void> getAllCards() async{
    context.read<DashboardCubit>().getAllCardData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saved Contacts',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return getAllCards();
        },
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            if (state.isLoading) {
              return CircularProgressIndicator(color: AppColors.accentMidColor,);
            }
          return state.cardDataList.isEmpty
            ? const Center(
                child: Text(
                  'No contacts saved yet',
                  style: TextStyle(fontSize: 16),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.cardDataList.length,
                itemBuilder: (context, index) {
                  return CardDataShowCard(cardModel: state.cardDataList[index]);
                },
              );
        },),
      )
    );
  }
}