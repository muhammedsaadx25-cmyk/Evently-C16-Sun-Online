import 'package:evently_sun_online/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String name;
  IconData iconData;
  String imagePath;
  CategoryModel({required this.id, required this.name, required this.iconData, required this.imagePath});


 static List<CategoryModel> getCategoriesWithAll(BuildContext context){
   AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return  [
      CategoryModel(id: "0", name: appLocalizations.all, iconData: Icons.all_inclusive_rounded, imagePath: ""),
      CategoryModel(id: "1", name: appLocalizations.sports, iconData: Icons.sports_football_rounded, imagePath: ""),
      CategoryModel(id: "2", name: appLocalizations.birthday, iconData: Icons.cake_rounded, imagePath: ""),
      CategoryModel(id: "3", name: appLocalizations.meeting, iconData: Icons.laptop_mac_rounded, imagePath: ""),
      CategoryModel(id: "4", name: appLocalizations.gaming, iconData: Icons.gamepad_rounded, imagePath: ""),
      CategoryModel(id: "5", name: appLocalizations.eating, iconData: Icons.local_pizza_rounded, imagePath: ""),
      CategoryModel(id: "6", name: appLocalizations.holiday, iconData: Icons.holiday_village_rounded, imagePath: ""),
      CategoryModel(id: "7", name: appLocalizations.exhibition, iconData: Icons.water_drop_rounded, imagePath: ""),
      CategoryModel(id: "8", name: appLocalizations.workshop, iconData: Icons.workspaces_rounded, imagePath: ""),
      CategoryModel(id: "9", name:  appLocalizations.book_club, iconData: Icons.book_online_rounded, imagePath: ""),
    ];
  }
 static List<CategoryModel> getCategories(BuildContext context){
   AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return  [
      CategoryModel(id: "1", name: appLocalizations.sports, iconData: Icons.sports_football_rounded, imagePath: ""),
      CategoryModel(id: "2", name: appLocalizations.birthday, iconData: Icons.cake_rounded, imagePath: ""),
      CategoryModel(id: "3", name: appLocalizations.meeting, iconData: Icons.laptop_mac_rounded, imagePath: ""),
      CategoryModel(id: "4", name: appLocalizations.gaming, iconData: Icons.gamepad_rounded, imagePath: ""),
      CategoryModel(id: "5", name: appLocalizations.eating, iconData: Icons.local_pizza_rounded, imagePath: ""),
      CategoryModel(id: "6", name: appLocalizations.holiday, iconData: Icons.holiday_village_rounded, imagePath: ""),
      CategoryModel(id: "7", name: appLocalizations.exhibition, iconData: Icons.water_drop_rounded, imagePath: ""),
      CategoryModel(id: "8", name: appLocalizations.workshop, iconData: Icons.workspaces_rounded, imagePath: ""),
      CategoryModel(id: "9", name:  appLocalizations.book_club, iconData: Icons.book_online_rounded, imagePath: ""),
    ];
  }

}