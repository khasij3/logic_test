void main() async {
  int fibonancciEnd = 20;
  List<int> fibonancci = getFibonacciList(fibonancciEnd);
  print(fibonancci);

  int primeStart = 2;
  int primeEnd = 12;
  print(getPrimes(primeStart, primeEnd));

  List<int> nums = [5, 3, 1, 7];
  List<int> contains = [1, 2, 3, 4];
  List<int> numsInContains = getNumsInContains(nums, contains);
  print(numsInContains);
}

int getFibonacci(int num) {
  if (num <= 1) return num;
  return getFibonacci(num - 1) + getFibonacci(num - 2);
}

List<int> getFibonacciList(int end) {
  List<int> nums = [];
  for (var i = 0; i < end; i++) {
    nums.add(getFibonacci(i));
  }
  return nums;
}

List<int> getPrimes(int start, int end) {
  List<int> primes = [];
  int number = start;

  if (start <= 1) number = 2;

  while (primes.length < end) {
    bool isPrime = true;
    // Check if the number is prime
    if (number <= 1) isPrime = false;
    for (var i = 2; i * i <= number; i++) {
      if (number % i == 0) isPrime = false;
    }

    if (isPrime) primes.add(number);
    number++;
  }
  return primes;
}

List<int> getNumsInContains(List<int> nums1, List<int> nums2) {
  List<int> filterNums = [];
  for (var i = 0; i < nums2.length; i++) {
    for (var y = 0; y < nums1.length; y++) {
      // Check if both numbers is equal
      if (nums1[y] == nums2[i]) {
        filterNums.add(nums1[y]);
      }
    }
  }
  return filterNums;
}
