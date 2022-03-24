//
//  InstanceHelperTests.swift
//  InstanceHelperTests
//
//  Created by René Pirringer on 24.03.22.
//

import XCTest
@testable import InstanceHelper

class InstanceHelperTests: XCTestCase {
	
	
	
	func createScene() throws -> UIWindowScene {
		let session = try InstanceHelper.create(UISceneSession.self)
		let scene = try InstanceHelper.create(UIWindowScene.self, properties: [
			"session": session
		])
		return scene
	}
	
	func test_window_is_created_on_willConnectTo() throws {
		// given
		let sceneDelegate = SceneDelegate()
		let scene = try createScene()
		let options = try InstanceHelper.create(UIScene.ConnectionOptions.self)
		// when
		sceneDelegate.scene(scene, willConnectTo: scene.session, options: options)
		// then
		XCTAssertNotNil(sceneDelegate.window)
	}
	
	
	
}
