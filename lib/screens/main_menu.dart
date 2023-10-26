import 'package:flutter/material.dart';
import 'package:multiplayer/responsive/responsive.dart';
import 'package:multiplayer/screens/create_room.dart';
import 'package:multiplayer/screens/join_room.dart';
import 'package:multiplayer/widgets/custom_button.dart';

class MainMenu extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenu({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(onTap: () => createRoom(context), text: 'Create Room'),
          const SizedBox(
            height: 20,
          ),
          CustomButton(onTap: () => joinRoom(context), text: 'Join Room'),
        ],
      ),
    ));
  }
}
