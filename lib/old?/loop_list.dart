import 'dart:collection';
import 'dart:core';

class LoopList<E> extends ListBase<E> {
    final List<E> list;
    int length;
    int _start;
    
    int get start {
        return _start;
    }
    
    set start(int next) {
        _start = next;
    }
    
    LoopList(this.list) {
        length = list.length;
        _start = 0;
    }
    
    E operator [](int index) => list[(_start + index) % length];
    
    @override
    void operator []=(int index, E value) {
        list[(_start + index) % length] = value;
    }
    
    void loop({int count = 1}) {
        _start = (_start + count) % length;
    }
    
    @override
    String toString() {
        return list.toString();
    }
}
