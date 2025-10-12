import 'package:evently_sun_online/core/resources/colors_manager.dart' show ColorsManager;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDownItem extends StatelessWidget {
  const CustomDropDownItem({super.key, required this.label, required this.selectedLabel, required this.menuItems, this.onChange});
  final String label;
  final String selectedLabel;
  final List<String> menuItems;
  final void Function(String?)? onChange;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: 16.sp,),
          Container(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(color: ColorsManager.blue, width: 1.w)
            ),
            child: Row(
              children: [
                Text(selectedLabel, style: Theme.of(context).textTheme.labelMedium,),
                Spacer(),
                DropdownButton(

                    underline: Container(),
                    items: menuItems.map((item)=>DropdownMenuItem(

                        value: item,
                        child: Text(item, style: GoogleFonts.inter(color: ColorsManager.black),))).toList(),
                    onChanged:onChange,

                )],
            ),
          )

        ],
      ),
    );
  }
}
