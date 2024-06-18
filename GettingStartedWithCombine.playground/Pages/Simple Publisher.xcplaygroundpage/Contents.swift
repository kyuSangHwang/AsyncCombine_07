import Foundation
import Combine

Just(42)
    .sink { value in
        print("Received \(value)")
    }

["Pepperoni", "Mushrooms", "Onions"].publisher
    .sink { topping in
        print("\(topping) is a favorite topping for pizza")
    }

"Combine".publisher
    .sink { value in
        print("Hello, \(value)")
    }

Just("Combine")
    .sink { value in
        print("Hello, \(value)")
    }

String(123).publisher
    .sink { value in
        print("Hello, \(value)")
    }

123.words.publisher
    .sink { value in
        print("Hello, \(value)")
    }

123.description.publisher
    .sink { value in
        print("Hello, \(value)")
    }

print(123.words)
print(123.description)
