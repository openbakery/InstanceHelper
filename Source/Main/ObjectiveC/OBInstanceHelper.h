//
// Created by René Pirringer on 09.07.21.
//

#import <Foundation/Foundation.h>

/// User this helper class to create instance of classes where the init method is unavailable
/// e.g. I use it for example to test the UIWindowSceneDelegate callback methods like 'func sceneDidBecomeActive(_ scene: UIScene)'
/// And I create the UISceneSession object for the UIScene
NS_SWIFT_NAME(InstanceCreator)
@interface OBInstanceHelper : NSObject

+(id)createInstance:(Class)clazz;

+(id)createInstance:(Class)clazz properties:(NSDictionary *)properties;


@end
