//
//  makeArrays.m
//  LessonFive
//
//  Created by oscar on 13/04/15.
//  Copyright (c) 2015 oscar. All rights reserved.
//

#import "makeArrays.h"

@implementation makeArrays
+ (NSMutableArray*) makeFirstArray{

    NSMutableArray *mArrayDict = [NSMutableArray new];
    
    NSString *stringValue =@"Flat,TV,Mobile Phone,Car";
    NSString *stringPrice =@"999,700,500,300";//выделяем память
    
    
    NSString * stringDisFlat = @"Один из видов жилого помещения, состоящий из одной или нескольких смежных комнат с отдельным наружным выходом, составляющее отдельную часть дома.";
    NSString * stringDisTv = @"Электронное устройство для приёма и отображения изображения и звука, передаваемых по беспроводным каналам или по кабелю (в том числе телевизионных программ или сигналов от устройств воспроизведения видеосигнала.";
    NSString * stringDisMobile= @"Мобильный телефон, предназначенный для работы в сетях сотовой связи; использует приёмопередатчик радиодиапазона и традиционную телефонную коммутацию для осуществления телефонной связи на территории зоны покрытия сотовой сети.";
    NSString * stringCarDis = @"Автотранспортное средство, в совокупности автотехника, автотранспорт — моторное безрельсовое дорожное транспортное средство минимум с 3 колёсами.";
    
    //заполняем изменяемые массивы
    NSArray * mArray1=[stringValue componentsSeparatedByString:@","];
    NSArray * mArray2=[stringPrice componentsSeparatedByString:@","];
    //заполняем словарь
    for (int i=0; i<mArray1.count;i++){
        NSMutableDictionary *dict = [[NSMutableDictionary   alloc]init];
        [dict setObject:[mArray1 objectAtIndex:i] forKey:@"value"];
        [dict setObject:[mArray2 objectAtIndex:i] forKey:@"price"];
        
        NSString * value = [mArray1 objectAtIndex:i ];
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
        
        [mArrayDict addObject:dict];
        
    }
    NSLog(@"%@",[NSString stringWithFormat:@"%@",mArrayDict]);
    return mArrayDict;
    
}
+ (NSMutableArray*)makeAnotherArray{
    NSMutableArray *mArrayDict = [NSMutableArray new];
    
    
    NSString * stringValue=@"Собака,Кошка,Крыса,Хомяк";
    NSString * stringPrice=@"100,150,50,200,321";
    
    
    NSArray *mArray1=[stringValue componentsSeparatedByString:@","];
    NSArray *mArray2=[stringPrice componentsSeparatedByString:@","];
    for (int i=0; i<mArray1.count;i++){
        NSMutableDictionary *dict = [[NSMutableDictionary   alloc]init];
        [dict setObject:[mArray1 objectAtIndex:i] forKey:@"value"];
        [dict setObject:[mArray2 objectAtIndex:i] forKey:@"price"];
        [mArrayDict addObject:dict];
    }
    NSLog(@"%@",[NSString stringWithFormat:@"%@",mArrayDict]);
    return mArrayDict;
}


@end
