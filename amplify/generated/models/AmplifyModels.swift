// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "16408f6e7c59cb9ffffbff0295130dd9"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: MinapDBEntry.self)
  }
}