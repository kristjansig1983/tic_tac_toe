class Player {
  static const x ='X';
  static const o = 'O';
  static const empty = '';
}
class Game {
  static final boardLength = 9;
  List<String>? board;

  static List<String> InitBoard() =>
      List.generate(boardLength, (index) => Player.empty);

  bool checkWinner(String playerTurn, int index, List<int> scoreBoard){
    //Lengin á columns
    int colLength = 3;
    //Row staðsetning
    int row = index ~/ colLength;
    //Lengd á staðsetningu
    int col = index % colLength;
    //Hvor er að gera
    int score = playerTurn == 'X' ? 1 : -1;
    //Bæta við á staðsetningu í Array
    scoreBoard[row] += score;
    //Bæta við, telst sem stig eg það lendir á 6 fyrir "beinan sigur", 7 fyrir "ská sigur"
    scoreBoard[colLength + col] += score;
    //Til þess að finna hornin og miðjuna.
    if (row == col) {
      scoreBoard[6] +=score;
    }
    //Til þess að finna milli reitina
    if (colLength - 1 - col == row){
      scoreBoard[7] +=score;
    }
    if(scoreBoard.contains(3) || scoreBoard.contains(-3)){
      return true;
    } else {
      return false;
    }
  }
//TODO:
// - Player
// - Game
//  - variables - whos turn it is?
//  - board
//  - winnerCheck()
}