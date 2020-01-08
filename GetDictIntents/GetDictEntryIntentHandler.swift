import UIKit
import Intents

class GetDictEntryIntentHandler: NSObject, GetDictEntryIntentHandling {
    let dict = [
        "1": "value1",
        "2": "value1",
        "3": "value1",
        "4": "value1",
    ]
    
    func resolveKey(for intent: GetDictEntryIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        completion(INStringResolutionResult.success(with: intent.key!))
    }
    
    func confirm(intent: GetDictEntryIntent, completion: @escaping (GetDictEntryIntentResponse) -> Void) {
        completion(GetDictEntryIntentResponse(code: GetDictEntryIntentResponseCode.ready, userActivity: nil))
    }
    
    func handle(intent: GetDictEntryIntent, completion: @escaping (GetDictEntryIntentResponse) -> Void) {
        guard let key = intent.key, let value = dict[key] else {
            completion(.failure(key: intent.key ?? "nil"))
            return
        }
        completion(.success(key: key, value: value))
    }
}
