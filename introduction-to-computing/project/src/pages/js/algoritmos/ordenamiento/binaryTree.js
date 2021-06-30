class Nodo {
  constructor(value) {
    this.value = value
    this.left = null
    this.right = null
  }
}

 export class BinaryTree {
  constructor() {
    this.array =Array()
    this.root = null
  }

  get isEmpty() {
    return this.root === null
  }

  /**
   *
   * @param {Nodo} node
   */
  add(value) {
    if (this.isEmpty) {
      this.root = new Nodo(value)
      return
    }

    let auxNode = this.root

    while (auxNode) {
      if (value < auxNode.value) {
        if (auxNode.left) {
          auxNode = auxNode.left
        } else {
          auxNode.left = new Nodo(value)
          return
        }
      } else {
        if (auxNode.right) {
          auxNode = auxNode.right
        } else {
          auxNode.right = new Nodo(value)
          return
        }
      }
    }
  }
  print(node = this.root) {
    if (node === null) {
      return
    }
    this.print(node.left)
    this.array.push(node.value);
    this.print(node.right)

  }

  getnode()
  {
   return this.array;

  } 
}
