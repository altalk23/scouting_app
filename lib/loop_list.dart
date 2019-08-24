import 'dart:collection';
import 'dart:core';

class LoopList<E> extends ListBase<E> {
    
    final List<E> list;
    int length;
    int start;
    
    LoopList(this.list) {
        length = list.length;
        start = 0;
    }
    
    E operator [](int index) => list[(start + index) % length];
    
    @override
    void operator []=(int index, E value) {
        list[(start + index) % length] = value;
    }
    
    void loop({int count = 1}) {
        start = (start + count) % length;
    }

    @override
    String toString() {
        return list.toString();
    }
}