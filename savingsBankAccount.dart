import 'package:dart_project1/bankSystemProject/clientClass.dart';
import 'basicBankSystem.dart';

class SavingsBankAccount extends BasicBankAccount {
  double minBalance;
  SavingsBankAccount(double balance,{this.minBalance=1000}) : super(balance:balance) {
  if (balance<minBalance) {
  print('the initial balance must be $minBalance');
  }
  }
  @override
  bool withDraw(double amount) {
    if (balance - amount <= minBalance) {
      print('error, minimum balance must be $minBalance There is no withdrawal');
      return false;
    }
    return super.withDraw(amount);
  }

  @override
  bool deposit(double amount) {
    if (amount < 100) {
      print('error, your money must be >=100');
      return false;
    }
    return super.deposit(amount);
  }
}


void main(){
  Client owner=Client('osama', 'damietta', '01032721748');
  BasicBankAccount account=BasicBankAccount(balance:1000);
  owner.account=account;
  account.owner=owner;
  account.viewAccountDetails();
}