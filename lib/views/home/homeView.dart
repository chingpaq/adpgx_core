import "package:flutter/material.dart";
import "package:stacked/stacked.dart";

import '../../constants.dart';
import '../../viewModels/homeViewModel.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> viewContainer = [];
  bool logged = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) async{
        logged = await model.handleStartUpLogic();
        if (logged == false) {
          await model.gotoLoginPage();
        }
      },
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: viewContainer,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Accounts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.content_paste),
                label: 'Budget',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.view_list),
                label: 'To do',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart),
                label: 'Dashboard',
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
