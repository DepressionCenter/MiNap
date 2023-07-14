// swiftlint:disable all
import Amplify
import Foundation

extension Minapdb {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case participantid
    case sleepSessionStart
    case sleepSessionEnd
    case studyid
    case remarks
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let minapdb = Minapdb.keys
    
    model.pluralName = "Minapdbs"
    
    model.attributes(
      .primaryKey(fields: [minapdb.id])
    )
    
    model.fields(
      .field(minapdb.id, is: .required, ofType: .string),
      .field(minapdb.participantid, is: .required, ofType: .int),
      .field(minapdb.sleepSessionStart, is: .optional, ofType: .int),
      .field(minapdb.sleepSessionEnd, is: .optional, ofType: .int),
      .field(minapdb.studyid, is: .optional, ofType: .int),
      .field(minapdb.remarks, is: .optional, ofType: .string),
      .field(minapdb.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(minapdb.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension Minapdb: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}