//
//  DetailViewController.h
//  LessonFour
//
//  Created by oscar on 11/04/15.
//  Copyright (c) 2015 oscar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) NSString *string_MainValue;
@property (strong, nonatomic) NSString *string_Price;
@property (strong, nonatomic) NSString *string_Discr;

@property (strong, nonatomic) IBOutlet UILabel *label_MainValue;
@property (strong, nonatomic) IBOutlet UILabel *label_Price;
@property (strong, nonatomic) IBOutlet UITextView *textView_Discr;

@property (weak, nonatomic) IBOutlet UIImageView *imageView_DetilItem;

@end
