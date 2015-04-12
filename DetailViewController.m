//
//  DetailViewController.m
//  LessonFour
//
//  Created by oscar on 11/04/15.
//  Copyright (c) 2015 oscar. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.label_MainValue.text = self.string_MainValue;
    self.label_Price.text=[NSString stringWithFormat:@"Price - %@",self.string_Price ];
    self.textView_Discr.text= self.string_Discr;
    //заполняем контейнер с картинками
    if ([self.string_MainValue isEqualToString:@"TV"]) {
        self.imageView_DetilItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.string_MainValue]];
    }
    else{
        self.imageView_DetilItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",self.string_MainValue]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
