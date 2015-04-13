//
//  ViewController.m
//  LessonThree
//
//  Created by oscar on 04/04/15.
//  Copyright (c) 2015 oscar. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "makeArrays.h"

@interface ViewController ()

//объявляем глобальную переменную Словарь

@property(nonatomic,strong) NSArray *mArray1;
@property(nonatomic,strong) NSArray *mArray2;
@property(nonatomic,strong) NSMutableArray * mArrayDict;

- (IBAction)backAction:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)first_ArrayAction:(id)sender;

- (IBAction)another_ArrayAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.mArrayDict = [NSMutableArray array];
    
    if (self.isFirstArray)
        [self makeFirstArray];
    else
        [self makeAnotherArray];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) makeFirstArray{
    self.isFirstArray = YES;
    [self.mArrayDict removeAllObjects];
    self.mArrayDict = [makeArrays makeFirstArray];
    
}
-(void) makeAnotherArray{
    self.isFirstArray = NO;
    [self.mArrayDict removeAllObjects];
    self.mArrayDict = [makeArrays makeAnotherArray];
    
}

//=======================================================================


#pragma mark - UITableViewDelegate
-(void) reloadTableView{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationMiddle];
    });
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.mArray1.count;
    
    
}

-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[self.mArrayDict objectAtIndex: indexPath.row]objectForKey:@"value"];
    cell.detailTextLabel.text = [[self.mArrayDict objectAtIndex:indexPath.row]objectForKey:@"price"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //метод для того что бы выделение строки в таблице пропадало
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //присваиваем объекту окошко из сториборда
    DetailViewController *detail =  [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    //добавляем в словарь значение из массива с индексом строки
    NSDictionary * dict = [self.mArrayDict objectAtIndex: indexPath.row];
    //выводим словарь на лейбл с определенным ключом
    detail.string_MainValue = [dict objectForKey:@"value"];
    detail.string_Price = [dict objectForKey:@"price"];
    detail.string_Discr = [dict objectForKey:@"discr"];
    [self.navigationController pushViewController: detail animated:(true)];//открываем окошко
    NSLog(@"index=%li", indexPath.row);//выводим индекс строки в таблице
    
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)first_ArrayAction:(id)sender {
    [self makeFirstArray];
    [self reloadTableView];
 
}

- (IBAction)another_ArrayAction:(id)sender {
    [self makeAnotherArray];
    [self reloadTableView];
    
}
@end
