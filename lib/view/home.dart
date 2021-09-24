import 'package:flutter/material.dart';
import 'dart:math' as math;

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final List<String> categories = [
    "All",
    "Category",
    "Top",
    "Recommended",
    "Tech",
    "Shoes"
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 50.0,
                title: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.shopping_bag_outlined),
                        SizedBox(width: size.width * 0.02),
                        const Text('Shopri'),
                      ],
                    ),
                  ],
                ),
              ),
              SliverAppBar(
                pinned: true,
                snap: true,
                floating: true,
                expandedHeight: 60,
                title: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xfff2f2f2),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Color(0xfff2f2f2)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Color(0xfff2f2f2)),
                            ),
                            hintText: "Find your product",
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.grey),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 15.0)),
                      ),
                    ),
                    SizedBox(width: size.width * 0.06),
                    Expanded(
                      child: Container(
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                          color: const Color(0xfff2f2f2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child:
                            const Icon(Icons.notifications, color: Colors.pink),
                      ),
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: size.height * 0.07,
                  maxHeight: size.height * 0.07,
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) => Container(
                        margin: index == 0
                            ? const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 10.0,
                                bottom: 10.0)
                            : const EdgeInsets.only(
                                right: 10.0, top: 10.0, bottom: 10.0),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                            color: index == 0
                                ? Colors.pink
                                : const Color(0xfff2f2f2),
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Center(
                            child: Text(
                          categories[index],
                          style: TextStyle(
                            color: index == 0 ? Colors.white : Colors.black,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.9,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: index == 1 || index == 0
                                ? const EdgeInsets.only(top: 10.0)
                                : const EdgeInsets.all(0.0),
                            height: size.height * 0.14,
                            alignment: Alignment.center,
                            child: const Text("image"),
                            decoration: BoxDecoration(
                                color: const Color(0xfff2f2f2),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
                            child: Text(
                              'AKG N700NCM2 Wireless Headphone',
                              style: TextStyle(
                                  fontSize: 12.5, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Text(
                            '\$' '199.00',
                            style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 40,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
