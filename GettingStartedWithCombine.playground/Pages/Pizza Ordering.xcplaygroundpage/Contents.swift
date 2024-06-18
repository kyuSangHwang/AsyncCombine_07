//: [Previous](@previous)



import Foundation
import Combine

let pizzaOrder = Order() // Order 클래스의 인스턴스 생성

// NotificationCenter의 .didUpdateOrderStatus 알림을 위한 퍼블리셔 생성
let pizzaOrderPublisher = NotificationCenter.default.publisher(for: .didUpdateOrderStatus,
                                                               object: pizzaOrder)

// 퍼블리셔에 구독 추가
pizzaOrderPublisher.sink { notification in
    Task {
        try? await Task.sleep(for: .seconds(2))
        print("--------------- notification ---------------")
        dump(pizzaOrder)
        print("--------------- notification ---------------")
    }
}

// 퍼블리셔에 map 오퍼레이터와 새로운 구독 추가
pizzaOrderPublisher.map { notification in
    notification.userInfo?["status"] as? OrderStatus ?? OrderStatus.placing // userInfo에서 status 값을 추출, 없으면 .placing 반환
}
.sink { orderStatus in
    print("Order status [\(orderStatus)]")
}

// 퍼블리셔에 compactMap 오퍼레이터와 assign을 사용한 구독 추가
pizzaOrderPublisher.compactMap { notification in
    notification.userInfo?["status"] as? OrderStatus // userInfo에서 status 값을 추출하여 Optional을 제거
}
.assign(to: \.status, on: pizzaOrder) // pizzaOrder의 status 프로퍼티에 값 할당

print("Order: \(pizzaOrder.status)")

// NotificationCenter를 통해 .didUpdateOrderStatus 알림을 게시
NotificationCenter.default.post(name: .didUpdateOrderStatus,
                                object: pizzaOrder,
                                userInfo: ["status": OrderStatus.processing])



//: [Next](@next)
