// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

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

public final class Testing2Query: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Testing2($pid: [ID!]) {
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

  public let operationName: String = "Testing2"

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
