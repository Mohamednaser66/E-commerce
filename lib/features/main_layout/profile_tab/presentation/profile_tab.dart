import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/auth/presentation/auth_cubit.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/models/UpdateUserRequest.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/presentation/update_user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  ProfileTabState createState() => ProfileTabState();
}

class ProfileTabState extends State<ProfileTab> {
  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
  }

  bool isFullNameReadOnly = true;
  bool isEmailReadOnly = true;
  bool isPasswordReadOnly = true;
  bool isMobileNumberReadOnly = true;
  bool isAddressReadOnly = true;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  loadData() async {
    final user = await context.read<AuthCubit>().getUser();
    nameController.text = user.name;
    emailController.text = user.email;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  SvgAssets.routeLogo,
                  height: AppSize.s40,
                  colorFilter: ColorFilter.mode(
                    ColorManager.primary,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(height: AppSize.s20.h),
                Text(
                  'Welcome, ${nameController.text}',
                  style: getSemiBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s18),
                ),
                Text(
                  '${emailController.text}',
                  style: getRegularStyle(
                      color: ColorManager.primary.withOpacity(.5),
                      fontSize: FontSize.s14),
                ),
                SizedBox(height: AppSize.s18.h),
                BuildTextField(
                  borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                  readOnly: isFullNameReadOnly,
                  backgroundColor: ColorManager.white,
                  hint: 'Enter your full name',
                  label: 'Full Name',
                  controller: nameController,
                  labelTextStyle: getMediumStyle(
                      color: ColorManager.primary, fontSize: FontSize.s18),
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(SvgAssets.edit),
                    onPressed: () {
                      setState(() {
                        isFullNameReadOnly = false;
                      });
                    },
                  ),
                  textInputType: TextInputType.text,
                  validation: AppValidators.validateFullName,
                  hintTextStyle: getRegularStyle(color: ColorManager.primary)
                      .copyWith(fontSize: 18.sp),
                ),
                SizedBox(height: AppSize.s18.h),
                BuildTextField(
                  borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                  readOnly: isEmailReadOnly,
                  backgroundColor: ColorManager.white,
                  hint: 'Enter your email address',
                  label: 'E-mail address',
                  controller: emailController,
                  labelTextStyle: getMediumStyle(
                      color: ColorManager.primary, fontSize: FontSize.s18),
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(SvgAssets.edit),
                    onPressed: () {
                      setState(() {
                        isEmailReadOnly = !isEmailReadOnly;
                      });
                    },
                  ),
                  textInputType: TextInputType.emailAddress,
                  validation: AppValidators.validateEmail,
                  hintTextStyle: getRegularStyle(color: ColorManager.primary)
                      .copyWith(fontSize: 18.sp),
                ),
                SizedBox(height: AppSize.s18.h),
                BuildTextField(
                  controller: phoneController,
                  borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                  readOnly: isMobileNumberReadOnly,
                  backgroundColor: ColorManager.white,
                  hint: 'Enter your mobile no.',
                  label: 'Your mobile number',
                  labelTextStyle: getMediumStyle(
                      color: ColorManager.primary, fontSize: FontSize.s18),
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(SvgAssets.edit),
                    onPressed: () {
                      setState(() {
                        isMobileNumberReadOnly = !isMobileNumberReadOnly;
                      });
                    },
                  ),
                  textInputType: TextInputType.phone,
                  validation: AppValidators.validatePhoneNumber,
                  hintTextStyle: getRegularStyle(color: ColorManager.primary)
                      .copyWith(fontSize: 18.sp),
                ),
                SizedBox(height: AppSize.s18.h),
                SizedBox(height: AppSize.s50.h),
                BlocListener<ProfileCubit, UpdateUserState>(
                  listener: (context, state) {
                    if (state is UpdateUserSuccess) {
                      showDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text('Data Updated Successfully'),
                        ),
                      );
                      Future.delayed(
                        Duration(seconds: 2),
                        () {
                           if (!mounted) return;
                            Navigator.pop(context);

                        },
                      );
                    }
                    if (state is UpdateUserError) {
                      showDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text(state.message),
                        ),
                      );
                      Future.delayed(
                        Duration(seconds: 2),
                            () {
                              if (!mounted) return;
                            Navigator.pop(context);

                        },
                      );
                    }
                  },
                  child: CustomElevatedButton(
                    label: 'Update User Data',
                    onTap: () {
                      if(!formKey.currentState!.validate()){
                        return;
                      }
                      context.read<ProfileCubit>().UpdateUser(UpdateUserRequest(name: nameController.text,email: emailController.text,phone: phoneController.text));
                    },
                  ),
                ),
                SizedBox(height: AppSize.s40.h),
                CustomElevatedButton(
                  backgroundColor: Colors.red,
                  textStyle: TextStyle(
                      color: ColorManager.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp),
                  label: 'Logout',
                  onTap: () {
                    BlocProvider.of<ProfileCubit>(context).logout(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
