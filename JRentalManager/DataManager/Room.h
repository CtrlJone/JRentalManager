//
//  Room.h
//  
//
//  Created by Jone on 15/5/29.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Room : NSManagedObject

@property (nonatomic, retain) NSDate * checkInDate;
@property (nonatomic, retain) NSDate * checkOutDate;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSNumber * roomType;
@property (nonatomic, retain) NSSet *roomer;
@end

@interface Room (CoreDataGeneratedAccessors)

- (void)addRoomerObject:(Person *)value;
- (void)removeRoomerObject:(Person *)value;
- (void)addRoomer:(NSSet *)values;
- (void)removeRoomer:(NSSet *)values;

@end
