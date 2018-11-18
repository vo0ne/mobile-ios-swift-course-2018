import UIKit

public class LinkedList<T> {
    
    public class LinkedListNode<T> {
        var value: T
        var next: LinkedListNode?
        var previous: LinkedListNode?
        public init(value: T) {
            self.value = value
        }
    }
    
    typealias Node = LinkedListNode<T>
    
    ///computed proterty to check if the linked list is empty
    public var isEmpty: Bool {
        return head == nil
    }
    
    var head: Node?
    
    /// computed property to return last in list
    var last: Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    init(){}
    
    ///computed property to return the total numbers of nodes
    public var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    /// func append Node to the end of list
    ///
    /// - Parameter node: node to append
    func append(_ node: Node) {
        let newNode = node
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    /// func append  value to the end of list
    ///
    /// - Parameter value: value to append
    public func append(_ value: T) {
        let newNode = Node(value: value)
        append(newNode)
        
    }
    
    /// func append copy of LinkedList to end of list
    ///
    /// - Parameter LinkedList: list to be appended to end of list
    public func append(_ list: LinkedList) {
        var nodeToCopy = list.head
        while let node = nodeToCopy {
            append(node.value)
            nodeToCopy = node.next
        }
    }
    
    /// func to return a node at specific index
    ///
    /// - Parameter index: node's index to return
    /// - Returns: node LinkedListNode
    func nodeAt(index: Int) -> Node? {
        // 1
        if index >= 0 {
            var node = head
            var i = index
            // 2
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        // 3
        return nil
    }
    
    
    ///func remove node of LinkedList
    ///
    /// - Parameter Node: node to be removed
    func remove(_ node: Node)-> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next  = next
        } else {
            head = next
        }
        next?.previous = prev
        node.previous = nil
        node.next = nil
        return node.value
    }
}

/// extension to conversion List to String
extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
}

//examples

let list = LinkedList<String>()
list.append("Hello")
list.isEmpty
list.head
list.last

list.append("World!")
list.isEmpty
list.head
list.last
list.count
list.head?.previous
list.last?.previous

let list2 = LinkedList<String>()
list2.append("Goodbye")
list2.append("World")

list.append(list2)
list.nodeAt(index: 1)
list.remove(list.nodeAt(index: 1)!)
list
