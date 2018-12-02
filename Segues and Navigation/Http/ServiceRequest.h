//
//  ServiceRequest.h
//  NSURLSessionExample
//
//  Created by Juan Gerardo Cruz on 9/17/18.
//  Copyright © 2018 KH1386. All rights reserved.
//

#import <Foundation/Foundation.h>

// I am going to call these methods on you...
@protocol ServiceRequestDelegate <NSObject>
-(void)responseJson:(NSString *)request;
@end

@interface ServiceRequest : NSObject <NSURLSessionDataDelegate>

@property (nonatomic, weak) id <ServiceRequestDelegate> delegate;

-(void) httpPostRequest:(NSString *)urlService request:(NSString *)request;

@end
