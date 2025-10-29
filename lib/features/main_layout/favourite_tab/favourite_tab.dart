import 'package:evently_sun_online/core/resources/colors_manager.dart';
import 'package:evently_sun_online/core/widgets/event_item.dart' show EventItem;
import 'package:evently_sun_online/firebase/firebase_service.dart';
import 'package:evently_sun_online/l10n/app_localizations.dart' show AppLocalizations;
import 'package:evently_sun_online/models/category_model.dart';
import 'package:evently_sun_online/models/event_model.dart' show EventModel;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(

              decoration: InputDecoration(

                prefixIcon: Icon(Icons.search),
                prefixIconColor: ColorsManager.blue,
                hintText: appLocalizations.search_for_event,
                hintStyle: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorsManager.blue)
              ),
            ),
          ),
          SizedBox(height: 16.h,),
          FutureBuilder(future: FirebaseService.getFavouriteEvents(context),
              builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()),);
            }
            List<EventModel> favouriteEvents = snapshot.data ?? [];
            return Expanded(child: ListView.builder(itemBuilder: (context, index)=>  EventItem(
              event: favouriteEvents[index],
              showAsFavourite: true,
            ), itemCount: favouriteEvents.length, ));
              })


        ],
      ),
    );
  }
}
