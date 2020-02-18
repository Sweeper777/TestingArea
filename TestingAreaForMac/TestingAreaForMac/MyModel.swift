import Foundation

struct Node {
    let title: String
    let detail: String
    let children: [Node]
}

let testTree = Node(title: "root", detail: "", children: [
    Node(title: "A", detail: "", children: [
        Node(title: "Child A", detail: "Another Description", children: []),
        Node(title: "Child B", detail: "", children: [
            Node(title: "Sub Child A", detail: "Final Description A", children: [
                Node(title: "Leaf A", detail: "Leafy Leaf", children: []),
                Node(title: "Leaf B", detail: "Leafy Leaf", children: []),
                Node(title: "Leaf C", detail: "Leafy Leaf", children: []),
                Node(title: "Leaf D", detail: "Leafy Leaf", children: []),
            ]),
            Node(title: "Sub Child B", detail: "Final Description B", children: [
                Node(title: "Leaf E", detail: "Leafy Leaf", children: []),
                Node(title: "Leaf F", detail: "Leafy Leaf", children: []),
                Node(title: "Leaf G", detail: "Leafy Leaf", children: []),
                Node(title: "Leaf H", detail: "Leafy Leaf", children: []),
            ]),
        ]),
        Node(title: "Child C", detail: "", children: []),
    ]),
    Node(title: "B", detail: "", children: [
        Node(title: "Child D", detail: "", children: [
            Node(title: "Sub Child C", detail: "Final Description C", children: []),
        ]),
        Node(title: "Child E", detail: "", children: []),
    ]),
    Node(title: "C", detail: "Some Description", children: []),
])
