//
//  ALPHAObjectContent.m
//  Alpha
//
//  Created by Dal Rupnik on 12/06/15.
//  Copyright (c) 2015 Unified Sense. All rights reserved.
//

#import "ALPHAObjectContent.h"

@implementation ALPHAObjectContent

+ (instancetype)objectContentForArray:(NSArray *)array
{
    NSMutableArray *items = [NSMutableArray array];
    
    ALPHAObjectContent* content = [[self alloc] init];
    
    NSUInteger counter = 0;
    
    for (id object in array)
    {
        ALPHAObjectElement *item = [[ALPHAObjectElement alloc] init];
        item.name = [NSString stringWithFormat:@"%lu", counter];
        item.objectClass = NSStringFromClass([object class]);
        item.objectPointer = [NSString stringWithFormat:@"%p", object];
        
        [items addObject:item];
        
        counter++;
    }
    
    content.items = items.copy;
    
    return content;
}

+ (instancetype)objectContentForDictionary:(NSDictionary *)dictionary
{
    NSMutableArray *items = [NSMutableArray array];
    
    ALPHAObjectContent* content = [[self alloc] init];
    
    NSUInteger counter = 0;
    
    for (id key in dictionary)
    {
        id value = dictionary[key];
        
        ALPHAObjectElement *item = [[ALPHAObjectElement alloc] init];
        item.name = [key description];
        item.objectClass = NSStringFromClass([value class]);
        item.objectPointer = [NSString stringWithFormat:@"%p", value];
        
        [items addObject:item];
        
        counter++;
    }
    
    content.items = items.copy;
    
    return content;
}

+ (instancetype)objectContentForSet:(NSSet *)set
{
    return [self objectContentForArray:[set allObjects]];
}

+ (instancetype)objectContentForOrderedSet:(NSOrderedSet *)orderedSet
{
    return [self objectContentForArray:[orderedSet array]];
}

+ (instancetype)objectContentForUserDefaults:(NSUserDefaults *)defaults
{
    return [self objectContentForDictionary:defaults.dictionaryRepresentation];
}

@end