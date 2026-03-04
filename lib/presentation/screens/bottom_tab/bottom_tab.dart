import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/presentation/bloc/bottom_tab/bottom_tab_bloc.dart';
import 'package:online_groceries_app/presentation/bloc/bottom_tab/bottom_tab_event.dart';
import 'package:online_groceries_app/presentation/bloc/bottom_tab/bottom_tab_state.dart';
import 'package:online_groceries_app/presentation/screens/account/account_screen.dart';
import 'package:online_groceries_app/presentation/screens/cart/cart_screen.dart';
import 'package:online_groceries_app/presentation/screens/explore/explore_screen.dart';
import 'package:online_groceries_app/presentation/screens/favorite/favorite_screen.dart';
import 'package:online_groceries_app/presentation/screens/shop/shop_screen.dart';

class BottomTab extends StatelessWidget {
  const BottomTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomTabBloc(),
      child: BottomTabView(),
    );
  }
}

class BottomTabView extends StatelessWidget {
  const BottomTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomTabBloc, BottomTabState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.currentIndex,
            children: [
              ShopScreen(),
              ExploreScreen(),
              CartScreen(),
              FavoriteScreen(),
              AccountScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: state.currentIndex,
            onTap: (index) {
              context.read<BottomTabBloc>().add(OnChangeTabEvent(index));
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Shop'),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_travel),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}
