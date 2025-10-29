import 'package:evently_sun_online/core/resources/assets_manager.dart';
import 'package:evently_sun_online/core/resources/colors_manager.dart';
import 'package:evently_sun_online/core/routes_manager/app_routes.dart';
import 'package:evently_sun_online/core/utils/UI_Utils.dart';
import 'package:evently_sun_online/core/utils/validator_utils.dart';
import 'package:evently_sun_online/core/widgets/custom_elevated_button.dart';
import 'package:evently_sun_online/core/widgets/custom_text_form_field.dart';
import 'package:evently_sun_online/firebase/firebase_service.dart';
import 'package:evently_sun_online/l10n/app_localizations.dart';
import 'package:evently_sun_online/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool securePassword = true;
  bool secureRePassword = true;
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  late TextEditingController _passwordController;

  late TextEditingController _rePasswordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(appLocalizations.register)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(ImageAssets.eventlyLogo),

            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),

              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 24.h),
                    CustomTextFormField(
                      controller: _nameController,
                      validator: ValidatorUtils.validateName,
                      labelText: appLocalizations.name,
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: _emailController,
                      validator: ValidatorUtils.validateEmail,
                      labelText: appLocalizations.email,
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: _passwordController,
                      validator: ValidatorUtils.validatePassword,
                      isSecure: securePassword,
                      labelText: appLocalizations.password,
                      prefixIcon: Icons.lock,
                      suffixIcon: IconButton(
                        onPressed: _onTogglePasswordIconClicked,
                        icon: Icon(
                          securePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: _rePasswordController,
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return "Required re-password";
                        }
                        if (input != _passwordController.text) {
                          return "Password doesn't match";
                        }
                        return null;
                      },
                      isSecure: secureRePassword,
                      labelText: appLocalizations.re_password,
                      prefixIcon: Icons.lock,
                      suffixIcon: IconButton(
                        onPressed: _onToggleRePasswordIconClicked,
                        icon: Icon(
                          secureRePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 16.h),
                    CustomElevatedButton(
                      text: appLocalizations.create_account,
                      onPress: _createAccount,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${appLocalizations.already_have_account} ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.login,
                            );
                          },
                          child: Text(
                            appLocalizations.login,
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
                  ],
                ),
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

  void _onToggleRePasswordIconClicked() {
    setState(() {
      secureRePassword = !secureRePassword;
    });
  }

  void _createAccount() async {
    if (_formKey.currentState?.validate() == false) return;
    try {
      UIUtils.showLoading(context, isDismissable: false);
      UserCredential userCredential = await FirebaseService.register(_emailController.text, _passwordController.text);
      await FirebaseService.addUserToFireStore(UserModel(id: userCredential.user!.uid, name: _nameController.text, email: _emailController.text, favouriteEventsIds: []));
      UIUtils.hideDialog(context);
      UIUtils.showToast("Successfully registration", Colors.green);
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } on FirebaseAuthException catch (exception) {
     UIUtils.hideDialog(context);
      if (exception.code == 'weak-password') {
        UIUtils.showToast('The password provided is too weak.', Colors.red);
      } else if (exception.code == 'email-already-in-use') {
        UIUtils.showToast(
          'The account already exists for that email.',
          Colors.red,
        );
      }
    } catch (exception) {
      UIUtils.hideDialog(context);
      UIUtils.showToast('Failed to register', Colors.red);
    }
  }
}
