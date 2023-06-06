import 'dart:async';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:recipes_app/bloc/main/main_bloc.dart';
import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/data_list.dart';
import 'package:recipes_app/constants/texts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/loader_wrapper.dart';
import 'package:recipes_app/toasts.dart';
import 'package:recipes_app/widgets/default_text_input.dart';

class RecipeWidget extends StatefulWidget {

  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  bool keyboardOpened = false;
  late StreamSubscription<bool> keyboardSub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    keyboardSub = KeyboardVisibilityController().onChange.listen((event) {
      print('OPENED');
      setState(() {
        keyboardOpened = event;
      }); 
    });
  }

  final formKey = GlobalKey<FormState>();
  String errorMain = 'Введите название';
  String errorDesc = 'Введите описание';

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  onTap(){
    if(formKey.currentState!.validate()){
      context.read<MainBloc>().add(CreateRecipeEvent(recipe: MyRecipe(
        title: titleController.text,
        description: descController.text,
        createdAt: DateTime.now()
      )));
      showSuccessAlertToast('Успешно создали рецепт!');
      Navigator.pop(context);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorStyles.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r)
          )
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: 450.h + (keyboardOpened ? 290.h : 0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Text('Создание рецепта', style: TextStyles(context).black_30_w300,),
              SizedBox(height: 40.h,),
              DefaultTextFormField(
                hint: 'Название',
                isBlack: true,
                controller: titleController,
                validator: (val){
                  return val!.length > 7 ? null : errorMain;
                }
              ),
              SizedBox(height: 10.h,),
              DefaultTextFormField(
                hint: 'Описание',
                isBlack: true,
                controller: descController,
                maxLines: 4,
              ),
              
              SizedBox(height: 20.h,),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorStyles.greyf1f1, width: 1.w),
                    borderRadius: BorderRadius.circular(15.r),
                    color: ColorStyles.primary,
                    boxShadow: [
                      BoxShadow(
                        color: ColorStyles.pink,
                        blurRadius: 8.w
                      )
                    ]
                  ),
                  alignment: Alignment.center,
                  child: Text('Создать рецепт', style: TextStyles(context).white_25_w800.copyWith(fontWeight: FontWeight.w400),)
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

}
