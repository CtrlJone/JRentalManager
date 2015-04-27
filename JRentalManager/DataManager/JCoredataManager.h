//
//  JCoredataManager.h
//  JRentalManager
//
//  Created by Jone on 15/4/26.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface JCoredataManager : NSObject

@property (nonatomic, strong) NSManagedObjectContext *managedObjContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *perStoreCoordinator;

/**
 * gets singleton object.
 * @return singleton
 */
+ (JCoredataManager*)sharedInstance;

- (void)saveContext;



@end
