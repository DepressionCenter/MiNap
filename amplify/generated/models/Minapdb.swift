// swiftlint:disable all
import Amplify
import Foundation

public struct Minapdb: Model {
  public let id: String
  public var participantid: Int
  public var sleepSessionStart: Int?
  public var sleepSessionEnd: Int?
  public var studyid: Int?
  public var remarks: String?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      participantid: Int,
      sleepSessionStart: Int? = nil,
      sleepSessionEnd: Int? = nil,
      studyid: Int? = nil,
      remarks: String? = nil) {
    self.init(id: id,
      participantid: participantid,
      sleepSessionStart: sleepSessionStart,
      sleepSessionEnd: sleepSessionEnd,
      studyid: studyid,
      remarks: remarks,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      participantid: Int,
      sleepSessionStart: Int? = nil,
      sleepSessionEnd: Int? = nil,
      studyid: Int? = nil,
      remarks: String? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.participantid = participantid
      self.sleepSessionStart = sleepSessionStart
      self.sleepSessionEnd = sleepSessionEnd
      self.studyid = studyid
      self.remarks = remarks
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}