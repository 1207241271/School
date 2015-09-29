//
//  Information.h
//  
//
//  Created by yangxu on 15/9/29.
//
//

#import <Foundation/Foundation.h>

@interface Information : NSObject
@property(nonatomic, copy)NSString* userName;
@property(nonatomic, copy)NSString* studentNum;
@property(nonatomic, copy)NSString* passWd;
@property(nonatomic, copy)NSString* location;
@property(nonatomic, assign)NSInteger houseNum;
@property(nonatomic, assign)NSInteger roomNum;
-(id)initWithData;
@end
