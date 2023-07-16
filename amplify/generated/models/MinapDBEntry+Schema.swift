// swiftlint:disable all
import Amplify
import Foundation

extension MinapDBEntry {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case sleepSessionStart
    case sleepSessionEnd
    case studyid
    case remarks
    case participantid
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let minapDBEntry = MinapDBEntry.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.pluralName = "MinapDBEntries"
    
    model.attributes(
      .primaryKey(fields: [minapDBEntry.id])
    )
    
    model.fields(
      .field(minapDBEntry.id, is: .required, ofType: .string),
      .field(minapDBEntry.sleepSessionStart, is: .optional, ofType: .dateTime),
      .field(minapDBEntry.sleepSessionEnd, is: .optional, ofType: .dateTime),
      .field(minapDBEntry.studyid, is: .optional, ofType: .string),
      .field(minapDBEntry.remarks, is: .optional, ofType: .string),
      .field(minapDBEntry.participantid, is: .optional, ofType: .string),
      .field(minapDBEntry.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(minapDBEntry.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension MinapDBEntry: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}