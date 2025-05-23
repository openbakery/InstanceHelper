//
// Created by René Pirringer on 09.07.21.
//

import Foundation

public extension InstanceCreator {

	static func create<T:AnyObject>(_ clazz: T.Type, properties: [String: Any] = [:]) throws -> T {
		if let instance = InstanceCreator.createInstance(clazz, properties: properties) as? T {
			return instance
		}
		throw NSError(domain: "InstanceHelper", code: 1, userInfo: [NSLocalizedDescriptionKey:"Cannot create instance of \(clazz)"])
	}

}
