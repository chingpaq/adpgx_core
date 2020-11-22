import "package:flutter/material.dart";
import "package:stacked/stacked.dart";
import 'package:redux/redux.dart';

import '../../constants.dart';
import '../../viewModels/homeViewModel.dart';
import '../business/newTransactions.dart';
import '../business/transactionsView.dart';
import '../business/chatView.dart';
import '../business/paymentsView.dart';
import '../business/accountsView.dart';

import '../../widgets/drawerMenu.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> viewContainer;
  bool logged = false;
  Store store;

  @override
  void initState() {
    viewContainer = [
      NewTransactionView(store:store),
      TransactionView(store:store),
      ChatView(store: store,),
      PaymentsView(store: store,),
      AccountsView(store: store,)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) async {},
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          drawer: DrawerWidget(),
          body: IndexedStack(
            index: _selectedIndex,
            children: viewContainer,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.content_paste),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.payment),
                label: 'Payment',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.messenger_outline),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            unselectedLabelStyle: kLabelsTextHeaderStyleSmallest,
            selectedLabelStyle: kLabelsTextHeaderStyleSmallest,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
