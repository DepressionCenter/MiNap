// swiftlint:disable all
import Amplify
import Foundation

public struct MinapDBEntry: Model {
  public let id: String
  public var sleepSessionStart: Temporal.DateTime?
  public var sleepSessionEnd: Temporal.DateTime?
  public var studyid: String?
  public var remarks: String?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      sleepSessionStart: Temporal.DateTime? = nil,
      sleepSessionEnd: Temporal.DateTime? = nil,
      studyid: String? = nil,
      remarks: String? = nil) {
    self.init(id: id,
      sleepSessionStart: sleepSessionStart,
      sleepSessionEnd: sleepSessionEnd,
      studyid: studyid,
      remarks: remarks,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      sleepSessionStart: Temporal.DateTime? = nil,
      sleepSessionEnd: Temporal.DateTime? = nil,
      studyid: String? = nil,
      remarks: String? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.sleepSessionStart = sleepSessionStart
      self.sleepSessionEnd = sleepSessionEnd
      self.studyid = studyid
      self.remarks = remarks
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}