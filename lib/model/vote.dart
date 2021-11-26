class Vote {
  int voteId;
  DateTime voteTime;
  bool choice;
  String voter;
  double myRatio;

  Vote({required this.voteId, required this.voteTime, required this.choice, required this.voter, required this.myRatio});
}