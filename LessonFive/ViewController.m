//
//  ViewController.m
//  LessonThree
//
//  Created by oscar on 04/04/15.
//  Copyright (c) 2015 oscar. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

//объявляем глобальную переменную Словарь

@property(nonatomic,strong) NSArray *mArray1;
@property(nonatomic,strong) NSArray *mArray2;
@property(nonatomic,strong) NSMutableArray * mArrayDict;

- (IBAction)backAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.mArrayDict = [NSMutableArray array];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//=======================================================================

- (void) makeFirstArray{
    self.isFirstArray = YES;
    [self.mArrayDict removeAllObjects];    
   
    
    NSString *stringValue =@"Flat,TV,Mobile Phone,Car";
    NSString *stringPrice =@"999,700,500,300";//выделяем память
    
    
    NSString * stringDisFlat = @"Один из видов жилого помещения, состоящий из одной или нескольких смежных комнат с отдельным наружным выходом, составляющее отдельную часть дома.";
    NSString * stringDisTv = @"Электронное устройство для приёма и отображения изображения и звука, передаваемых по беспроводным каналам или по кабелю (в том числе телевизионных программ или сигналов от устройств воспроизведения видеосигнала.";
    NSString * stringDisMobile= @"Мобильный телефон, предназначенный для работы в сетях сотовой связи; использует приёмопередатчик радиодиапазона и традиционную телефонную коммутацию для осуществления телефонной связи на территории зоны покрытия сотовой сети.";
    NSString * stringCarDis = @"Автотранспортное средство, в совокупности автотехника, автотранспорт — моторное безрельсовое дорожное транспортное средство минимум с 3 колёсами.";
    
    //заполняем изменяемые массивы
    self.mArray1=[stringValue componentsSeparatedByString:@","];
    self.mArray2=[stringPrice componentsSeparatedByString:@","];
    //заполняем словарь
    for (int i=0; i<self.mArray1.count;i++){
        NSMutableDictionary *dict = [[NSMutableDictionary   alloc]init];
        [dict setObject:[self.mArray1 objectAtIndex:i] forKey:@"value"];
        [dict setObject:[self.mArray2 objectAtIndex:i] forKey:@"price"];
        
        NSString * value = [self.mArray1 objectAtIndex:i ];
        //для каждого вида товара устанавливаем свое описания
        if ([value isEqualToString:@"Flat"]) {
            [dict setObject:stringDisFlat forKey:@"discr"];
        }
        else if ([value isEqualToString:@"TV"]){
            [dict setObject:stringDisTv forKey:@"discr"];
        }
        else if ([value isEqualToString:@"Mobile Phone"]){
            [dict setObject:stringDisMobile forKey:@"discr"];
            
        }
        else if ([value isEqualToString:@"Car"]){
            [dict setObject:stringCarDis forKey:@"discr"];
        }
        
        [self.mArrayDict addObject:dict];
        
    }
    
    //NSLog(@"%@",[NSString stringWithFormat:@"%@",self.mArray1]);
    //выводим массив со словарем
    NSLog(@"%@",[NSString stringWithFormat:@"%@",self.mArrayDict]);
}
- (void) makeAnotherArray{
    self.isFirstArray = NO;
    [self.mArrayDict removeAllObjects];//освобождаем
    

    NSString * stringValue=@"Собака,Кошка,Крыса,Хомяк";
    NSString * stringPrice=@"100,150,50,200,321";
   
    
    self.mArray1=[stringValue componentsSeparatedByString:@","];
    self.mArray2=[stringPrice componentsSeparatedByString:@","];
    for (int i=0; i<self.mArray1.count;i++){
        NSMutableDictionary *dict = [[NSMutableDictionary   alloc]init];
        [dict setObject:[self.mArray1 objectAtIndex:i] forKey:@"value"];
        [dict setObject:[self.mArray2 objectAtIndex:i] forKey:@"price"];
        [self.mArrayDict addObject:dict];
    }
    
}


#pragma mark - UITableViewDelegate

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
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
@end
