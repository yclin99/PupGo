// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

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

public final class Testing1Query: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Testing1 {
      recommendationGet(
        recommendationGetInput: {pid: "0eb440de-cf57-404b-ada3-bebc21ee19c4"}
      ) {
        __typename
        result {
          __typename
          pet {
            __typename
            name
            image
            gender
            breed
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
        GraphQLField("recommendationGet", arguments: ["recommendationGetInput": ["pid": "0eb440de-cf57-404b-ada3-bebc21ee19c4"]], type: .nonNull(.object(RecommendationGet.selections))),
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
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("image", type: .scalar(String.self)),
              GraphQLField("gender", type: .scalar(PetGender.self)),
              GraphQLField("breed", type: .scalar(String.self)),
              GraphQLField("birthday", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, image: String? = nil, gender: PetGender? = nil, breed: String? = nil, birthday: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PetProfile", "name": name, "image": image, "gender": gender, "breed": breed, "birthday": birthday])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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
