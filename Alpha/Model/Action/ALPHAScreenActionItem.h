//
//  ALPHAScreenActionItem.h
//  Alpha
//
//  Created by Dal Rupnik on 25/11/14.
//  Copyright (c) 2014 Unified Sense. All rights reserved.
//

#import "ALPHAActionItem.h"

@interface ALPHAScreenActionItem : ALPHAActionItem

/*!
 *  Set to NO, if option should not appear in main menu
 */
@property (nonatomic, assign) BOOL isMain;

/*!
 *  Set to NO, if option is not available remotely
 */
@property (nonatomic, assign) BOOL isRemote;

/*!
 *  Action that opens a view controller should have this property set to class name.
 *  This is to support backwards FLEX view controllers.
 */
@property (nonatomic, copy) NSString* viewControllerClass;

- (void)setDataIdentifier:(NSString *)dataIdentifier;

@end