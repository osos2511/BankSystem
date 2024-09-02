import 'package:dart_project1/bankSystemProject/clientClass.dart';

class BasicBankAccount {
  static int accountIdGenerator = 1;
  late int accountId;
  double balance;
  late Client owner;
  BasicBankAccount({required this.balance}) {
    accountId = accountIdGenerator;
    accountIdGenerator++;
  }
  void viewAccountDetails(){
    print('accountId: $accountId');
    print('name: ${owner.name}');
    print('address: ${owner.address}');
    print('phoneNumber: ${owner.phoneNumber}');
    print('balance: $balance');
  }

  bool withDraw(double amount) {
    if (amount < 0) {
      print('error,your amount must be greater than zero');
      return false;
    }
    if (amount > balance) {
      print('error, your balance is not enough');
      return false;
    }
    balance -= amount;
    print('has been withdraw successfully, this balance now is ${balance}');
    return true;
  }

  bool deposit(double amount) {
    if (amount < 0) {
      print('wrong pls try again later');
      return false;
    }
    balance += amount;
    print('Amount of money has been withdrawn successfully ${balance}');
    return true;
  }
}
