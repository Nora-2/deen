import 'package:deen/Features/learn/widgets/categorycard.dart';
import 'package:deen/Models/categorymodel.dart';
import 'package:deen/core/utils/app_router.dart';
import 'package:deen/core/utils/widgets/sizedbox/sizedbox.dart';
import 'package:flutter/material.dart';

class Videoscreen extends StatefulWidget {
  const Videoscreen({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _VideoscreenState createState() => _VideoscreenState();
}

class _VideoscreenState extends State<Videoscreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sized.s16,
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.all(5), // Adds padding around the grid
                  itemCount: stories.length,
                  itemBuilder: (context, index) => CategoryCard(
                    category: stories[index],
                    index: index,
                    location: AppRouter.stories[index],
                  ),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.5 / 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
