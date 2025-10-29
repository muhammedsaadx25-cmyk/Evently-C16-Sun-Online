import 'package:evently_sun_online/core/extensions/date_time_ex.dart';
import 'package:evently_sun_online/core/resources/assets_manager.dart';
import 'package:evently_sun_online/core/resources/colors_manager.dart';
import 'package:evently_sun_online/firebase/firebase_service.dart';
import 'package:evently_sun_online/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventItem extends StatefulWidget {
   EventItem({super.key, required this.event,  this.showAsFavourite});
final EventModel event;
bool? showAsFavourite;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
List<String> months = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Agu",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];
late bool isFavourite = widget.showAsFavourite ?? false;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: REdgeInsets.all(8),
      margin: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      height: 203.h,
      decoration: BoxDecoration(
borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: ColorsManager.blue, width: 1),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ImageAssets.meeting))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.event.dateTime.getDay, style: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorsManager.blue),),
                  Text(widget.event.dateTime.getMonthName, style: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorsManager.blue),),
                ],
              ),
            ),
          ),
          Spacer(),
          Card(
            child:Padding(
              padding:  REdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text(widget.event.title, style: Theme.of(context).textTheme.bodyMedium),),
                IconButton(onPressed: _markEventAsFavourite, icon:   Icon(isFavourite ? Icons.favorite : Icons.favorite_border, color: ColorsManager.blue,))
                ],
              ),
            ),
          )

        ],
      ),
    );
  }

  void _markEventAsFavourite() async{
    if(isFavourite){
     await  FirebaseService.removeEventFromFavourite(widget.event);
     isFavourite = false;
    }else{
    await FirebaseService.addEventToFavourite(widget.event);
    isFavourite = true;

    }

    setState(() {

    });
  }
}
