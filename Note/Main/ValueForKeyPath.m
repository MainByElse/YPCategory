//
//  ValueForKeyPath.m
//  Note
//
//  Created by Else丶 on 2018/8/3.
//  Copyright © 2018年 Else丶. All rights reserved.
//

#import "ValueForKeyPath.h"

@implementation ValueForKeyPath

- (void)valueForKeyPathWithValueBlock:(ValueBlock)valueBlock{
    
    float sum = [[self.arr valueForKeyPath:@"@sum.floatValue"] floatValue];
    float avg = [[self.arr valueForKeyPath:@"@avg.floatValue"] floatValue];
    float min = [[self.arr valueForKeyPath:@"@min.floatValue"] floatValue];
    float max = [[self.arr valueForKeyPath:@"@max.floatValue"] floatValue];
    valueBlock(sum, avg, min, max);
    
}

- (void)sameValueWithSampleValueBlock:(SampleValueBlock)sampleBlock{
    
    NSString *str = [self.arr1 valueForKeyPath:@"city"];
    sampleBlock(str);
    
}

- (void)oneValueWithSampleValueBlock:(SampleValueBlock)sampleBlock{
    
    NSString *str = [self.dict valueForKeyPath:@"dict1.dict2.info.age"];
    sampleBlock(str);
    
}

- (void)deleteSameValueWithSampleValueBlock:(SampleValueBlock)sampleBlock{
    NSArray *arr = [self.arr2 valueForKeyPath:@"@distinctUnionOfObjects.self"];
    sampleBlock(arr);
}

- (void)deleteSameValueThenGotValuesWithSampleValueBlock:(SampleValueBlock)sampleBlock{
    NSString *str = [self.arr3 valueForKeyPath:@"@distinctUnionOfObjects.name"];
    sampleBlock(str);
}

@end
