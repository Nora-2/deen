import 'package:deen/Models/categorymodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard(
      {super.key,
      required this.index,
      required this.category,
      required this.location});
  final int index;
  final Category category;
  final String location;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    Category category = widget.category;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(widget.location);
      },
      child: Container(
        height: .9.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(4, 6),
            ),
          ],
        ),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(category.image), fit: BoxFit.fill)),
          ),
        ),
      ),
    );
  }
}
