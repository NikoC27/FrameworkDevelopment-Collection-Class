import 'Collection.dart';
import 'linkedNode.dart';

class linkedList<T extends Comparable> extends Collection<T>{
  linkedNode? head;

  // Adds nodes to the linked list
  @override
  linkedList add(T data){
    linkedNode? newNode = new linkedNode(data);

    if(head == null){
      head = newNode;
    }
    else{
      linkedNode? curr = head;
      while(curr!.next != null){curr = curr.next;}
      curr.next = newNode;
    }

    incrementSize();
    return this;
  }

  // Copies this linked list and returns a new one
  @override
  linkedList copy(){
    linkedList temp = new linkedList();

    for(int i = 0; i < this.getSize(); i++){
      temp.add(this[i]!);
    }
    return temp;
  }

  // Returns the value of the node at the index
  @override
  T? operator [] (int index){
    assert (index >= 0 && index < this.getSize()) ;

    int count = 0;
    linkedNode? curr = head;
    T? value;

    while(curr != null){
      if(count == index){
        value = curr.data;
        break;
      }
      count++;
      curr = curr.next;
    }

    return value;
  }

  // Prints the list in order
  @override
  void printString(){
    for(int i = 0; i < this.getSize(); i++){
      print(this[i]);
    }
  }

}