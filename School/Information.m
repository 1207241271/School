//
//  Information.m
//  
//
//  Created by yangxu on 15/9/29.
//
//

#import "Information.h"

@implementation Information
@synthesize userName;
@synthesize studentNum;
@synthesize passWd;
@synthesize location;
@synthesize houseNum;
@synthesize roomNum;


-(id)initWithData{
    if ([self fileIsExist]) {
        self=[NSKeyedUnarchiver unarchiveObjectWithFile:[self getFilePath]];
        return self;
    }
    return [super init];
}

-(BOOL)fileIsExist{
    NSFileManager* fm=[NSFileManager defaultManager];
    return [fm fileExistsAtPath:[self getFilePath]];
        
}
-(void)encodeWithCoder:(NSCoder*)coder{
    [coder encodeObject:userName forKey:@"userName"];
    [coder encodeObject:studentNum forKey:@"studentNum"];
    [coder encodeObject:passWd forKey:@"passWd"];
    [coder encodeObject:location forKey:@"location"];
    [coder encodeInteger:houseNum forKey:@"houseNum"];
    [coder encodeInteger:roomNum forKey:@"roomNum"];
}

-(id)initWithCoder:(NSCoder*)coder{
    userName=[coder decodeObjectForKey:@"userName"];
    studentNum=[coder decodeObjectForKey:@"studentNum"];
    passWd=[coder decodeObjectForKey:@"passWd"];
    location=[coder decodeObjectForKey:@"location"];
    houseNum=[coder decodeIntegerForKey:@"houseNum"];
    roomNum=[coder decodeIntegerForKey:@"roomNum"];
    return self;
}


-(void)dealloc{
    if ([self fileIsExist]) {
                [NSKeyedArchiver archiveRootObject:self toFile:[self getFilePath]];
    }
    else{
        NSFileManager* fm=[NSFileManager defaultManager];
        NSString *filePath =[self getFilePath];
        if (![fm fileExistsAtPath:filePath]) {
            [fm createFileAtPath:filePath contents:nil attributes:nil];
        }
        [NSKeyedArchiver archiveRootObject:self toFile:filePath];
    }
        
}
-(NSString*)getFilePath{
    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,      NSUserDomainMask, YES);
    NSString *documentDirectory = [directoryPaths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"Information.achives"];
}
@end
