import 'package:flutter/material.dart';
import 'package:multiplayer/provider/room_data_provider.dart';
import 'package:multiplayer/screens/create_room.dart';
import 'package:multiplayer/screens/game_screen.dart';
import 'package:multiplayer/screens/join_room.dart';
import 'package:multiplayer/screens/main_menu.dart';
import 'package:multiplayer/utils/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
        routes: {
          MainMenu.routeName: (context) => const MainMenu(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
          JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
          GameScreen.routeName: (context) => const GameScreen(),
        },
        initialRoute: MainMenu.routeName,
      ),
    );
  }
}
