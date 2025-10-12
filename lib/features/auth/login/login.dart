import 'package:evently_sun_online/core/resources/assets_manager.dart';
import 'package:evently_sun_online/core/resources/colors_manager.dart'
    show ColorsManager;
import 'package:evently_sun_online/core/routes_manager/app_routes.dart'
    show AppRoutes;
import 'package:evently_sun_online/core/utils/validator_utils.dart';
import 'package:evently_sun_online/core/widgets/custom_elevated_button.dart';
import 'package:evently_sun_online/core/widgets/custom_text_button.dart';
import 'package:evently_sun_online/core/widgets/custom_text_form_field.dart';
import 'package:evently_sun_online/l10n/app_localizations.dart' show AppLocalizations;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool securePassword = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(ImageAssets.eventlyLogo),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    validator: ValidatorUtils.validateEmail,
                    labelText: appLocalizations.email,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    validator: ValidatorUtils.validatePassword,
                    isSecure: securePassword,
                    labelText:appLocalizations.password,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock,
                    suffixIcon: IconButton(
                      onPressed: _onTogglePasswordIconClicked,
                      icon: Icon(
                        securePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextButton(
                    text: appLocalizations.forget_password,
                    onTap: () {},
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 24.h),
                  CustomElevatedButton(text: appLocalizations.login, onPress:_login),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       "${appLocalizations.dont_have_account} ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.register,
                          );
                        },
                        child: Text(
                         appLocalizations.create_account,
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            color: ColorsManager.blue,
                            fontWeight: FontWeight.bold,
                            decorationColor: ColorsManager.blue,
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: ColorsManager.blue,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ),
                      Text(appLocalizations.or, style: Theme.of(context).textTheme.bodySmall),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: ColorsManager.blue,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: REdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: ColorsManager.blue, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageAssets.google),
                        SizedBox(width: 10.w),
                        Text(
                          appLocalizations.login_with_google,
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorsManager.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTogglePasswordIconClicked() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  _login(){
    if(_formKey.currentState?.validate() == false) return;
  }
}
