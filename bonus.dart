class Bonus {
  List<int> fibonacciList(int maxNum) {
    List<int> nums = [];

    for (var i = 0; i < maxNum; i++) {
      nums.add(fibonacci(i));
    }

    return nums;
  }

  int fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  List<int> primeNums(int n, int current, List<int> primes) {
    List<int> newPrimes = primes;
    if (current <= 1) {}
    // Check if current is prime then add to primes array
    for (var i = 0; i < primes.length; i++) {
      if (current % primes[i] == 0) {
        break;
      } else if (i == primes.length) {
        newPrimes.add(current);
      }
    }
    // Return the result when end loop
    if (current == n) {
      return newPrimes;
    }
    return primeNums(current + 1, n, newPrimes);
  }

  List<int> numsInContains(List<int> nums1, List<int> nums2) {
    List<int> filterNums = [];
    for (var i = 0; i < nums2.length; i++) {
      for (var y = 0; y < nums1.length; i++) {
        if (nums1[y] == nums2[i]) {
          filterNums.add(nums1[y]);
        }
      }
    }
    return filterNums;
  }
}
