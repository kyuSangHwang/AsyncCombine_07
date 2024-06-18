import Foundation

// Topping 구조체 정의
public struct Topping {
  public var name: String
  public var isVegan: Bool

  // 초기화 메서드
  public init(_ name: String, isVegan: Bool) {
    self.name = name
    self.isVegan = isVegan
  }
}

// OrderStatus 열거형 정의 (주문 상태)
public enum OrderStatus: String {
  case placing
  case placed
  case processing
  case delivered
}

// AddressStatus 열거형 정의 (주소 상태)
public enum AddressStatus: String {
  case invalid // 유효하지 않은 주소
  case valid // 유효한 주소
}

// Notification.Name 확장, 알림 이름 추가
public extension Notification.Name {
  static let addTopping = Notification.Name(rawValue: "addTopping")
  static let didUpdateOrderStatus = Notification.Name(rawValue: "didUpdateOrderStatus")
  static let didValidateAddress = Notification.Name(rawValue: "didValidateAddress")
}

// Order 클래스 정의
public class Order {
  // 주문 상태 프로퍼티, 상태가 변경될 때마다 새로운 상태를 출력
  public var status: OrderStatus {
    willSet {
      print("Status of order is now [\(newValue)]")
    }
  }
  
  // 토핑 배열
  public var toppings: [Topping]?
  
  // 주소 상태 프로퍼티
  public var addressStatus: AddressStatus
  
  // 기본 초기화 메서드
  public init() {
    self.status = .placing
    self.addressStatus = .invalid
  }
  
  // 토핑 배열을 받는 초기화 메서드
  public convenience init(toppings: [Topping]) {
    self.init()
    self.toppings = toppings
  }
}
