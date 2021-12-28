/* Project 01
 * Created by Niko Castellana
 * CS 394
 *
 * This project implements a linked list and
 * binary search tree class by using a Collection
 * as a super class.
 */
import 'BST.dart';
import 'linkedList.dart';

abstract class Collection<T extends Comparable> extends Object{
  int _size = 0;

  /* Deferred Methods */
  Collection add(T data) ;
  Collection copy();
  T? operator [] (int index);
  void printString();

  /* Concrete Methods */
  Collection(){}
  int getSize(){return _size;}
  void incrementSize(){_size++;}

  // Applies a function to every node and returns
  // a new linked list.
  linkedList<T> map(Function fn){
    linkedList<T> newList = new linkedList();
    for(int i = 0; i < this.getSize(); i++){
      newList.add(fn(this[i]));
    }
    return newList;
  }

  // Checks if another object is a subset of this object
  bool contains(Object other){
    if(this.runtimeType != other.runtimeType){return false;}
    other = other as Collection<T>;
    if(this.getSize() < other.getSize()){return false;}

    int match = 0;
    bool retVal = false;

    for(int i = 0; i < this.getSize(); i++){
      for(int j = 0; j < other.getSize(); j++){
        if(this[i]!.compareTo(other[j]) == 0){
          match++;
        }
      }
    }

    if(match == other.getSize()){retVal = true;}
    return retVal;
  }

  // Checks if two objects are equal to each other
  bool equals(Object other){
    if(this.runtimeType != other.runtimeType){return false;}
    other = other as Collection<T>;
    if(this.getSize() != other.getSize()){return false;}

    for(int i = 0; i < this.getSize(); i++){
      if(this[i]!.compareTo(other[i]) != 0){
        return false;
      }
    }

    return true;
  }

} // End of Collection

void main(){
  linkedList l1 = new linkedList();
  l1.add(3)
  ..add(1)
  ..add(2)
  ..add(4);
  l1.printString();
  linkedList l2 = l1.copy();
  l2.add(5);
  l2.printString();
  linkedList l5 = new linkedList();
  l5.add(3)
    ..add(2)
    ..add(4);
  print(l1.contains(l5));
  print(l1.contains(5));
  linkedList l3 = new linkedList();
  l3.add("A")
    ..add("B")
    ..add("C")
    ..add("D");
  linkedList l4 = new linkedList();
  l4.add(1)
    ..add(2)
    ..add(3)
    ..add(4);
  print(l1.equals(l2));
  print(l1.equals(l4));
  linkedList newList = l1.map((x)=> (x+2));
  newList.printString();
  BST b1 = new BST();

  b1.add(100)
  ..add(90)
  ..add(80)
  ..add(95)
  ..add(110)
  ..add(105)
  ..add(115)
  ..add(120)
  ..add(5);

  b1.printString();
  BST b2 = b1.copy();
  b2.printString();
  print(b1[4]);
  print(b1[3]);
  print(b1[1]);
}