

class Money_Pool{
  double currentMoney = 0.0;
  double spendMoney = 0.0;
  double totalEarnedMoney = 0.0;
  double random = 0.0;
  List contributors;

  void set Cmoney(double Cmoney)
  {
    this.currentMoney = Cmoney;
  }
  double get Cmoney
  {
    return currentMoney;
  }
  void set Smoney(double Smoney)
  {
    this.spendMoney = Smoney;
  }
  double get Smoney
  {
    return spendMoney;
  }
  void set Tmoney(double Tmoney)
  {
    this.totalEarnedMoney = Tmoney;
  }
  double get Tmoney
  {
    return totalEarnedMoney;
  }
  Money_Pool(this.random);

}