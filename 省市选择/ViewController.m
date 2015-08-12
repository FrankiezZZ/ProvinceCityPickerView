//
//  ViewController.m
//  省市选择
//
//  Created by 张勇 on 15/8/10.
//  Copyright © 2015年 zmonline. All rights reserved.
//

#import "ViewController.h"
#import "Province.h"
#import "City.h"

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) NSArray *modelArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
}

#pragma mark - dataSource
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.modelArray.count;
    } else if (component == 1) {
        // 获取省的序号
        NSInteger index = [self.pickerView selectedRowInComponent:0];
        return [[self.modelArray[index] cityArray] count];
    } else if (component == 2) {
        NSInteger indexFirst = [self.pickerView selectedRowInComponent:0];
        NSInteger indexSecond = [self.pickerView selectedRowInComponent:1];
        City *city = [[self.modelArray[indexFirst] cityArray] objectAtIndex:indexSecond];
        return [[city areaArray] count];
    }
    return 0;
}

- (nullable NSString *)pickerView:(nonnull UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [self.modelArray[row] provinceName];
    } else if (component == 1) {
        // 获取省的序号
        NSInteger index = [self.pickerView selectedRowInComponent:0];
        return [[[self.modelArray[index] cityArray] objectAtIndex:row] cityName];
    } else if (component == 2) {
        NSInteger indexFirst = [self.pickerView selectedRowInComponent:0];
        NSInteger indexSecond = [self.pickerView selectedRowInComponent:1];
        City *city = [[self.modelArray[indexFirst] cityArray] objectAtIndex:indexSecond];
        return [[city areaArray] objectAtIndex:row];
    }
    return nil;
}

- (void)pickerView:(nonnull UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        [self.pickerView reloadComponent:1];
        [self.pickerView reloadComponent:2];
    } else if (component == 1) {
        [self.pickerView reloadComponent:2];
    }
}

- (NSArray *)modelArray {
    if (_modelArray == nil) {
        _modelArray = [NSArray array];
        NSMutableArray *arrayM = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"area" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in array) {
            Province *provine = [Province provinceWithDict:dict];
            [arrayM addObject:provine];
        }
        _modelArray = arrayM.copy;
    }
    return _modelArray;
}

@end
