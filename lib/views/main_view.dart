import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/bloc/main/main_bloc.dart';
import 'package:recipes_app/views/favorites_view.dart';
import 'package:recipes_app/views/home_view.dart';
import 'package:recipes_app/views/my_recipes_view.dart';

import 'calc_view.dart';



class MainView extends StatefulWidget {
  MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> screens = [
    HomeView(),
    CalcView(),
    FavoritesView(),
    MyRecipesView(),
  ];

  int currentIndex = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<MainBloc>().add(GetMainEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (idx){
          setState(() {
            currentIndex = idx;
          });
        },
        
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu_book_sharp,
              size:  currentIndex == 0 ? 28.sp : 26.sp,
            ),
            label: 'RECIPES'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calculate,
              size:  currentIndex == 1 ? 28.sp : 26.sp,
            ),
            label: 'Калькулятор'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              size:  currentIndex == 2 ? 28.sp : 26.sp,
            ),
            label: 'Керек'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt_outlined,
              size:  currentIndex == 3 ? 28.sp : 26.sp,
            ),
            label: 'Менің рецепттерім'
          )
        ],
      ),
    );
  }
}