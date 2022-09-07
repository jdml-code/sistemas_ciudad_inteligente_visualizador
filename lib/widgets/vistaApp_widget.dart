import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../services/service_ingreso.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class VistaWidget extends StatefulWidget {
  static const List<Tab> tabs = <Tab>[
  Tab(text: 'Hurtos'),
  Tab(text: 'Accidentes'),
  Tab(text: 'Deslizamientos'),
  Tab(text: 'Acoso')
];
  const VistaWidget({super.key});

  @override
  State<VistaWidget> createState() => _VistaWidgetState();
}  

class _VistaWidgetState extends State<VistaWidget> {
  String _selectedMenu = '';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: VistaWidget.tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            leading: PopupMenuButton<Menu>(
              icon: const Icon(Icons.menu),
              position: PopupMenuPosition.under,
              // Callback that sets the selected popup menu item.
              onSelected: (Menu item) {
                setState(() {
                  _selectedMenu = item.name;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                    const PopupMenuItem<Menu>(
                      value: Menu.itemOne,
                      child: Text('Item 1'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemTwo,
                      child: Text('Item 2'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemThree,
                      child: Text('Item 3'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemFour,
                      child: Text('Item 4'),
                    ),
                  ]),
            bottom: const TabBar(
              tabs: VistaWidget.tabs,
            ),
          ),
          body: TabBarView(
            children: VistaWidget.tabs.map((Tab tab) {
              return Center(
                child: Text(
                  '${tab.text!} Tab',
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
  // Widget build(BuildContext context) {
    
    // final ingresoServices = IngresoService(); // crear la instaia
    // return const SafeArea(
    //   child: SizedBox(
    //       width: double.infinity,
    //       child: TabBarView(
    //         controller: ,
    //         children: [
    //           Icon(Icons.abc_rounded),
    //           Icon(Icons.access_time_filled),
    //           Icon(Icons.local_airport)
    //         ],)
          // DefaultTabController(
          //   length: 3,
          //   child: Column(
          //     children: <Widget>[
          //       ButtonsTabBar(
          //         backgroundColor: Colors.greenAccent,
          //         tabs: const [
          //           Tab(icon: Icon(Icons.directions_car), text: "car"),
          //           Tab(icon: Icon(Icons.directions_car), text: "car"),
          //           Tab(icon: Icon(Icons.directions_car), text: "car")
          //         ],
          //       ),
          //       const Expanded(
          //         child: TabBarView(children: <Widget>[
          //           Center(
          //             child: Icon(Icons.account_tree_sharp),
          //           ),
          //           Center(
          //             child: Icon(Icons.directions_car),
          //           ),
          //           Center(
          //             child: Icon(Icons.directions_car),
          //           ),
          //         ]),
          //       ),
          //     ]
          //   ),
          // ),
//       ),
//     );
// }
// };