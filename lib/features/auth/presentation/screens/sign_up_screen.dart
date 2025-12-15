import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/presentation/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/auth_cubit_state/auyh_cubit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    _nameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
  loadData(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.s40.h,
                ),
                Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                SizedBox(
                  height: AppSize.s40.h,
                ),
                BuildTextField(
                  controller: _nameController,
                  backgroundColor: ColorManager.white,
                  hint: 'enter your full name',
                  label: 'Full Name',
                  textInputType: TextInputType.name,
                  validation: AppValidators.validateFullName,
                ),
                SizedBox(
                  height: AppSize.s18.h,
                ),
                BuildTextField(
                  controller: _phoneController,
                  hint: 'enter your mobile no.',
                  backgroundColor: ColorManager.white,
                  label: 'Mobile Number',
                  validation: AppValidators.validatePhoneNumber,
                  textInputType: TextInputType.phone,
                ),
                SizedBox(
                  height: AppSize.s18.h,
                ),
                BuildTextField(
                  controller: _emailController,
                  hint: 'enter your email address',
                  backgroundColor: ColorManager.white,
                  label: 'E-mail address',
                  validation: AppValidators.validateEmail,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: AppSize.s18.h,
                ),
                BuildTextField(
                  controller: _passwordController,
                  hint: 'enter your password',
                  backgroundColor: ColorManager.white,
                  label: 'password',
                  validation: AppValidators.validatePassword,
                  isObscured: true,
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: AppSize.s50.h,
                ),
                Center(
                  child: SizedBox(
                    height: AppSize.s60.h,
                    width: MediaQuery.of(context).size.width * .9,
                    child: BlocListener<AuthCubit,AuthState>(
                      listener: (context, state) {
                        if(state is RegisterLoadingState){
                          showDialog(context: context, builder: (context) => CupertinoAlertDialog(
                         content: Center(child:CircularProgressIndicator()),
                          ),);
                        }else if(state is RegisterErrorState){
                          Navigator.pop(context);
                          showDialog(context: context, builder: (context) => CupertinoAlertDialog(
                            content: Text(state.errorMessage),
                          ),);
                        }else if(state is RegisterSuccessState){
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(context, Routes.mainRoute);
                        }
                      },
                      child: CustomElevatedButton(
                        // borderRadius: AppSize.s8,
                        label: 'Sign Up',
                        backgroundColor: ColorManager.white,
                        textStyle: getBoldStyle(
                            color: ColorManager.primary, fontSize: AppSize.s20),
                        onTap: () {
                          BlocProvider.of<AuthCubit>(context).register(
                              RegisterRequest(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  rePassword: _passwordController.text,
                                  phone: _phoneController.text));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
