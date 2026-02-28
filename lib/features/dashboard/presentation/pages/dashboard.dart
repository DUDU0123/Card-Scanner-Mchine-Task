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
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    getAllCards();
    super.initState();
  }

  Future<void> getAllCards() async{
    context.read<DashboardCubit>().getAllCardData();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: TextField(
        controller: searchController,
        decoration: const InputDecoration(
          hintText: 'Search contacts...',
          border: InputBorder.none,
        ),
        onChanged: (value) {
          context.read<DashboardCubit>().searchCards(value);
        },
      ),
      centerTitle: true,
    ),
      body: SafeArea(
        child: RefreshIndicator(
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
        ),
      )
    );
  }
}