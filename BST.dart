import 'Collection.dart';
import 'treeNode.dart';

class BST<T extends Comparable> extends Collection<T>{
  treeNode? root;
  int _count = 0;
  T? _indexValue;

  // Helper function for add()
  treeNode? _add(treeNode? curr, T data){
    // Add node
    if(curr == null){
      treeNode? newNode = new treeNode(data);
      curr = newNode;
    }
    // Go Left
    if(data.compareTo(curr.data) < 0){
      curr.left = _add(curr.left, data);
    }
    // Go Right
    else if(data.compareTo(curr.data) > 0){
      curr.right = _add(curr.right, data);
    }

    return curr;
  }

  // Helper function for []
  void _inOrder(treeNode? curr, int index){
    if(curr == null){return;}

    if(_count <= index){
      _inOrder(curr.left, index);
    }

    if(_count == index){
      _indexValue = curr.data;
    }

    _count++;

    if(_count <= index) {
      _inOrder(curr.right, index);
    }
  }

  // Helper function for copy
  void _preOrder(treeNode? curr, BST temp){
    if(curr == null){return;}
    temp.add(curr.data);
    _preOrder(curr.left, temp);
    _preOrder(curr.right, temp);
  }

  // Traverses through the tree using recursion
  // and adding nodes.
  @override
  BST add(T data){
    root = _add(root,data);
    incrementSize();
    return this;
  }

  // Traverses through the tree using preorder
  // recursion, copying and returning a new tree
  @override
  BST copy(){
    BST temp = new BST();
    _preOrder(root,temp);
    return temp;
  }

  // Traverses through the tree using inorder
  // recursion and saves the value at the current
  // index
  @override
  T? operator [] (int index){
    _count = 0;
    _indexValue = null;
    _inOrder(root, index);
    return _indexValue;
  }

  // Prints the tree in order
  @override
  void printString(){
    for(int i = 0; i < this.getSize(); i++){
      print(this[i]);
    }
  }

}// End of BST