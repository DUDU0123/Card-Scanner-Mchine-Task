import 'package:business_card_scanner/core/constants/app_colors.dart';
import 'package:business_card_scanner/core/constants/app_constraints.dart';
import 'package:business_card_scanner/core/data/model/card_model.dart';
import 'package:business_card_scanner/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:business_card_scanner/features/dashboard/presentation/widgets/card_data_show_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});


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
      body: BlocBuilder<DashboardCubit, DashboardState>(
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
      },)
    );
  }
}