import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprintmap/bloc/drawer_event.dart';
import 'package:sprintmap/bloc/nav_drawer_bloc.dart';
import 'package:sprintmap/bloc/nav_drawer_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _NavigationItem {
  final NavItem item;
  final String title;
  final IconData icon;

  _NavigationItem(this.item, this.title, this.icon);
}

class NavDrawerWidget extends StatelessWidget {
  NavDrawerWidget({super.key});
  final List<_NavigationItem> _listItems = [
    _NavigationItem(
      NavItem.homeView,
      "Home",
      FontAwesomeIcons.house, 
    ),
    _NavigationItem(
      NavItem.todoView,
      "Yapılacaklar",
      FontAwesomeIcons.clipboardList, 
    ),
    _NavigationItem(
      NavItem.questionsView,
      "Biriken Sorular",
      FontAwesomeIcons.inbox, 
    ),
    _NavigationItem(
      NavItem.aiView,
      "Yapay Zeka",
      FontAwesomeIcons.robot, 
    ),
    _NavigationItem(
      NavItem.goalsView,
      "Hedeflerim",
      FontAwesomeIcons.bullseye, 
    ),
    _NavigationItem(
      NavItem.statisticsView,
      "YKS İstatistiği",
      FontAwesomeIcons.chartLine, 
    ),
    _NavigationItem(
      NavItem.resultsView,
      "Deneme Sonuçlarım",
      FontAwesomeIcons.solidChartBar, 
    ),
    _NavigationItem(
      NavItem.librariesView,
      "Yakınımdaki Kütüphaneler",
      FontAwesomeIcons.bookOpen, 
    ),
    _NavigationItem(
      NavItem.badgesView,
      "Rozetlerim",
      FontAwesomeIcons.medal, 
    ),
    _NavigationItem(
      NavItem.counterView,
      "Sayaç",
      FontAwesomeIcons.clock, 
    ),
];

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          children: [
            /// Header
            const UserAccountsDrawerHeader(
              accountName: Text(
                'FlexZ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text('amirBayat.dev@gmail',
                  style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://blog.sebastiano.dev/content/images/2019/07/1_l3wujEgEKOecwVzf_dqVrQ.jpeg'))),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/91388754?v=4'),
              ),
            ),

            /// Items
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _listItems.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  BlocBuilder<NavDrawerBloc, NavDrawerState>(
                builder: (BuildContext context, NavDrawerState state) =>
                    _buildItem(_listItems[index], state),
              ),
            ),
          ],
        ),
      );

  /// Build Each Drawer Item
  Widget _buildItem(_NavigationItem data, NavDrawerState state) =>
      _makeListItem(data, state);

  /// Each Drawer Item
  Widget _makeListItem(_NavigationItem data, NavDrawerState state) => Card(
        color: Colors.grey[100],
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        borderOnForeground: true,
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Builder(
          builder: (BuildContext context) => ListTile(
            title: Text(
              data.title,
              style: TextStyle(
                fontWeight: data.item == state.selectedItem
                    ? FontWeight.bold
                    : FontWeight.w300,
                color: data.item == state.selectedItem
                    ? const Color.fromARGB(255, 112, 119, 249)
                    : Colors.grey[600],
              ),
            ),
            leading: Icon(
              data.icon,
              color: data.item == state.selectedItem
                  ? const Color.fromARGB(255, 112, 119, 249)
                  : Colors.grey[600],
            ),
            onTap: () => _handleItemClick(context, data.item),
          ),
        ),
      );

  /// Tap On Each item Handler
  void _handleItemClick(BuildContext context, NavItem item) {
    BlocProvider.of<NavDrawerBloc>(context).add(NavigateTo(item));
    Navigator.pop(context);
  }
}
