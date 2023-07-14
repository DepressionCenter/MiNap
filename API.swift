//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateMinapdbInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(participantid: Int, studyid: Int? = nil) {
    graphQLMap = ["participantid": participantid, "studyid": studyid]
  }

  public var participantid: Int {
    get {
      return graphQLMap["participantid"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "participantid")
    }
  }

  public var studyid: Int? {
    get {
      return graphQLMap["studyid"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "studyid")
    }
  }
}

public struct UpdateMinapdbInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(sleepSessionStart: Int? = nil, sleepSessionEnd: Int? = nil, remarks: String? = nil) {
    graphQLMap = ["sleepSessionStart": sleepSessionStart, "sleepSessionEnd": sleepSessionEnd, "remarks": remarks]
  }

  public var sleepSessionStart: Int? {
    get {
      return graphQLMap["sleepSessionStart"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sleepSessionStart")
    }
  }

  public var sleepSessionEnd: Int? {
    get {
      return graphQLMap["sleepSessionEnd"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sleepSessionEnd")
    }
  }

  public var remarks: String? {
    get {
      return graphQLMap["remarks"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "remarks")
    }
  }
}

public struct DeleteMinapdbInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(participantid: Int) {
    graphQLMap = ["participantid": participantid]
  }

  public var participantid: Int {
    get {
      return graphQLMap["participantid"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "participantid")
    }
  }
}

public struct TableMinapdbFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(participantid: TableIntFilterInput? = nil, sleepSessionStart: TableIntFilterInput? = nil, sleepSessionEnd: TableIntFilterInput? = nil) {
    graphQLMap = ["participantid": participantid, "sleepSessionStart": sleepSessionStart, "sleepSessionEnd": sleepSessionEnd]
  }

  public var participantid: TableIntFilterInput? {
    get {
      return graphQLMap["participantid"] as! TableIntFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "participantid")
    }
  }

  public var sleepSessionStart: TableIntFilterInput? {
    get {
      return graphQLMap["sleepSessionStart"] as! TableIntFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sleepSessionStart")
    }
  }

  public var sleepSessionEnd: TableIntFilterInput? {
    get {
      return graphQLMap["sleepSessionEnd"] as! TableIntFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sleepSessionEnd")
    }
  }
}

public struct TableIntFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, contains: Int? = nil, notContains: Int? = nil, between: [Int?]? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: Int? {
    get {
      return graphQLMap["contains"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: Int? {
    get {
      return graphQLMap["notContains"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public final class CreateMinapdbMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateMinapdb($input: CreateMinapdbInput!) {\n  createMinapdb(input: $input) {\n    __typename\n    participantid\n    sleepSessionStart\n    sleepSessionEnd\n    studyid\n    remarks\n  }\n}"

  public var input: CreateMinapdbInput

  public init(input: CreateMinapdbInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createMinapdb", arguments: ["input": GraphQLVariable("input")], type: .object(CreateMinapdb.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createMinapdb: CreateMinapdb? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createMinapdb": createMinapdb.flatMap { $0.snapshot }])
    }

    public var createMinapdb: CreateMinapdb? {
      get {
        return (snapshot["createMinapdb"] as? Snapshot).flatMap { CreateMinapdb(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createMinapdb")
      }
    }

    public struct CreateMinapdb: GraphQLSelectionSet {
      public static let possibleTypes = ["Minapdb"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("participantid", type: .nonNull(.scalar(Int.self))),
        GraphQLField("sleepSessionStart", type: .scalar(Int.self)),
        GraphQLField("sleepSessionEnd", type: .scalar(Int.self)),
        GraphQLField("studyid", type: .scalar(Int.self)),
        GraphQLField("remarks", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(participantid: Int, sleepSessionStart: Int? = nil, sleepSessionEnd: Int? = nil, studyid: Int? = nil, remarks: String? = nil) {
        self.init(snapshot: ["__typename": "Minapdb", "participantid": participantid, "sleepSessionStart": sleepSessionStart, "sleepSessionEnd": sleepSessionEnd, "studyid": studyid, "remarks": remarks])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var participantid: Int {
        get {
          return snapshot["participantid"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "participantid")
        }
      }

      public var sleepSessionStart: Int? {
        get {
          return snapshot["sleepSessionStart"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sleepSessionStart")
        }
      }

      public var sleepSessionEnd: Int? {
        get {
          return snapshot["sleepSessionEnd"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sleepSessionEnd")
        }
      }

      public var studyid: Int? {
        get {
          return snapshot["studyid"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "studyid")
        }
      }

      public var remarks: String? {
        get {
          return snapshot["remarks"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "remarks")
        }
      }
    }
  }
}

public final class UpdateMinapdbMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateMinapdb($input: UpdateMinapdbInput!) {\n  updateMinapdb(input: $input) {\n    __typename\n    participantid\n    sleepSessionStart\n    sleepSessionEnd\n    studyid\n    remarks\n  }\n}"

  public var input: UpdateMinapdbInput

  public init(input: UpdateMinapdbInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateMinapdb", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateMinapdb.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateMinapdb: UpdateMinapdb? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateMinapdb": updateMinapdb.flatMap { $0.snapshot }])
    }

    public var updateMinapdb: UpdateMinapdb? {
      get {
        return (snapshot["updateMinapdb"] as? Snapshot).flatMap { UpdateMinapdb(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateMinapdb")
      }
    }

    public struct UpdateMinapdb: GraphQLSelectionSet {
      public static let possibleTypes = ["Minapdb"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("participantid", type: .nonNull(.scalar(Int.self))),
        GraphQLField("sleepSessionStart", type: .scalar(Int.self)),
        GraphQLField("sleepSessionEnd", type: .scalar(Int.self)),
        GraphQLField("studyid", type: .scalar(Int.self)),
        GraphQLField("remarks", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(participantid: Int, sleepSessionStart: Int? = nil, sleepSessionEnd: Int? = nil, studyid: Int? = nil, remarks: String? = nil) {
        self.init(snapshot: ["__typename": "Minapdb", "participantid": participantid, "sleepSessionStart": sleepSessionStart, "sleepSessionEnd": sleepSessionEnd, "studyid": studyid, "remarks": remarks])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var participantid: Int {
        get {
          return snapshot["participantid"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "participantid")
        }
      }

      public var sleepSessionStart: Int? {
        get {
          return snapshot["sleepSessionStart"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sleepSessionStart")
        }
      }

      public var sleepSessionEnd: Int? {
        get {
          return snapshot["sleepSessionEnd"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sleepSessionEnd")
        }
      }

      public var studyid: Int? {
        get {
          return snapshot["studyid"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "studyid")
        }
      }

      public var remarks: String? {
        get {
          return snapshot["remarks"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "remarks")
        }
      }
    }
  }
}

public final class DeleteMinapdbMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteMinapdb($input: DeleteMinapdbInput!) {\n  deleteMinapdb(input: $input) {\n    __typename\n    participantid\n    sleepSessionStart\n    sleepSessionEnd\n    studyid\n    remarks\n  }\n}"

  public var input: DeleteMinapdbInput

  public init(input: DeleteMinapdbInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteMinapdb", arguments: ["input": GraphQLVariable("input")], type: .object(DeleteMinapdb.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteMinapdb: DeleteMinapdb? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteMinapdb": deleteMinapdb.flatMap { $0.snapshot }])
    }

    public var deleteMinapdb: DeleteMinapdb? {
      get {
        return (snapshot["deleteMinapdb"] as? Snapshot).flatMap { DeleteMinapdb(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteMinapdb")
      }
    }

    public struct DeleteMinapdb: GraphQLSelectionSet {
      public static let possibleTypes = ["Minapdb"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("participantid", type: .nonNull(.scalar(Int.self))),
        GraphQLField("sleepSessionStart", type: .scalar(Int.self)),
        GraphQLField("sleepSessionEnd", type: .scalar(Int.self)),
        GraphQLField("studyid", type: .scalar(Int.self)),
        GraphQLField("remarks", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(participantid: Int, sleepSessionStart: Int? = nil, sleepSessionEnd: Int? = nil, studyid: Int? = nil, remarks: String? = nil) {
        self.init(snapshot: ["__typename": "Minapdb", "participantid": participantid, "sleepSessionStart": sleepSessionStart, "sleepSessionEnd": sleepSessionEnd, "studyid": studyid, "remarks": remarks])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var participantid: Int {
        get {
          return snapshot["participantid"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "participantid")
        }
      }

      public var sleepSessionStart: Int? {
        get {
          return snapshot["sleepSessionStart"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sleepSessionStart")
        }
      }

      public var sleepSessionEnd: Int? {
        get {
          return snapshot["sleepSessionEnd"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sleepSessionEnd")
        }
      }

      public var studyid: Int? {
        get {
          return snapshot["studyid"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "studyid")
        }
      }

      public var remarks: String? {
        get {
          return snapshot["remarks"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "remarks")
        }
      }
    }
  }
}

public final class GetMinapdbQuery: GraphQLQuery {
  public static let operationString =
    "query GetMinapdb($participantid: Int!) {\n  getMinapdb(participantid: $participantid) {\n    __typename\n    participantid\n    sleepSessionStart\n    sleepSessionEnd\n    studyid\n    remarks\n  }\n}"

  public var participantid: Int

  public init(participantid: Int) {
    self.participantid = participantid
  }

  public var variables: GraphQLMap? {
    return ["participantid": participantid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getMinapdb", arguments: ["participantid": GraphQLVariable("participantid")], type: .object(GetMinapdb.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getMinapdb: GetMinapdb? = nil) {
      self.init(snapshot: ["__typename": "Query", "getMinapdb": getMinapdb.flatMap { $0.snapshot }])
    }

    public var getMinapdb: GetMinapdb? {
      get {
        return (snapshot["getMinapdb"] as? Snapshot).flatMap { GetMinapdb(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getMinapdb")
      }
    }

    public struct GetMinapdb: GraphQLSelectionSet {
      public static let possibleTypes = ["Minapdb"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("participantid", type: .nonNull(.scalar(Int.self))),
        GraphQLField("sleepSessionStart", type: .scalar(Int.self)),
        GraphQLField("sleepSessionEnd", type: .scalar(Int.self)),
        GraphQLField("studyid", type: .scalar(Int.self)),
        GraphQLField("remarks", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(participantid: Int, sleepSessionStart: Int? = nil, sleepSessionEnd: Int? = nil, studyid: Int? = nil, remarks: String? = nil) {
        self.init(snapshot: ["__typename": "Minapdb", "participantid": participantid, "sleepSessionStart": sleepSessionStart, "sleepSessionEnd": sleepSessionEnd, "studyid": studyid, "remarks": remarks])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var participantid: Int {
        get {
          return snapshot["participantid"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "participantid")
        }
      }

      public var sleepSessionStart: Int? {
        get {
          return snapshot["sleepSessionStart"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sleepSessionStart")
        }
      }

      public var sleepSessionEnd: Int? {
        get {
          return snapshot["sleepSessionEnd"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sleepSessionEnd")
        }
      }

      public var studyid: Int? {
        get {
          return snapshot["studyid"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "studyid")
        }
      }

      public var remarks: String? {
        get {
          return snapshot["remarks"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "remarks")
        }
      }
    }
  }
}

public final class ListMinapdbsQuery: GraphQLQuery {
  public static let operationString =
    "query ListMinapdbs($filter: TableMinapdbFilterInput, $limit: Int, $nextToken: String) {\n  listMinapdbs(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      participantid\n      sleepSessionStart\n      sleepSessionEnd\n      studyid\n      remarks\n    }\n    nextToken\n  }\n}"

  public var filter: TableMinapdbFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: TableMinapdbFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listMinapdbs", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListMinapdb.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listMinapdbs: ListMinapdb? = nil) {
      self.init(snapshot: ["__typename": "Query", "listMinapdbs": listMinapdbs.flatMap { $0.snapshot }])
    }

    public var listMinapdbs: ListMinapdb? {
      get {
        return (snapshot["listMinapdbs"] as? Snapshot).flatMap { ListMinapdb(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listMinapdbs")
      }
    }

    public struct ListMinapdb: GraphQLSelectionSet {
      public static let possibleTypes = ["MinapdbConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "MinapdbConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Minapdb"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("participantid", type: .nonNull(.scalar(Int.self))),
          GraphQLField("sleepSessionStart", type: .scalar(Int.self)),
          GraphQLField("sleepSessionEnd", type: .scalar(Int.self)),
          GraphQLField("studyid", type: .scalar(Int.self)),
          GraphQLField("remarks", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(participantid: Int, sleepSessionStart: Int? = nil, sleepSessionEnd: Int? = nil, studyid: Int? = nil, remarks: String? = nil) {
          self.init(snapshot: ["__typename": "Minapdb", "participantid": participantid, "sleepSessionStart": sleepSessionStart, "sleepSessionEnd": sleepSessionEnd, "studyid": studyid, "remarks": remarks])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var participantid: Int {
          get {
            return snapshot["participantid"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "participantid")
          }
        }

        public var sleepSessionStart: Int? {
          get {
            return snapshot["sleepSessionStart"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "sleepSessionStart")
          }
        }

        public var sleepSessionEnd: Int? {
          get {
            return snapshot["sleepSessionEnd"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "sleepSessionEnd")
          }
        }

        public var studyid: Int? {
          get {
            return snapshot["studyid"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "studyid")
          }
        }

        public var remarks: String? {
          get {
            return snapshot["remarks"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "remarks")
          }
        }
      }
    }
  }
}

public final class OnCreateMinapdbSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateMinapdb($participantid: Int, $sleepSessionStart: Int, $sleepSessionEnd: Int) {\n  onCreateMinapdb(\n    participantid: $participantid\n    sleepSessionStart: $sleepSessionStart\n    sleepSessionEnd: $sleepSessionEnd\n  ) {\n    __typename\n    participantid\n    sleepSessionStart\n    sleepSessionEnd\n    studyid\n    remarks\n  }\n}"

  public var participantid: Int?
  public var sleepSessionStart: Int?
  public var sleepSessionEnd: Int?

  public init(participantid: Int? = nil, sleepSessionStart: Int? = nil, sleepSessionEnd: Int? = nil) {
    self.participantid = participantid
    self.sleepSessionStart = sleepSessionStart
    self.sleepSessionEnd = sleepSessionEnd
  }

  public var variables: GraphQLMap? {
    return ["participantid": participantid, "sleepSessionStart": sleepSessionStart, "sleepSessionEnd": sleepSessionEnd]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateMinapdb", arguments: ["participantid": GraphQLVariable("participantid"), "sleepSessionStart": GraphQLVariable("sleepSessionStart"), "sleepSessionEnd": GraphQLVariable("sleepSessionEnd")], type: .object(OnCreateMinapdb.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateMinapdb: OnCreateMinapdb? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateMinapdb": onCreateMinapdb.flatMap { $0.snapshot }])
    }

    public var onCreateMinapdb: OnCreateMinapdb? {
      get {
        return (snapshot["onCreateMinapdb"] as? Snapshot).flatMap { OnCreateMinapdb(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateMinapdb")
      }
    }

    public struct OnCreateMinapdb: GraphQLSelectionSet {
      public static let possibleTypes = ["Minapdb"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("participantid", type: .nonNull(.scalar(Int.self))),
        GraphQLField("sleepSessionStart", type: .scalar(Int.self)),
        GraphQLField("sleepSessionEnd", type: .scalar(Int.self)),
        GraphQLField("studyid", type: .scalar(Int.self)),
        GraphQLField("remarks", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(participantid: Int, sleepSessionStart: Int? = nil, sleepSessionEnd: Int? = nil, studyid: Int? = nil, remarks: String? = nil) {
        self.init(snapshot: ["__typename": "Minapdb", "participantid": participantid, "sleepSessionStart": sleepSessionStart, "sleepSessionEnd": sleepSessionEnd, "studyid": studyid, "remarks": remarks])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var participantid: Int {
        get {
          return snapshot["participantid"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "participantid")
        }
      }

      public var sleepSessionStart: Int? {
        get {
          return snapshot["sleepSessionStart"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sleepSessionStart")
        }
      }

      public var sleepSessionEnd: Int? {
        get {
          return snapshot["sleepSessionEnd"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sleepSessionEnd")
        }
      }

      public var studyid: Int? {
        get {
          return snapshot["studyid"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "studyid")
        }
      }

      public var remarks: String? {
        get {
          return snapshot["remarks"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "remarks")
        }
      }
    }
  }
}

public final class OnUpdateMinapdbSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateMinapdb($participantid: Int, $sleepSessionStart: Int, $sleepSessionEnd: Int) {\n  onUpdateMinapdb(\n    participantid: $participantid\n    sleepSessionStart: $sleepSessionStart\n    sleepSessionEnd: $sleepSessionEnd\n  ) {\n    __typename\n    participantid\n    sleepSessionStart\n    sleepSessionEnd\n    studyid\n    remarks\n  }\n}"

  public var participantid: Int?
  public var sleepSessionStart: Int?
  public var sleepSessionEnd: Int?

  public init(participantid: Int? = nil, sleepSessionStart: Int? = nil, sleepSessionEnd: Int? = nil) {
    self.participantid = participantid
    self.sleepSessionStart = sleepSessionStart
    self.sleepSessionEnd = sleepSessionEnd
  }

  public var variables: GraphQLMap? {
    return ["participantid": participantid, "sleepSessionStart": sleepSessionStart, "sleepSessionEnd": sleepSessionEnd]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateMinapdb", arguments: ["participantid": GraphQLVariable("participantid"), "sleepSessionStart": GraphQLVariable("sleepSessionStart"), "sleepSessionEnd": GraphQLVariable("sleepSessionEnd")], type: .object(OnUpdateMinapdb.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateMinapdb: OnUpdateMinapdb? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateMinapdb": onUpdateMinapdb.flatMap { $0.snapshot }])
    }

    public var onUpdateMinapdb: OnUpdateMinapdb? {
      get {
        return (snapshot["onUpdateMinapdb"] as? Snapshot).flatMap { OnUpdateMinapdb(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateMinapdb")
      }
    }

    public struct OnUpdateMinapdb: GraphQLSelectionSet {
      public static let possibleTypes = ["Minapdb"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("participantid", type: .nonNull(.scalar(Int.self))),
        GraphQLField("sleepSessionStart", type: .scalar(Int.self)),
        GraphQLField("sleepSessionEnd", type: .scalar(Int.self)),
        GraphQLField("studyid", type: .scalar(Int.self)),
        GraphQLField("remarks", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(participantid: Int, sleepSessionStart: Int? = nil, sleepSessionEnd: Int? = nil, studyid: Int? = nil, remarks: String? = nil) {
        self.init(snapshot: ["__typename": "Minapdb", "participantid": participantid, "sleepSessionStart": sleepSessionStart, "sleepSessionEnd": sleepSessionEnd, "studyid": studyid, "remarks": remarks])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var participantid: Int {
        get {
          return snapshot["participantid"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "participantid")
        }
      }

      public var sleepSessionStart: Int? {
        get {
          return snapshot["sleepSessionStart"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sleepSessionStart")
        }
      }

      public var sleepSessionEnd: Int? {
        get {
          return snapshot["sleepSessionEnd"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sleepSessionEnd")
        }
      }

      public var studyid: Int? {
        get {
          return snapshot["studyid"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "studyid")
        }
      }

      public var remarks: String? {
        get {
          return snapshot["remarks"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "remarks")
        }
      }
    }
  }
}

public final class OnDeleteMinapdbSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteMinapdb($participantid: Int, $sleepSessionStart: Int, $sleepSessionEnd: Int) {\n  onDeleteMinapdb(\n    participantid: $participantid\n    sleepSessionStart: $sleepSessionStart\n    sleepSessionEnd: $sleepSessionEnd\n  ) {\n    __typename\n    participantid\n    sleepSessionStart\n    sleepSessionEnd\n    studyid\n    remarks\n  }\n}"

  public var participantid: Int?
  public var sleepSessionStart: Int?
  public var sleepSessionEnd: Int?

  public init(participantid: Int? = nil, sleepSessionStart: Int? = nil, sleepSessionEnd: Int? = nil) {
    self.participantid = participantid
    self.sleepSessionStart = sleepSessionStart
    self.sleepSessionEnd = sleepSessionEnd
  }

  public var variables: GraphQLMap? {
    return ["participantid": participantid, "sleepSessionStart": sleepSessionStart, "sleepSessionEnd": sleepSessionEnd]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteMinapdb", arguments: ["participantid": GraphQLVariable("participantid"), "sleepSessionStart": GraphQLVariable("sleepSessionStart"), "sleepSessionEnd": GraphQLVariable("sleepSessionEnd")], type: .object(OnDeleteMinapdb.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteMinapdb: OnDeleteMinapdb? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteMinapdb": onDeleteMinapdb.flatMap { $0.snapshot }])
    }

    public var onDeleteMinapdb: OnDeleteMinapdb? {
      get {
        return (snapshot["onDeleteMinapdb"] as? Snapshot).flatMap { OnDeleteMinapdb(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteMinapdb")
      }
    }

    public struct OnDeleteMinapdb: GraphQLSelectionSet {
      public static let possibleTypes = ["Minapdb"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("participantid", type: .nonNull(.scalar(Int.self))),
        GraphQLField("sleepSessionStart", type: .scalar(Int.self)),
        GraphQLField("sleepSessionEnd", type: .scalar(Int.self)),
        GraphQLField("studyid", type: .scalar(Int.self)),
        GraphQLField("remarks", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(participantid: Int, sleepSessionStart: Int? = nil, sleepSessionEnd: Int? = nil, studyid: Int? = nil, remarks: String? = nil) {
        self.init(snapshot: ["__typename": "Minapdb", "participantid": participantid, "sleepSessionStart": sleepSessionStart, "sleepSessionEnd": sleepSessionEnd, "studyid": studyid, "remarks": remarks])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var participantid: Int {
        get {
          return snapshot["participantid"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "participantid")
        }
      }

      public var sleepSessionStart: Int? {
        get {
          return snapshot["sleepSessionStart"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sleepSessionStart")
        }
      }

      public var sleepSessionEnd: Int? {
        get {
          return snapshot["sleepSessionEnd"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sleepSessionEnd")
        }
      }

      public var studyid: Int? {
        get {
          return snapshot["studyid"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "studyid")
        }
      }

      public var remarks: String? {
        get {
          return snapshot["remarks"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "remarks")
        }
      }
    }
  }
}