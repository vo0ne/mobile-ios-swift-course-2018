import UIKit

//MARK: 1

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Circle: NamedShape {
    
    var radius: Double
    
    init(name: String, radius: Double){
        self.radius = radius
        super.init(name: name)
    }
    func area()-> Double {
        return radius * radius * Double.pi
    }
    override func  simpleDescription() -> String {
        return ("Circle name is : \(name), and radius is \(radius)")
    }
    
}

var circle:Circle = Circle(name: "example", radius: 10.1)
print(circle.simpleDescription())
var square = circle.area
print (square)



//MARK: 2


enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> Int {
        return rawValue
    }
}

enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    func colorOf(suit:Suit) -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .diamonds, .hearts:
            return "Red"
            
        }
    }
}

extension Rank: CaseIterable {
    
}
extension Suit: CaseIterable {
    
}

struct Card {
    
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    func createDeck() -> [Card] {
        var deck = [Card]()
        Rank.allCases.forEach { rank in
            Suit.allCases.forEach { suit in
                deck.append(Card(rank: rank, suit: suit))
            }
        }
        return deck
    }
}

let card: Card  = Card(rank: .king, suit: .diamonds)
print (card.suit.colorOf(suit: .clubs))
print (card.simpleDescription())
var deck = card.createDeck()
for card in deck {
    print (card.simpleDescription())
}

//MARK: 3

struct Command {
    var message: String
    func execute() {
        print (self.message)
    }
}

enum Mode {
    case idle, work, error
}

class Robot {
    var mode: Mode
    var commands: [Command]?
    
    init(commands: [Command]){
        self.commands = commands
        self.mode = Mode.idle
    }
    func start() {
        if  commands?.isEmpty == true {
            self.mode = .error
        } else {
            self.mode = .work
        }
    }
    
    func go() {
        switch mode {
        case .idle:
            print("robot is OFF")
        case .work:
            print("robot is working")
            for command in self.commands! {
                print (command.execute())
            }
        case .error:
            print("robot is broken")
            
        }
    }
}

class CleanRobot: Robot {
    init() {
        super.init(commands: [Command(message: "clean room 1"),
                              Command(message: "clean room 2"),
                              Command(message: "clean room 3"),
                              Command(message: "clean room 4")])
    }
}

let cleanRobot = CleanRobot()
cleanRobot.start()
cleanRobot.go()

class ATM: Robot {
    
    init() {
        super.init(commands: [Command(message: "Checl card"),
                              Command(message: "Request pin-code"),
                              Command(message: "Requst operation"),
                              Command(message: "PROFIT!!!")])
    }
}

let atm = ATM()
atm.start()
atm.go()

