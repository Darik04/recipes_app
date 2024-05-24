import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/bloc/main/main_bloc.dart';
import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/texts/text_styles.dart';



class CalcView extends StatefulWidget {
  const CalcView({super.key});

  @override
  State<CalcView> createState() => _CalcViewState();
}

class _CalcViewState extends State<CalcView> {

  bool isMale = true;

  TextEditingController weightController = TextEditingController(text: '60');
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();



  int negativeCalories = 0;
  int normalCalories = 0;
  int gymCalories = 0;


  final formKey = GlobalKey<FormState>();


  void onCalc(){
    if(formKey.currentState!.validate()){
      calc(
        weight: int.parse(weightController.text.trim()),
        height: int.parse(heightController.text.trim()),
        age: int.parse(ageController.text.trim()),
      );
      
    }
  }


  void calc({required int weight, required int height, required int age}){
    int gender = isMale ? 5 : 161;
    double pbm = (10 * weight) + (6.25 * height) - (5 * age) + gender;
    final tdee = (pbm * 1.55).toInt();
    setState(() {
      normalCalories = tdee;
      negativeCalories = tdee - 500;
      gymCalories = tdee + 250;

    });
  }

  @override
  Widget build(BuildContext context) {
    MainBloc bloc = context.read<MainBloc>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'Калькулятор',
          style: TextStyles(context).black_30_w300,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ЖЫНЫС ТАНДАУ',
                  style: TextStyles(context).black_20_w300,
                ),
                SizedBox(width: MediaQuery.of(context).size.width, height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Checkbox(value: isMale, onChanged: (val){
                          isMale = (val ?? true);
                          setState(() {});
                        }),
                        Text(
                          'ЕР АДАМ',
                          style: TextStyles(context).black_18_w400,
                        ),
                      ],
                    ),
                    SizedBox(width: 20.w,),
                    Column(
                      children: [
                        Checkbox(value: !isMale, onChanged: (val){
                          isMale = !(val ?? true);
                          setState(() {});
                        }),
                        Text(
                          'АЙЕЛ АДАМ',
                          style: TextStyles(context).black_18_w400,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.h,),
                Text(
                  'САЛМАК',
                  style: TextStyles(context).black_20_w300,
                ),
                SizedBox(height: 15.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextFormField(
                    controller: weightController,
                    style: TextStyles(context).white_18_w700,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if((value ?? '').isEmpty){
                        return 'Жазыныз';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Салмагынызды жазыныз',
                      filled: true,
                      isDense: true,
                      isCollapsed: true,
                      suffix: Text('КГ'),
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                      hintStyle: TextStyles(context).white_18_w400,
                      fillColor: ColorStyles.primary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100)
                        )
                      )
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                Text(
                  'БОЙЫНЫЗ',
                  style: TextStyles(context).black_20_w300,
                ),
                SizedBox(height: 15.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextFormField(
                    controller: heightController,
                    style: TextStyles(context).white_18_w700,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if((value ?? '').isEmpty){
                        return 'Жазыныз';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Бойыныздыы жазыныз',
                      filled: true,
                      isDense: true,
                      isCollapsed: true,
                      suffix: Text('СМ'),
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                      hintStyle: TextStyles(context).white_18_w400,
                      fillColor: ColorStyles.primary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100)
                        )
                      )
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                Text(
                  'ЖАСЫНЫЗ',
                  style: TextStyles(context).black_20_w300,
                ),
                SizedBox(height: 15.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextFormField(
                    controller: ageController,
                    style: TextStyles(context).white_18_w700,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if((value ?? '').isEmpty){
                        return 'Жазыныз';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Жасынызды жазыныз',
                      filled: true,
                      isDense: true,
                      isCollapsed: true,
                      suffix: Text('ЖЫЛ'),
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                      hintStyle: TextStyles(context).white_18_w400,
                      fillColor: ColorStyles.primary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100)
                        )
                      )
                    ),
                  ),
                ),
                SizedBox(height: 40.h,),
                GestureDetector(
                  onTap: onCalc,
                  child: Container(
                    height: 60.h,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorStyles.greyf1f1, width: 1.w),
                      borderRadius: BorderRadius.circular(15.r),
                      color: ColorStyles.primary,
                    ),
                    alignment: Alignment.center,
                    child: Text('Санау', style: TextStyles(context).white_20_w700.copyWith(fontWeight: FontWeight.w400),)
                  ),
                ),
                

                SizedBox(height: 20.h,),
                if(negativeCalories != 0)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),

                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                  ),
                  padding: EdgeInsets.all(20.h),
                  child: Column(
                    children: [
                      Text('Салмақ жоғалту үшін:', style: TextStyles(context).black_20_w300,),
                      SizedBox(height: 10.h,),
                      Text('$negativeCalories калорий', style: TextStyles(context).black_25_w700,),
                    
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                if(normalCalories != 0)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),

                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                  ),
                  padding: EdgeInsets.all(20.h),
                  child: Column(
                    children: [
                      Text('Салмақты сактау үшін:', style: TextStyles(context).black_20_w300,),
                      SizedBox(height: 10.h,),
                      Text('$normalCalories калорий', style: TextStyles(context).black_25_w700,),
                    
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                if(gymCalories != 0)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),

                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                  ),
                  padding: EdgeInsets.all(20.h),
                  child: Column(
                    children: [
                      Text('Бұлшықет массасын косу үшін:', style: TextStyles(context).black_20_w300,),
                      SizedBox(height: 10.h,),
                      Text('$gymCalories калорий', style: TextStyles(context).black_25_w700,),
                    
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                SizedBox(height: 20.h,),
          
              ]
            ),
          ),
        ),
      )
    );
  }
}