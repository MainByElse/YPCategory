//
//  NSObject+YPModel.m
//  Note
//
//  Created by Else丶 on 2019/1/29.
//  Copyright © 2019 Else丶. All rights reserved.
//

#import "NSObject+YPModel.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation NSObject (YPModel)

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [self init]) {
        
        NSMutableArray *keys = [NSMutableArray array];
        NSMutableArray *attributes = [NSMutableArray array];
        
        unsigned int outCount;
        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
        for (int i = 0; i < outCount; i ++) {
            objc_property_t property = properties[i];
            NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            [keys addObject:propertyName];
            
            NSString *attributeName = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
            [attributes addObject:attributeName];
        }
        
        free(properties);
        
        for (NSString *key in keys) {
            if ([dict valueForKey:key] == nil) {
                continue;
            }
            [self setValue:dict[key] forKey:key];
        }
        
    }
    return self;
}

@end
