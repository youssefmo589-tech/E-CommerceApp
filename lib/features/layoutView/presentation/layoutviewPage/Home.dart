import 'package:ecommerce/Widgets/ProductContainer.dart';
import 'package:flutter/material.dart';

import '../../../../Widgets/CustomDrawer.dart';
import '../../../../core/Theme/AppColors/AppColors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    List<String> tabs = ["Hand Bags", "Watch", "Books", "Glasses"];

    int _selectedIndexTabBar = 0;

    final theme = Theme.of(context).textTheme;

    return Scaffold(
      drawer: Customdrawer(),

      appBar: AppBar(
        backgroundColor: AppColors.whiteapp,

        title: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, size: 30, color: AppColors.darkgrey),
            hintText: "Search Product",
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            filled: false,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.darkgrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.darkgrey),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Find your suitable product now.",
                style: theme.titleLarge?.copyWith(color: AppColors.blackapp),
              ),
            ),
            DefaultTabController(
              length: tabs.length,

              child: TabBar(
                dividerHeight: 0,
                dividerColor: AppColors.darkpurple,
                indicatorColor: AppColors.darkpurple,
                indicatorWeight: 1,
                labelPadding: EdgeInsets.symmetric(horizontal: 16),
                labelStyle: theme.titleSmall?.copyWith(
                  color: AppColors.darkpurple,
                  fontSize: 16,
                ),
                labelColor: AppColors.darkpurple,
                isScrollable: true,
                unselectedLabelColor: AppColors.darkgrey,
                unselectedLabelStyle: theme.titleSmall?.copyWith(
                  color: AppColors.darkgrey,
                  fontSize: 16,
                ),
                tabAlignment: TabAlignment.start,
                onTap: (index) {
                  setState(() {
                    _selectedIndexTabBar = index;
                  });
                },

                tabs: tabs.map((item) => Text(item)).toList(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 10,
                ),

                itemBuilder: (context, index) {
                  return ProductContainer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
