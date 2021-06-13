class Nodo {
  constructor(value) {
    this.value = value
    this.left = null
    this.right = null
  }
}

class BinaryTree {
  constructor() {
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
    console.log(node.value)
    this.print(node.right)
  }
}

let tree = new BinaryTree()
let arr = [5, 2, 3, -4, 12, 9, 21, 19, 25]

for (let i = 0; i < arr.length; i++) {
  tree.add(arr[i])
}
tree.print()
