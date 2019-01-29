//
//  ViewController.m
//  Note
//
//  Created by Else丶 on 2018/8/3.
//  Copyright © 2018年 Else丶. All rights reserved.
//

#import "ViewController.h"
#import "ValueForKeyPath.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *document = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *cache = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    NSString *preference = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Preferences"];
    NSString *tmp = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    
    NSString *document1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *cache1 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *preference1 = NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *tmp1 = NSTemporaryDirectory();
    
    NSLog(@"Documents:%@",document);
    NSLog(@"Documents1:%@",document1);
    NSLog(@"Cache:%@",cache);
    NSLog(@"Cache1:%@",cache1);
    NSLog(@"preference:%@",preference);
    NSLog(@"preference1:%@",preference1);
    NSLog(@"tmp:%@",tmp);
    NSLog(@"tmp1:%@",tmp1);
    
    ValueForKeyPath *value = [[ValueForKeyPath alloc]init];
    value.arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    [value valueForKeyPathWithValueBlock:^(float sum, float avg, float min, float max) {
        NSLog(@"sum:%.2f, avg:%.2f, min:%.2f, max:%.2f",sum,avg,min,max);
    }];
    
    value.arr1 = @[@{@"city":@"beijing",@"person":@{@"name":@"zhangsan"}},@{@"city":@"chengdu"}];
    [value sameValueWithSampleValueBlock:^(id obj) {
        NSLog(@"sameValue:%@",obj);
    }];
    
    value.dict = @{@"dict1":@{@"dict2":@{@"name":@"lishi",@"info":@{@"age":@"12"}}}};
    [value oneValueWithSampleValueBlock:^(id obj) {
        NSLog(@"OneValue:%@",obj);
    }];
    
    value.arr2 = @[@"qq", @"wechat", @"qq", @"msn", @"wechat"];
    [value deleteSameValueWithSampleValueBlock:^(id obj) {
        NSLog(@"deleteSameValue:%@",obj);
    }];
    
    value.arr3 = @[@{@"name" : @"xiaoming",
                     @"code" : @1},
                   @{@"name": @"judy",
                     @"code" : @2},
                   @{@"name": @"judy",
                     @"code" : @3},
                   @{@"name": @"xiaohua",
                     @"code" : @4}];
    //@distinctUnionOfObjects.name  先删除对应值(name)的重复数据再取值
    [value deleteSameValueThenGotValuesWithSampleValueBlock:^(id obj) {
        NSLog(@"deleteSameThenGotValues:%@",obj);
    }];
    
    UITextField *tf= [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 200, 60)];
    tf.placeholder = @"无fuck说";
    tf.borderStyle = UITextBorderStyleLine;
    
    [tf setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.view addSubview:tf];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
