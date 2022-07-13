import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/ui/home_page.dart';
import 'package:airplane/ui/settings_page.dart';
import 'package:airplane/ui/transaction_page.dart';
import 'package:airplane/ui/wallet_page.dart';
import 'package:airplane/ui/widgets/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingsPage();
        default:
          return HomePage();
      }
    }

    Widget costumBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigation(
                index: 0,
                imageUrl: 'assets/icon_home.png',
              ),
              CustomBottomNavigation(
                index: 1,
                imageUrl: 'assets/icon_booking.png',
              ),
              CustomBottomNavigation(
                index: 2,
                imageUrl: 'assets/icon_card.png',
              ),
              CustomBottomNavigation(
                index: 3,
                imageUrl: 'assets/icon_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: Stack(
            children: [
              buildContent(currentIndex),
              costumBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
