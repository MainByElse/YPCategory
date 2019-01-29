//
//  ValueForKeyPath.h
//  Note
//
//  Created by Else丶 on 2018/8/3.
//  Copyright © 2018年 Else丶. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ValueBlock)(float sum,float avg,float min,float max);
typedef void(^SampleValueBlock)(id obj);

@interface ValueForKeyPath : NSObject

@property (nonatomic, strong) NSArray *arr;
@property (nonatomic, strong) NSArray *arr1;
@property (nonatomic, strong) NSArray *arr2;
@property (nonatomic, strong) NSArray *arr3;
@property (nonatomic, strong) NSDictionary *dict;
//@property (nonatomic, copy) ValueBlock valueBlock;

- (void)valueForKeyPathWithValueBlock:(ValueBlock)valueBlock;
- (void)sameValueWithSampleValueBlock:(SampleValueBlock)sampleBlock;
- (void)oneValueWithSampleValueBlock:(SampleValueBlock)sampleBlock;
- (void)deleteSameValueWithSampleValueBlock:(SampleValueBlock)sampleBlock;
- (void)deleteSameValueThenGotValuesWithSampleValueBlock:(SampleValueBlock)sampleBlock;

@end
