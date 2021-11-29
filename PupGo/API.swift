// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// only user 3 cases
public enum UserGender: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case male
  case female
  /// put all other to this
  case notToDeclared
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MALE": self = .male
      case "FEMALE": self = .female
      case "NOT_TO_DECLARED": self = .notToDeclared
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .male: return "MALE"
      case .female: return "FEMALE"
      case .notToDeclared: return "NOT_TO_DECLARED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: UserGender, rhs: UserGender) -> Bool {
    switch (lhs, rhs) {
      case (.male, .male): return true
      case (.female, .female): return true
      case (.notToDeclared, .notToDeclared): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [UserGender] {
    return [
      .male,
      .female,
      .notToDeclared,
    ]
  }
}

public struct PetCreateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - name
  ///   - image
  ///   - gender: only two
  ///   - breed: breed of dog, cat etc
  ///   - isCastration: is castration or not: true for castration
  ///   - birthday
  ///   - location
  ///   - uid: tmp value, should also proof by JWT later
  public init(name: Swift.Optional<String?> = nil, image: Swift.Optional<String?> = nil, gender: Swift.Optional<PetGender?> = nil, breed: Swift.Optional<String?> = nil, isCastration: Bool, birthday: Swift.Optional<String?> = nil, location: Swift.Optional<LocationInput?> = nil, uid: GraphQLID) {
    graphQLMap = ["name": name, "image": image, "gender": gender, "breed": breed, "isCastration": isCastration, "birthday": birthday, "location": location, "uid": uid]
  }

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var image: Swift.Optional<String?> {
    get {
      return graphQLMap["image"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }

  /// only two
  public var gender: Swift.Optional<PetGender?> {
    get {
      return graphQLMap["gender"] as? Swift.Optional<PetGender?> ?? Swift.Optional<PetGender?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
    }
  }

  /// breed of dog, cat etc
  public var breed: Swift.Optional<String?> {
    get {
      return graphQLMap["breed"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "breed")
    }
  }

  /// is castration or not: true for castration
  public var isCastration: Bool {
    get {
      return graphQLMap["isCastration"] as! Bool
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isCastration")
    }
  }

  public var birthday: Swift.Optional<String?> {
    get {
      return graphQLMap["birthday"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "birthday")
    }
  }

  public var location: Swift.Optional<LocationInput?> {
    get {
      return graphQLMap["location"] as? Swift.Optional<LocationInput?> ?? Swift.Optional<LocationInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "location")
    }
  }

  /// tmp value, should also proof by JWT later
  public var uid: GraphQLID {
    get {
      return graphQLMap["uid"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "uid")
    }
  }
}

/// Pet have no not to declared
public enum PetGender: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case male
  case female
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MALE": self = .male
      case "FEMALE": self = .female
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .male: return "MALE"
      case .female: return "FEMALE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: PetGender, rhs: PetGender) -> Bool {
    switch (lhs, rhs) {
      case (.male, .male): return true
      case (.female, .female): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [PetGender] {
    return [
      .male,
      .female,
    ]
  }
}

public struct LocationInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - country
  ///   - city
  ///   - address
  ///   - state
  ///   - coordinate
  public init(country: Swift.Optional<String?> = nil, city: Swift.Optional<String?> = nil, address: Swift.Optional<String?> = nil, state: Swift.Optional<String?> = nil, coordinate: Swift.Optional<CoordinateInput?> = nil) {
    graphQLMap = ["country": country, "city": city, "address": address, "State": state, "Coordinate": coordinate]
  }

  public var country: Swift.Optional<String?> {
    get {
      return graphQLMap["country"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "country")
    }
  }

  public var city: Swift.Optional<String?> {
    get {
      return graphQLMap["city"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "city")
    }
  }

  public var address: Swift.Optional<String?> {
    get {
      return graphQLMap["address"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "address")
    }
  }

  public var state: Swift.Optional<String?> {
    get {
      return graphQLMap["State"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "State")
    }
  }

  public var coordinate: Swift.Optional<CoordinateInput?> {
    get {
      return graphQLMap["Coordinate"] as? Swift.Optional<CoordinateInput?> ?? Swift.Optional<CoordinateInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Coordinate")
    }
  }
}

public struct CoordinateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - isBlur: when blur is setting that means the latitude and longitude is not the precise.
  ///   - latitude
  ///   - longitude
  public init(isBlur: Bool, latitude: Swift.Optional<String?> = nil, longitude: Swift.Optional<String?> = nil) {
    graphQLMap = ["isBlur": isBlur, "latitude": latitude, "longitude": longitude]
  }

  /// when blur is setting that means the latitude and longitude is not the precise.
  public var isBlur: Bool {
    get {
      return graphQLMap["isBlur"] as! Bool
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isBlur")
    }
  }

  public var latitude: Swift.Optional<String?> {
    get {
      return graphQLMap["latitude"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "latitude")
    }
  }

  public var longitude: Swift.Optional<String?> {
    get {
      return graphQLMap["longitude"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "longitude")
    }
  }
}

public struct EventsCreateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - pid
  ///   - location
  ///   - timeRange
  ///   - limit
  ///   - image
  ///   - description
  public init(pid: GraphQLID, location: Swift.Optional<LocationInput?> = nil, timeRange: Swift.Optional<TimeRangeInput?> = nil, limit: Swift.Optional<EventsLimitsInput?> = nil, image: Swift.Optional<String?> = nil, description: Swift.Optional<String?> = nil) {
    graphQLMap = ["pid": pid, "location": location, "timeRange": timeRange, "limit": limit, "image": image, "description": description]
  }

  public var pid: GraphQLID {
    get {
      return graphQLMap["pid"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pid")
    }
  }

  public var location: Swift.Optional<LocationInput?> {
    get {
      return graphQLMap["location"] as? Swift.Optional<LocationInput?> ?? Swift.Optional<LocationInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "location")
    }
  }

  public var timeRange: Swift.Optional<TimeRangeInput?> {
    get {
      return graphQLMap["timeRange"] as? Swift.Optional<TimeRangeInput?> ?? Swift.Optional<TimeRangeInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "timeRange")
    }
  }

  public var limit: Swift.Optional<EventsLimitsInput?> {
    get {
      return graphQLMap["limit"] as? Swift.Optional<EventsLimitsInput?> ?? Swift.Optional<EventsLimitsInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "limit")
    }
  }

  public var image: Swift.Optional<String?> {
    get {
      return graphQLMap["image"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }

  public var description: Swift.Optional<String?> {
    get {
      return graphQLMap["description"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }
}

public struct TimeRangeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - startTime
  ///   - endTime
  public init(startTime: Swift.Optional<String?> = nil, endTime: Swift.Optional<String?> = nil) {
    graphQLMap = ["startTime": startTime, "endTime": endTime]
  }

  public var startTime: Swift.Optional<String?> {
    get {
      return graphQLMap["startTime"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startTime")
    }
  }

  public var endTime: Swift.Optional<String?> {
    get {
      return graphQLMap["endTime"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "endTime")
    }
  }
}

public struct EventsLimitsInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - limitOfDog
  ///   - limitOfHuman
  public init(limitOfDog: Swift.Optional<Int?> = nil, limitOfHuman: Swift.Optional<Int?> = nil) {
    graphQLMap = ["limitOfDog": limitOfDog, "limitOfHuman": limitOfHuman]
  }

  public var limitOfDog: Swift.Optional<Int?> {
    get {
      return graphQLMap["limitOfDog"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "limitOfDog")
    }
  }

  public var limitOfHuman: Swift.Optional<Int?> {
    get {
      return graphQLMap["limitOfHuman"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "limitOfHuman")
    }
  }
}

public struct EventsJoinInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - pid
  ///   - eventId
  ///   - description
  public init(pid: GraphQLID, eventId: GraphQLID, description: Swift.Optional<String?> = nil) {
    graphQLMap = ["pid": pid, "eventID": eventId, "description": description]
  }

  public var pid: GraphQLID {
    get {
      return graphQLMap["pid"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pid")
    }
  }

  public var eventId: GraphQLID {
    get {
      return graphQLMap["eventID"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eventID")
    }
  }

  public var description: Swift.Optional<String?> {
    get {
      return graphQLMap["description"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }
}

public final class EventsCreateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation eventsCreate {
      eventsCreate(
        eventsCreateInput: {pid: "166203e8-dc19-4de1-9e6e-b5c58661f8bf", location: {address: "123 road"}, timeRange: {startTime: ""}, limit: {limitOfDog: 5, limitOfHuman: 5}, image: "apple.jpg"}
      ) {
        __typename
        result {
          __typename
          id
          image
        }
      }
    }
    """

  public let operationName: String = "eventsCreate"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("eventsCreate", arguments: ["eventsCreateInput": ["pid": "166203e8-dc19-4de1-9e6e-b5c58661f8bf", "location": ["address": "123 road"], "timeRange": ["startTime": ""], "limit": ["limitOfDog": 5, "limitOfHuman": 5], "image": "apple.jpg"]], type: .nonNull(.object(EventsCreate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(eventsCreate: EventsCreate) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "eventsCreate": eventsCreate.resultMap])
    }

    public var eventsCreate: EventsCreate {
      get {
        return EventsCreate(unsafeResultMap: resultMap["eventsCreate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "eventsCreate")
      }
    }

    public struct EventsCreate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["EventsCreatePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("result", type: .object(Result.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: Result? = nil) {
        self.init(unsafeResultMap: ["__typename": "EventsCreatePayload", "result": result.flatMap { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: Result? {
        get {
          return (resultMap["result"] as? ResultMap).flatMap { Result(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Event"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("image", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, image: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Event", "id": id, "image": image])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }
      }
    }
  }
}

public final class UserProfileListGetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query userProfileListGet {
      userProfileListGet(
        userProfileListGetInput: {uid: ["982a33ee-2792-4ede-b307-f38d187a2015"]}
      ) {
        __typename
        result {
          __typename
          id
          name
          gender
          birthday
          email
        }
      }
    }
    """

  public let operationName: String = "userProfileListGet"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("userProfileListGet", arguments: ["userProfileListGetInput": ["uid": ["982a33ee-2792-4ede-b307-f38d187a2015"]]], type: .nonNull(.object(UserProfileListGet.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(userProfileListGet: UserProfileListGet) {
      self.init(unsafeResultMap: ["__typename": "Query", "userProfileListGet": userProfileListGet.resultMap])
    }

    public var userProfileListGet: UserProfileListGet {
      get {
        return UserProfileListGet(unsafeResultMap: resultMap["userProfileListGet"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "userProfileListGet")
      }
    }

    public struct UserProfileListGet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["UserProfileListGetPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("result", type: .nonNull(.list(.nonNull(.object(Result.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: [Result]) {
        self.init(unsafeResultMap: ["__typename": "UserProfileListGetPayload", "result": result.map { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: [Result] {
        get {
          return (resultMap["result"] as! [ResultMap]).map { (value: ResultMap) -> Result in Result(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Result) -> ResultMap in value.resultMap }, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["UserProfile"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("gender", type: .scalar(UserGender.self)),
            GraphQLField("birthday", type: .scalar(String.self)),
            GraphQLField("email", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, gender: UserGender? = nil, birthday: String? = nil, email: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserProfile", "id": id, "name": name, "gender": gender, "birthday": birthday, "email": email])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var gender: UserGender? {
          get {
            return resultMap["gender"] as? UserGender
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
          }
        }

        /// only use year as unit not month
        public var birthday: String? {
          get {
            return resultMap["birthday"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "birthday")
          }
        }

        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }
      }
    }
  }
}

public final class Testing2Mutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Testing2($input: PetCreateInput!) {
      petCreate(petCreateInput: $input) {
        __typename
        result {
          __typename
          id
          image
          gender
          breed
          birthday
          isCastration
        }
      }
    }
    """

  public let operationName: String = "Testing2"

  public var input: PetCreateInput

  public init(input: PetCreateInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("petCreate", arguments: ["petCreateInput": GraphQLVariable("input")], type: .nonNull(.object(PetCreate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(petCreate: PetCreate) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "petCreate": petCreate.resultMap])
    }

    public var petCreate: PetCreate {
      get {
        return PetCreate(unsafeResultMap: resultMap["petCreate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "petCreate")
      }
    }

    public struct PetCreate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PetCreatePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("result", type: .object(Result.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: Result? = nil) {
        self.init(unsafeResultMap: ["__typename": "PetCreatePayload", "result": result.flatMap { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: Result? {
        get {
          return (resultMap["result"] as? ResultMap).flatMap { Result(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PetProfile"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("gender", type: .scalar(PetGender.self)),
            GraphQLField("breed", type: .scalar(String.self)),
            GraphQLField("birthday", type: .scalar(String.self)),
            GraphQLField("isCastration", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, image: String? = nil, gender: PetGender? = nil, breed: String? = nil, birthday: String? = nil, isCastration: Bool) {
          self.init(unsafeResultMap: ["__typename": "PetProfile", "id": id, "image": image, "gender": gender, "breed": breed, "birthday": birthday, "isCastration": isCastration])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        /// only two
        public var gender: PetGender? {
          get {
            return resultMap["gender"] as? PetGender
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
          }
        }

        /// breed of dog, cat etc
        public var breed: String? {
          get {
            return resultMap["breed"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "breed")
          }
        }

        public var birthday: String? {
          get {
            return resultMap["birthday"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "birthday")
          }
        }

        /// is castration or not: true for castration
        public var isCastration: Bool {
          get {
            return resultMap["isCastration"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isCastration")
          }
        }
      }
    }
  }
}

public final class AddeventTestMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation addeventTest($input: EventsCreateInput!) {
      eventsCreate(eventsCreateInput: $input) {
        __typename
        result {
          __typename
          id
        }
      }
    }
    """

  public let operationName: String = "addeventTest"

  public var input: EventsCreateInput

  public init(input: EventsCreateInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("eventsCreate", arguments: ["eventsCreateInput": GraphQLVariable("input")], type: .nonNull(.object(EventsCreate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(eventsCreate: EventsCreate) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "eventsCreate": eventsCreate.resultMap])
    }

    public var eventsCreate: EventsCreate {
      get {
        return EventsCreate(unsafeResultMap: resultMap["eventsCreate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "eventsCreate")
      }
    }

    public struct EventsCreate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["EventsCreatePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("result", type: .object(Result.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: Result? = nil) {
        self.init(unsafeResultMap: ["__typename": "EventsCreatePayload", "result": result.flatMap { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: Result? {
        get {
          return (resultMap["result"] as? ResultMap).flatMap { Result(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Event"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Event", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class PetProfileListGetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query petProfileListGet {
      petProfileListGet(
        petProfileListGetInput: {pid: ["5d76c3ad-d286-4c82-9ff0-6e043389f00d", "ca035fdd-bc77-4d76-879a-1588c394cd74"]}
      ) {
        __typename
        result {
          __typename
          id
          name
          image
          gender
          breed
          isCastration
          birthday
        }
      }
    }
    """

  public let operationName: String = "petProfileListGet"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("petProfileListGet", arguments: ["petProfileListGetInput": ["pid": ["5d76c3ad-d286-4c82-9ff0-6e043389f00d", "ca035fdd-bc77-4d76-879a-1588c394cd74"]]], type: .nonNull(.object(PetProfileListGet.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(petProfileListGet: PetProfileListGet) {
      self.init(unsafeResultMap: ["__typename": "Query", "petProfileListGet": petProfileListGet.resultMap])
    }

    public var petProfileListGet: PetProfileListGet {
      get {
        return PetProfileListGet(unsafeResultMap: resultMap["petProfileListGet"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "petProfileListGet")
      }
    }

    public struct PetProfileListGet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PetProfileListGetPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("result", type: .nonNull(.list(.nonNull(.object(Result.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: [Result]) {
        self.init(unsafeResultMap: ["__typename": "PetProfileListGetPayload", "result": result.map { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: [Result] {
        get {
          return (resultMap["result"] as! [ResultMap]).map { (value: ResultMap) -> Result in Result(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Result) -> ResultMap in value.resultMap }, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PetProfile"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("gender", type: .scalar(PetGender.self)),
            GraphQLField("breed", type: .scalar(String.self)),
            GraphQLField("isCastration", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("birthday", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, image: String? = nil, gender: PetGender? = nil, breed: String? = nil, isCastration: Bool, birthday: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PetProfile", "id": id, "name": name, "image": image, "gender": gender, "breed": breed, "isCastration": isCastration, "birthday": birthday])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        /// only two
        public var gender: PetGender? {
          get {
            return resultMap["gender"] as? PetGender
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
          }
        }

        /// breed of dog, cat etc
        public var breed: String? {
          get {
            return resultMap["breed"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "breed")
          }
        }

        /// is castration or not: true for castration
        public var isCastration: Bool {
          get {
            return resultMap["isCastration"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isCastration")
          }
        }

        public var birthday: String? {
          get {
            return resultMap["birthday"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "birthday")
          }
        }
      }
    }
  }
}

public final class Testing1Query: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Testing1 {
      recommendationGet(
        recommendationGetInput: {pid: "caefd1f0-a4fc-4ba3-81d8-1d0b0fbec730"}
      ) {
        __typename
        result {
          __typename
          pet {
            __typename
            id
            name
            image
            gender
            breed
            isCastration
            birthday
          }
        }
      }
      userProfileListGet(
        userProfileListGetInput: {uid: ["982a33ee-2792-4ede-b307-f38d187a2015"]}
      ) {
        __typename
        result {
          __typename
          id
          name
          gender
          birthday
          email
        }
      }
      petProfileListGet(
        petProfileListGetInput: {pid: ["149464c2-f8ee-4e6f-a551-260b6467fa95", "5d76c3ad-d286-4c82-9ff0-6e043389f00d"]}
      ) {
        __typename
        result {
          __typename
          id
          name
          image
          gender
          breed
          isCastration
          birthday
        }
      }
    }
    """

  public let operationName: String = "Testing1"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("recommendationGet", arguments: ["recommendationGetInput": ["pid": "caefd1f0-a4fc-4ba3-81d8-1d0b0fbec730"]], type: .nonNull(.object(RecommendationGet.selections))),
        GraphQLField("userProfileListGet", arguments: ["userProfileListGetInput": ["uid": ["982a33ee-2792-4ede-b307-f38d187a2015"]]], type: .nonNull(.object(UserProfileListGet.selections))),
        GraphQLField("petProfileListGet", arguments: ["petProfileListGetInput": ["pid": ["149464c2-f8ee-4e6f-a551-260b6467fa95", "5d76c3ad-d286-4c82-9ff0-6e043389f00d"]]], type: .nonNull(.object(PetProfileListGet.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(recommendationGet: RecommendationGet, userProfileListGet: UserProfileListGet, petProfileListGet: PetProfileListGet) {
      self.init(unsafeResultMap: ["__typename": "Query", "recommendationGet": recommendationGet.resultMap, "userProfileListGet": userProfileListGet.resultMap, "petProfileListGet": petProfileListGet.resultMap])
    }

    public var recommendationGet: RecommendationGet {
      get {
        return RecommendationGet(unsafeResultMap: resultMap["recommendationGet"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "recommendationGet")
      }
    }

    public var userProfileListGet: UserProfileListGet {
      get {
        return UserProfileListGet(unsafeResultMap: resultMap["userProfileListGet"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "userProfileListGet")
      }
    }

    public var petProfileListGet: PetProfileListGet {
      get {
        return PetProfileListGet(unsafeResultMap: resultMap["petProfileListGet"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "petProfileListGet")
      }
    }

    public struct RecommendationGet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RecommendationGetPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("result", type: .nonNull(.list(.nonNull(.object(Result.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: [Result]) {
        self.init(unsafeResultMap: ["__typename": "RecommendationGetPayload", "result": result.map { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: [Result] {
        get {
          return (resultMap["result"] as! [ResultMap]).map { (value: ResultMap) -> Result in Result(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Result) -> ResultMap in value.resultMap }, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Recommendation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pet", type: .object(Pet.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pet: Pet? = nil) {
          self.init(unsafeResultMap: ["__typename": "Recommendation", "pet": pet.flatMap { (value: Pet) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var pet: Pet? {
          get {
            return (resultMap["pet"] as? ResultMap).flatMap { Pet(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pet")
          }
        }

        public struct Pet: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PetProfile"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("image", type: .scalar(String.self)),
              GraphQLField("gender", type: .scalar(PetGender.self)),
              GraphQLField("breed", type: .scalar(String.self)),
              GraphQLField("isCastration", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("birthday", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, name: String? = nil, image: String? = nil, gender: PetGender? = nil, breed: String? = nil, isCastration: Bool, birthday: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PetProfile", "id": id, "name": name, "image": image, "gender": gender, "breed": breed, "isCastration": isCastration, "birthday": birthday])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var image: String? {
            get {
              return resultMap["image"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "image")
            }
          }

          /// only two
          public var gender: PetGender? {
            get {
              return resultMap["gender"] as? PetGender
            }
            set {
              resultMap.updateValue(newValue, forKey: "gender")
            }
          }

          /// breed of dog, cat etc
          public var breed: String? {
            get {
              return resultMap["breed"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "breed")
            }
          }

          /// is castration or not: true for castration
          public var isCastration: Bool {
            get {
              return resultMap["isCastration"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isCastration")
            }
          }

          public var birthday: String? {
            get {
              return resultMap["birthday"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "birthday")
            }
          }
        }
      }
    }

    public struct UserProfileListGet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["UserProfileListGetPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("result", type: .nonNull(.list(.nonNull(.object(Result.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: [Result]) {
        self.init(unsafeResultMap: ["__typename": "UserProfileListGetPayload", "result": result.map { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: [Result] {
        get {
          return (resultMap["result"] as! [ResultMap]).map { (value: ResultMap) -> Result in Result(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Result) -> ResultMap in value.resultMap }, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["UserProfile"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("gender", type: .scalar(UserGender.self)),
            GraphQLField("birthday", type: .scalar(String.self)),
            GraphQLField("email", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, gender: UserGender? = nil, birthday: String? = nil, email: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserProfile", "id": id, "name": name, "gender": gender, "birthday": birthday, "email": email])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var gender: UserGender? {
          get {
            return resultMap["gender"] as? UserGender
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
          }
        }

        /// only use year as unit not month
        public var birthday: String? {
          get {
            return resultMap["birthday"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "birthday")
          }
        }

        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }
      }
    }

    public struct PetProfileListGet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PetProfileListGetPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("result", type: .nonNull(.list(.nonNull(.object(Result.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: [Result]) {
        self.init(unsafeResultMap: ["__typename": "PetProfileListGetPayload", "result": result.map { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: [Result] {
        get {
          return (resultMap["result"] as! [ResultMap]).map { (value: ResultMap) -> Result in Result(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Result) -> ResultMap in value.resultMap }, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PetProfile"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("gender", type: .scalar(PetGender.self)),
            GraphQLField("breed", type: .scalar(String.self)),
            GraphQLField("isCastration", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("birthday", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, image: String? = nil, gender: PetGender? = nil, breed: String? = nil, isCastration: Bool, birthday: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PetProfile", "id": id, "name": name, "image": image, "gender": gender, "breed": breed, "isCastration": isCastration, "birthday": birthday])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        /// only two
        public var gender: PetGender? {
          get {
            return resultMap["gender"] as? PetGender
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
          }
        }

        /// breed of dog, cat etc
        public var breed: String? {
          get {
            return resultMap["breed"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "breed")
          }
        }

        /// is castration or not: true for castration
        public var isCastration: Bool {
          get {
            return resultMap["isCastration"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isCastration")
          }
        }

        public var birthday: String? {
          get {
            return resultMap["birthday"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "birthday")
          }
        }
      }
    }
  }
}

public final class PetProfilesGetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query petProfilesGet($pid: [ID!]) {
      petProfileListGet(petProfileListGetInput: {pid: $pid}) {
        __typename
        result {
          __typename
          id
          name
          image
          gender
          breed
          isCastration
          birthday
        }
      }
    }
    """

  public let operationName: String = "petProfilesGet"

  public var pid: [GraphQLID]?

  public init(pid: [GraphQLID]?) {
    self.pid = pid
  }

  public var variables: GraphQLMap? {
    return ["pid": pid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("petProfileListGet", arguments: ["petProfileListGetInput": ["pid": GraphQLVariable("pid")]], type: .nonNull(.object(PetProfileListGet.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(petProfileListGet: PetProfileListGet) {
      self.init(unsafeResultMap: ["__typename": "Query", "petProfileListGet": petProfileListGet.resultMap])
    }

    public var petProfileListGet: PetProfileListGet {
      get {
        return PetProfileListGet(unsafeResultMap: resultMap["petProfileListGet"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "petProfileListGet")
      }
    }

    public struct PetProfileListGet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PetProfileListGetPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("result", type: .nonNull(.list(.nonNull(.object(Result.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: [Result]) {
        self.init(unsafeResultMap: ["__typename": "PetProfileListGetPayload", "result": result.map { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: [Result] {
        get {
          return (resultMap["result"] as! [ResultMap]).map { (value: ResultMap) -> Result in Result(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Result) -> ResultMap in value.resultMap }, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PetProfile"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("gender", type: .scalar(PetGender.self)),
            GraphQLField("breed", type: .scalar(String.self)),
            GraphQLField("isCastration", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("birthday", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, image: String? = nil, gender: PetGender? = nil, breed: String? = nil, isCastration: Bool, birthday: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PetProfile", "id": id, "name": name, "image": image, "gender": gender, "breed": breed, "isCastration": isCastration, "birthday": birthday])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        /// only two
        public var gender: PetGender? {
          get {
            return resultMap["gender"] as? PetGender
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
          }
        }

        /// breed of dog, cat etc
        public var breed: String? {
          get {
            return resultMap["breed"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "breed")
          }
        }

        /// is castration or not: true for castration
        public var isCastration: Bool {
          get {
            return resultMap["isCastration"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isCastration")
          }
        }

        public var birthday: String? {
          get {
            return resultMap["birthday"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "birthday")
          }
        }
      }
    }
  }
}

public final class SetStatusMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SetStatus($pid: ID!, $recommendID: ID!, $result: Boolean!) {
      recommendationResponse(
        recommendationResponseInput: {pid: $pid, recommendID: $recommendID, result: $result}
      ) {
        __typename
        result {
          __typename
          id
          image
          gender
        }
      }
    }
    """

  public let operationName: String = "SetStatus"

  public var pid: GraphQLID
  public var recommendID: GraphQLID
  public var result: Bool

  public init(pid: GraphQLID, recommendID: GraphQLID, result: Bool) {
    self.pid = pid
    self.recommendID = recommendID
    self.result = result
  }

  public var variables: GraphQLMap? {
    return ["pid": pid, "recommendID": recommendID, "result": result]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("recommendationResponse", arguments: ["recommendationResponseInput": ["pid": GraphQLVariable("pid"), "recommendID": GraphQLVariable("recommendID"), "result": GraphQLVariable("result")]], type: .nonNull(.object(RecommendationResponse.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(recommendationResponse: RecommendationResponse) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "recommendationResponse": recommendationResponse.resultMap])
    }

    public var recommendationResponse: RecommendationResponse {
      get {
        return RecommendationResponse(unsafeResultMap: resultMap["recommendationResponse"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "recommendationResponse")
      }
    }

    public struct RecommendationResponse: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RecommendationResponsePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("result", type: .object(Result.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: Result? = nil) {
        self.init(unsafeResultMap: ["__typename": "RecommendationResponsePayload", "result": result.flatMap { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// If the other already accepts, return petprofile otherwise return null
      public var result: Result? {
        get {
          return (resultMap["result"] as? ResultMap).flatMap { Result(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PetProfile"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("gender", type: .scalar(PetGender.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, image: String? = nil, gender: PetGender? = nil) {
          self.init(unsafeResultMap: ["__typename": "PetProfile", "id": id, "image": image, "gender": gender])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        /// only two
        public var gender: PetGender? {
          get {
            return resultMap["gender"] as? PetGender
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
          }
        }
      }
    }
  }
}

public final class RecommendEventsListGetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query recommendEventsListGet {
      recommendEventsListGet(
        eventsListGetInput: {uid: "982a33ee-2792-4ede-b307-f38d187a2015"}
      ) {
        __typename
        result {
          __typename
          id
          type
          location {
            __typename
            country
            city
            address
            latitude
            longitude
          }
          image
          timeRange {
            __typename
            startTime
            endTime
          }
          limit {
            __typename
            limitOfPet
            limitOfUser
          }
          holder {
            __typename
            id
            name
          }
        }
      }
    }
    """

  public let operationName: String = "recommendEventsListGet"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("recommendEventsListGet", arguments: ["eventsListGetInput": ["uid": "982a33ee-2792-4ede-b307-f38d187a2015"]], type: .nonNull(.object(RecommendEventsListGet.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(recommendEventsListGet: RecommendEventsListGet) {
      self.init(unsafeResultMap: ["__typename": "Query", "recommendEventsListGet": recommendEventsListGet.resultMap])
    }

    public var recommendEventsListGet: RecommendEventsListGet {
      get {
        return RecommendEventsListGet(unsafeResultMap: resultMap["recommendEventsListGet"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "recommendEventsListGet")
      }
    }

    public struct RecommendEventsListGet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["EventsListGetPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("result", type: .nonNull(.list(.nonNull(.object(Result.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: [Result]) {
        self.init(unsafeResultMap: ["__typename": "EventsListGetPayload", "result": result.map { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: [Result] {
        get {
          return (resultMap["result"] as! [ResultMap]).map { (value: ResultMap) -> Result in Result(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Result) -> ResultMap in value.resultMap }, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Event"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("type", type: .scalar(Int.self)),
            GraphQLField("location", type: .object(Location.selections)),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("timeRange", type: .object(TimeRange.selections)),
            GraphQLField("limit", type: .object(Limit.selections)),
            GraphQLField("holder", type: .object(Holder.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, type: Int? = nil, location: Location? = nil, image: String? = nil, timeRange: TimeRange? = nil, limit: Limit? = nil, holder: Holder? = nil) {
          self.init(unsafeResultMap: ["__typename": "Event", "id": id, "type": type, "location": location.flatMap { (value: Location) -> ResultMap in value.resultMap }, "image": image, "timeRange": timeRange.flatMap { (value: TimeRange) -> ResultMap in value.resultMap }, "limit": limit.flatMap { (value: Limit) -> ResultMap in value.resultMap }, "holder": holder.flatMap { (value: Holder) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var type: Int? {
          get {
            return resultMap["type"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var location: Location? {
          get {
            return (resultMap["location"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "location")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        public var timeRange: TimeRange? {
          get {
            return (resultMap["timeRange"] as? ResultMap).flatMap { TimeRange(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "timeRange")
          }
        }

        public var limit: Limit? {
          get {
            return (resultMap["limit"] as? ResultMap).flatMap { Limit(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "limit")
          }
        }

        /// holder shuold be pet
        public var holder: Holder? {
          get {
            return (resultMap["holder"] as? ResultMap).flatMap { Holder(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "holder")
          }
        }

        public struct Location: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Location"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("country", type: .scalar(String.self)),
              GraphQLField("city", type: .scalar(String.self)),
              GraphQLField("address", type: .scalar(String.self)),
              GraphQLField("latitude", type: .scalar(String.self)),
              GraphQLField("longitude", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(country: String? = nil, city: String? = nil, address: String? = nil, latitude: String? = nil, longitude: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Location", "country": country, "city": city, "address": address, "latitude": latitude, "longitude": longitude])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var country: String? {
            get {
              return resultMap["country"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "country")
            }
          }

          public var city: String? {
            get {
              return resultMap["city"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "city")
            }
          }

          public var address: String? {
            get {
              return resultMap["address"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "address")
            }
          }

          public var latitude: String? {
            get {
              return resultMap["latitude"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "latitude")
            }
          }

          public var longitude: String? {
            get {
              return resultMap["longitude"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "longitude")
            }
          }
        }

        public struct TimeRange: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["TimeRange"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("startTime", type: .scalar(String.self)),
              GraphQLField("endTime", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(startTime: String? = nil, endTime: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "TimeRange", "startTime": startTime, "endTime": endTime])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var startTime: String? {
            get {
              return resultMap["startTime"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "startTime")
            }
          }

          public var endTime: String? {
            get {
              return resultMap["endTime"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endTime")
            }
          }
        }

        public struct Limit: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["EventsLimits"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("limitOfPet", type: .scalar(Int.self)),
              GraphQLField("limitOfUser", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(limitOfPet: Int? = nil, limitOfUser: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "EventsLimits", "limitOfPet": limitOfPet, "limitOfUser": limitOfUser])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var limitOfPet: Int? {
            get {
              return resultMap["limitOfPet"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "limitOfPet")
            }
          }

          public var limitOfUser: Int? {
            get {
              return resultMap["limitOfUser"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "limitOfUser")
            }
          }
        }

        public struct Holder: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PetProfile"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("name", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, name: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PetProfile", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}

public final class Testing3Mutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Testing3($input: EventsCreateInput!) {
      eventsCreate(eventsCreateInput: $input) {
        __typename
        result {
          __typename
          id
        }
      }
    }
    """

  public let operationName: String = "Testing3"

  public var input: EventsCreateInput

  public init(input: EventsCreateInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("eventsCreate", arguments: ["eventsCreateInput": GraphQLVariable("input")], type: .nonNull(.object(EventsCreate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(eventsCreate: EventsCreate) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "eventsCreate": eventsCreate.resultMap])
    }

    public var eventsCreate: EventsCreate {
      get {
        return EventsCreate(unsafeResultMap: resultMap["eventsCreate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "eventsCreate")
      }
    }

    public struct EventsCreate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["EventsCreatePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("result", type: .object(Result.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: Result? = nil) {
        self.init(unsafeResultMap: ["__typename": "EventsCreatePayload", "result": result.flatMap { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: Result? {
        get {
          return (resultMap["result"] as? ResultMap).flatMap { Result(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Event"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Event", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class EventJoinMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation eventJoin($input: EventsJoinInput!) {
      eventsJoin(eventsJoinInput: $input) {
        __typename
        result
      }
    }
    """

  public let operationName: String = "eventJoin"

  public var input: EventsJoinInput

  public init(input: EventsJoinInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("eventsJoin", arguments: ["eventsJoinInput": GraphQLVariable("input")], type: .nonNull(.object(EventsJoin.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(eventsJoin: EventsJoin) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "eventsJoin": eventsJoin.resultMap])
    }

    public var eventsJoin: EventsJoin {
      get {
        return EventsJoin(unsafeResultMap: resultMap["eventsJoin"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "eventsJoin")
      }
    }

    public struct EventsJoin: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["EventsJoinPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("result", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "EventsJoinPayload", "result": result])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: Bool? {
        get {
          return resultMap["result"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "result")
        }
      }
    }
  }
}
