import 'package:flutter/material.dart';
import 'package:multiplayer/provider/room_data_provider.dart';
import 'package:multiplayer/resources/socket_methods.dart';
import 'package:provider/provider.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.tappedListener(context);
  }

  void tapped(int index, RoomDataProvider roomDataProvider) {
    _socketMethods.tapGrid(index, roomDataProvider.roomData['_id'],
        roomDataProvider.displayElement);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.7,
        maxWidth: 500,
      ),
      child: AbsorbPointer(
        absorbing: roomDataProvider.roomData['turn']['socketID'] !=
            _socketMethods.socketClient.id,
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => tapped(
                  index,
                  roomDataProvider,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white24,
                    ),
                  ),
                  child: Center(
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        roomDataProvider.displayElement[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 100,
                            shadows: [
                              Shadow(
                                blurRadius: 40,
                                color: roomDataProvider.displayElement[index] ==
                                        'O'
                                    ? Colors.red
                                    : Colors.blue,
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
