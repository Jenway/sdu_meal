import 'package:flutter/material.dart';
import 'package:sdu_meal/database/database_helper.dart';
import 'package:sdu_meal/widgets/choice_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String _selectedFood = "某食物";
  String _selectedWindow = "某窗口";
  String _selectedFloor = "某楼层";
  String _selectedCanteen = "某餐厅";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('今天吃什么？'),
      ),
      drawer: NavigationDrawer(
        children: [
          // pic
          const UserAccountsDrawerHeader(
            accountName: Text('SDU'),
            accountEmail: Text(' 今天吃什么？'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Today\'s Special is: ',
              style: TextStyle(fontSize: 24, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                //
                Row(
                  // 如何使其居中？
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceCard(choice: _selectedCanteen),
                    ChoiceCard(choice: _selectedFloor),
                    ChoiceCard(choice: _selectedWindow),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceCard(choice: _selectedFood),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _selectFood();
              },
              child: const Text("今天的 选择是?"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // _selectFood();
              },
              child: const Text('就决定是你了'),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  void _selectFood() {
    // DOne: Add logic to randomly select food from available options.
    setState(() {
      debugPrint("next execute future func");
      final randomChoice = DatabaseHelper().getChoice();
      randomChoice.then(
        (value) => {
          setState(() {
            _selectedCanteen = value[0];
            _selectedFloor = value[1];
            _selectedWindow = "${value[2]}窗口";
            _selectedFood = value[3];
          })
        },
      );
    });
  }
}
