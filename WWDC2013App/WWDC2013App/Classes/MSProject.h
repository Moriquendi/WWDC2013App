//
//  MSProject.h
//  WWDC2013App
//
//  Created by Michał Śmiałko on 24.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSProject : NSObject

@property (nonatomic, readonly, strong) NSString *date;
@property (nonatomic, readonly, strong) NSString *imageName;
@property (nonatomic, readonly, strong) NSString *projectDescription;
@property (nonatomic, readonly, strong) NSString *projectName;

+ (NSArray *)loadProjectsFromFile:(NSString *)fileName;

- (id)initWithContentData:(NSDictionary *)data;
@end
