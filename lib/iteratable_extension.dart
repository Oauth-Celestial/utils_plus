import 'dart:math';

extension IterableMethods<T> on Iterable<T> {
  /// getSafeElement
  /// Returns the element if present else returns null

  T? getSafeElement({required int forIndex}) {
    return (forIndex < length && forIndex > 0) ? elementAt(forIndex) : null;
  }

  /// getRandomElement
  /// returns a random element
  T getRandomElement() {
    return elementAt(Random().nextInt(length));
  }

  /// sortAscending
  /// sorts list of integer in asecending order

  E sortAscending<E extends Iterable<num>>() {
    var toSort = [...this];
    toSort.sort();
    return toSort as E;
  }

  /// sortDescending
  /// sorts list of integer in descending order

   E sortDescending<E extends Iterable<num>>() {
    var toSort = [...this];
    
    toSort.sort();
    return toSort.reversed.toList() as E;
  }


 Iterable<T> filterMe({ required bool Function(T element) basedOn }){

    return where(basedOn);
  }



}
