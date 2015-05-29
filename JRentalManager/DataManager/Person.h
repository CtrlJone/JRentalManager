//
//  Person.h
//  
//
//  Created by Jone on 15/5/29.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Room;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSNumber * sex;
@property (nonatomic, retain) NSNumber * cardID;
@property (nonatomic, retain) NSNumber * roomNumber;
@property (nonatomic, retain) Room *room;

@end
