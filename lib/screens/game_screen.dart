import 'package:flutter/material.dart';
import 'package:multiplayer/provider/room_data_provider.dart';
import 'package:multiplayer/resources/socket_methods.dart';
import 'package:multiplayer/views/scoreboard.dart';
import 'package:multiplayer/views/tictactoe_board.dart';
import 'package:multiplayer/views/waiting_lobby.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    // print(Provider.of<RoomDataProvider>(context).player1.nickname);
    // print(Provider.of<RoomDataProvider>(context).player2.nickname);
    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Scoreboard(),
                const TicTacToe(),
                Text(
                    '${roomDataProvider.roomData['turn']['nickname']}\'s turn'),
              ],
            )),
    );
  }
}
