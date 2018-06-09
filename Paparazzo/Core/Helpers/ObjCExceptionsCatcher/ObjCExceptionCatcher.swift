import Foundation

final class ObjCExceptionCatcher {
    static func tryClosure(
        tryClosure: () throws -> (),
        catchClosure: @escaping (Error) -> ())
    {
        do {
            try tryClosure()
        }
        catch {
            catchClosure(error)
        }
    }
}
