
import 'package:flutter/material.dart';


class CustomGridView<T> extends StatelessWidget {
  final List<T> dataList;
  final Widget Function(T) itemBuilder;

  const CustomGridView({
    super.key,
    required this.dataList,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Disables scrolling within the GridView itself
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // Defines the maximum width of each grid item
        childAspectRatio: 1.4 / 2, // Adjust the aspect ratio as needed
        crossAxisSpacing: 20, // Horizontal space between grid items
        mainAxisSpacing: 2, // Vertical space between grid items
      ),
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return itemBuilder(dataList[index]);
      },
    );
  }
}


class CustomoneGridView<T> extends StatelessWidget {
  final List<T> dataList;
  final Widget Function(T) itemBuilder;

  const CustomoneGridView({
    super.key,
    required this.dataList,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Disables scrolling within the GridView itself
       gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1  ,  
        childAspectRatio: 2 / 1.4, // Adjust the aspect ratio as needed
        crossAxisSpacing: 20, // Horizontal space between grid items
        mainAxisSpacing: 20, ),
    // Vertical space between grid items
      
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return itemBuilder(dataList[index]);
      },
    );
  }
}