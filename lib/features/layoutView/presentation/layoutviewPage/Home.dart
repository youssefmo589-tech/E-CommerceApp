import 'package:ecommerce/Widgets/ProductContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Widgets/CustomDrawer.dart';
import '../../../../core/Theme/AppColors/AppColors.dart';
import '../manager/layoutBloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> categories = [];

  int _selectedIndexTabBar = 0;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).textTheme;

    return BlocProvider<Layoutbloc>(
      create: (context) =>
      Layoutbloc()
        ..add(getCategoriesEvent()),
      child: BlocBuilder<Layoutbloc, LayoutState>(
          builder: (context, state) {
            if (state is LayoutLoading) {
              return Center(child: CircularProgressIndicator(
                color: AppColors.darkpurple,));
            }
            if (state is LayoutError) {
              return Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 35, color: Colors.red,),
                  Text(state.error),
                ],
              ));
            }
            if (state is LayoutSuccessCategories) {
              categories = state.categories;
            }


            return Scaffold(
              drawer: Customdrawer(),

              appBar: AppBar(
                backgroundColor: AppColors.whiteapp,

                title: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                        Icons.search, size: 30, color: AppColors.darkgrey),
                    hintText: "Search Product",
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
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
                        style: theme.titleLarge?.copyWith(
                            color: AppColors.blackapp),
                      ),
                    ),
                    DefaultTabController(
                      length: categories.length,

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

                        tabs: categories.map((item) => Text(item)).toList(),
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


      ),
    );
  }
}
