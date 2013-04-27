//
//  MSProject.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 24.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSProject.h"

NSString *const kPlistProjectsList = @"projectsList";
NSString *const kPlistProjectDate = @"date";
NSString *const kPlistImageNames = @"imageNames";
NSString *const kPlistProjectDescription = @"projectDescription";
NSString *const kPlistProjectName = @"projectName";

@interface MSProject ()
@property (nonatomic, readwrite, strong) NSString *title;
@property (nonatomic, readwrite, strong) NSString *date;
@property (nonatomic, readwrite, strong) NSArray *imageNames;
@property (nonatomic, readwrite, strong) NSString *projectDescription;
@property (nonatomic, readwrite, strong) NSString *projectName;
@end

@implementation MSProject

#pragma mark - + MSProject

+ (NSArray *)loadProjectsFromFile:(NSString *)fileName
{
    NSMutableArray *projects = [[NSMutableArray alloc] init];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    NSDictionary *fileContent = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *projectsList = fileContent[kPlistProjectsList];
    
    for (NSString *fileName in projectsList) {
        path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
        NSDictionary *content = [[NSDictionary alloc] initWithContentsOfFile:path];
        MSProject *projectData = [[MSProject alloc] initWithContentData:content];
        [projects addObject:projectData];
    }
    
    return projects;
}

#pragma mark - MSProject

- (id)initWithContentData:(NSDictionary *)data
{
    if (self = [super init]) {
        self.projectName = data[kPlistProjectName];
        self.date = data[kPlistProjectDate];
        self.imageNames = data[kPlistImageNames];
        self.projectDescription = data[kPlistProjectDescription];
    }
    return self;
}

@end
