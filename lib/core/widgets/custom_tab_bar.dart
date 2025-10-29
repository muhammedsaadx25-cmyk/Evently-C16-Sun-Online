
import 'package:evently_sun_online/core/widgets/tab_item.dart';
import 'package:evently_sun_online/models/category_model.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.categories,

  required this.selectedBgColor, required this.selectedFgColor, required this.unSelectedBgColor, required this.unSelectedFgColor,
    this.onCategoryItemClicked
  });
  final List<CategoryModel> categories;
  final Color selectedBgColor;
  final Color selectedFgColor;
  final Color unSelectedBgColor;
  final Color unSelectedFgColor;
  final void Function(CategoryModel)? onCategoryItemClicked;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        indicatorColor: Colors.transparent,
        onTap: (newIndex) {
          widget.onCategoryItemClicked?.call(widget.categories[newIndex]);
          setState(() {
            selectedIndex = newIndex;
          });
        },
        isScrollable: true,
        tabs: widget.categories
            .map(
              (category) => TabItem(
              category: category,
              selectedBgColor: widget.selectedBgColor,
              selectedFgColor:widget.selectedFgColor,
              unSelectedBgColor: widget.unSelectedBgColor,
              unSelectedFgColor:widget.unSelectedFgColor,
              isSelected: selectedIndex == widget.categories.indexOf(category)
          ),
        )
            .toList(),
      ),
    );
  }
}
