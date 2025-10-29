import 'package:evently_sun_online/core/extensions/date_time_ex.dart';
import 'package:evently_sun_online/core/resources/assets_manager.dart';
import 'package:evently_sun_online/core/resources/colors_manager.dart';
import 'package:evently_sun_online/core/utils/UI_Utils.dart';
import 'package:evently_sun_online/core/utils/validator_utils.dart';
import 'package:evently_sun_online/core/widgets/custom_elevated_button.dart';
import 'package:evently_sun_online/core/widgets/custom_tab_bar.dart';
import 'package:evently_sun_online/core/widgets/custom_text_button.dart';
import 'package:evently_sun_online/core/widgets/custom_text_form_field.dart';
import 'package:evently_sun_online/firebase/firebase_service.dart';
import 'package:evently_sun_online/l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:evently_sun_online/models/category_model.dart';
import 'package:evently_sun_online/models/event_model.dart';
import 'package:evently_sun_online/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime selectedDateTime = DateTime.now();

  /// current date, current time
  TimeOfDay selectedTimeTemp = TimeOfDay.now();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 late  CategoryModel selectedCategory = CategoryModel.getCategories(context)[0];
 late TextEditingController _titleController;
 late TextEditingController _descriptionController;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }
  @override
  void dispose() {
    _titleController.dispose();
   _descriptionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.create_event)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(ImageAssets.meeting),
              ),
              SizedBox(height: 16.h),
              CustomTabBar(
                onCategoryItemClicked: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
                categories: CategoryModel.getCategories(context),
                selectedBgColor: ColorsManager.blue,
                selectedFgColor: ColorsManager.white,
                unSelectedBgColor: Colors.transparent,
                unSelectedFgColor: ColorsManager.blue,
              ),
              SizedBox(height: 16.h),
              Text(
                appLocalizations.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                controller:_titleController,
                validator: ValidatorUtils.validateEventTitle,
                hintText: appLocalizations.event_title,
                keyboardType: TextInputType.text,
                prefixIcon: Icons.edit_note,
              ),
              SizedBox(height: 16.h),
              Text(
                appLocalizations.description,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                controller: _descriptionController,
                validator: ValidatorUtils.validateEventDescription,
                hintText: appLocalizations.event_description,
                keyboardType: TextInputType.text,
                maxLines: 4,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Icon(Icons.date_range_rounded),
                  SizedBox(width: 4.w),
                  Text(
                    selectedDateTime.toFormattedDate,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  CustomTextButton(
                    text: appLocalizations.choose_date,
                    onTap: _selectEventData,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 4.w),
                  Text(
                    selectedDateTime.toFormattedTime,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  CustomTextButton(
                    text: appLocalizations.choose_time,
                    onTap: _selectEventTime,
                  ),
                ],
              ),
              SizedBox(height: 24),
              CustomElevatedButton(
                text: appLocalizations.add_event,
                onPress: _createEvent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectEventData() async {
    selectedDateTime =
        await showDatePicker(
          locale: Locale("ar"),
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        ) ??
        selectedDateTime;
    selectedDateTime = selectedDateTime.copyWith(
      hour: selectedTimeTemp.hour,
      minute: selectedTimeTemp.minute,
    );
    print(selectedDateTime.toString());
    setState(() {});
  }

  void _selectEventTime() async {
    selectedTimeTemp =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
        selectedTimeTemp;
    selectedDateTime = selectedDateTime.copyWith(
      hour: selectedTimeTemp.hour,
      minute: selectedTimeTemp.minute,
    );
    setState(() {});
  }

  void _createEvent() async{
    if (_formKey.currentState?.validate() == false) return;
    EventModel event = EventModel(id: "", ownerId: UserModel.currentUser!.id,category: selectedCategory, title: _titleController.text, description: _descriptionController.text, dateTime: selectedDateTime);

    UIUtils.showLoading(context, isDismissable: false);
    await FirebaseService.addEventToFireStore(event, context);
    UIUtils.hideDialog(context);
    UIUtils.showToast("Event created successfully", Colors.green);
    Navigator.pop(context);
  }
}
