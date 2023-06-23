void main() {
  String a1 = '17283';
  String b1 = '172839';
  print('This input is digit more than 6 numbers.');
  print('$a1 is ${moreThanSixValid(a1)}');
  print('$b1 is ${moreThanSixValid(b1)}');
  print('___________');

  String a2 = '111822';
  String b2 = '112762';
  print('This input blocks 2 or more duplicate numbers.');
  print('$a2 is ${notTwoDuplicateValid(a2)}');
  print('$b2 is ${notTwoDuplicateValid(b2)}');
  print('___________');

  String a3 = '123743';
  String b3 = '321895';
  String c3 = '124578';
  print('$a3 is ${notMoreTwoSortValid(a3)}');
  print('$b3 is ${notMoreTwoSortValid(b3)}');
  print('$c3 is ${notMoreTwoSortValid(c3)}');
  print('This input blocks 2 or more sort numbers.');
  print('___________');

  String a4 = '112233';
  String b4 = '882211';
  String c4 = '887712';
  print('This input blocks 2 or more duplicate sort numbers.');
  print('$a4 is ${notMoreTwoSortDupValid(a4)}');
  print('$b4 is ${notMoreTwoSortDupValid(b4)}');
  print('$c4 is ${notMoreTwoSortDupValid(c4)}');
  print('___________');
}

bool moreThanSixValid(String? input) {
  if (input == null || input.isEmpty) return false;
  String clearedInput = input.trim();

  // Check if the number as integer
  if (int.tryParse(clearedInput) is! int) return false;

  // Check if the input's array more than 6
  if (clearedInput.length < 6) return false;

  return true;
}

bool notTwoDuplicateValid(String? input) {
  if (input == null || input.isEmpty) return false;
  String clearedInput = input.trim();

  int beforeInt = 0;
  int rounded = 0;
  int duplicateStack = 0;

  // Check if the number as integer
  if (int.tryParse(clearedInput) is! int) return false;

  // Check if the number duplicate more than 1 times
  while (rounded != clearedInput.length - 1) {
    int curentNumber = int.parse(clearedInput[rounded]);

    rounded++;

    beforeInt = int.parse(clearedInput[rounded]);

    if (curentNumber == beforeInt) duplicateStack++;

    if (duplicateStack > 1) return false;
  }

  return true;
}

bool notMoreTwoSortValid(String? input) {
  if (input == null || input.isEmpty) return false;
  String clearedInput = input.trim();

  int sortStack = 0;
  List<int> numStack = [];

  // Check if the number as integer
  if (int.tryParse(clearedInput) is! int) return false;

  // Check if sort number more than 2 times
  for (var i = 0; i < clearedInput.length; i++) {
    numStack.add(int.parse(clearedInput[i]));
    sortStack = 0;

    for (var y = 1; y < numStack.length; y++) {
      if (numStack[y] % numStack[y - 1] == 1) {
        sortStack++;
      }
      if (numStack[y - 1] % numStack[y] == 1) {
        sortStack++;
      }
      if (sortStack > 1 || sortStack < -1) return false;
    }

    if (numStack.length > 2) {
      numStack.removeAt(0);
    }
  }
  return true;
}

bool notMoreTwoSortDupValid(String? input) {
  if (input == null || input.isEmpty) return false;
  String clearedInput = input.trim();

  int duplicateStack = 0;
  bool isDuplicated = false;

  // Check if the number as integer
  if (int.tryParse(clearedInput) is! int) return false;

  // Check if the duplicate number sort 3 times
  for (var i = 0; i < clearedInput.length; i++) {
    if (!isDuplicated && i > 1) {
      if (clearedInput[i] == clearedInput[i - 1]) {
        isDuplicated = true;
        duplicateStack++;
      } else {
        duplicateStack = 0;
      }
    } else {
      isDuplicated = false;
    }

    if (duplicateStack > 1) return false;
  }

  return true;
}
