//
//  ViewController.h
//  test
//
//  Created by Chris on 25/10/2016.
//  Copyright © 2016 IndieSquare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IndieCore/IndieCore.h>
@interface ViewController : UIViewController<IndieCoreDelegate>
@property(nonatomic,strong)IndieCore * iCore;
+ (NSOperationQueue *)connectionQueue;
@end

