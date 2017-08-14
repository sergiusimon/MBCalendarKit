//
//  CKDemoViewController.m
//  MBCalendarKit
//
//  Created by Moshe Berman on 4/17/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import "CKDemoViewController.h"

@import MBCalendarKit;

@interface CKDemoViewController () <CKCalendarViewDelegate, CKCalendarViewDataSource>

/**
 This dictionary contains the events for the view controller, keyed by date.
 */
@property (nonatomic, strong) NSMutableDictionary<NSDate *, NSArray<CKCalendarEvent *> *> *data;
@end

@implementation CKDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    /**
     *  Create a dictionary for the data source
     */
    
    self.data = [[NSMutableDictionary alloc] init];
    
    /**
     *  Wire up the data source and delegate.
     */
    
    self.dataSource = self;
    self.delegate = self;
    
    /**
     *  Create some events.
     */
    
    //  An event for the new MBCalendarKit release.
    NSString *title = NSLocalizedString(@"Release MBCalendarKit 2.2.4", @"");
    NSDate *date = [NSDate dateWithDay:28 month:11 year:2014];
    CKCalendarEvent *releaseUpdatedCalendarKit = [CKCalendarEvent eventWithTitle:title andDate:date andInfo:nil];
    
    //  An event for the new Hunger Games movie.
    NSString *title2 = NSLocalizedString(@"The Hunger Games: Mockingjay, Part 1", @"");
    NSDate *date2 = [NSDate dateWithDay:21 month:11 year:2014];
    CKCalendarEvent *mockingJay = [CKCalendarEvent eventWithTitle:title2 andDate:date2 andInfo:nil];

    //  Integrate MBCalendarKit
    NSString *integrationTitle = NSLocalizedString(@"Integrate MBCalendarKit", @"");
    NSDate *integrationDate = date2;
    CKCalendarEvent *integrationEvent = [CKCalendarEvent eventWithTitle:integrationTitle andDate:integrationDate andInfo:nil];
    
    //  An event for the new MBCalendarKit release.
    NSString *title3 = NSLocalizedString(@"Fix bug where events don't show up immediately.", @"");
    NSDate *date3 = [NSDate dateWithDay:29 month:11 year:2014];
    CKCalendarEvent *fixBug = [CKCalendarEvent eventWithTitle:title3 andDate:date3 andInfo:nil];
    
    // An event for testing MBCalendarKit
    NSString *title4 = NSLocalizedString(@"Try MBCalendarKit", @"");
    NSDate *today = [NSDate dateWithDay:31 month:7 year:2017];
    CKCalendarEvent *tryCalendarKit = [CKCalendarEvent eventWithTitle:title4 andDate:today andInfo:nil];
    
    /**
     *  Add the events to the data source.
     *
     *  The key is the date that the array of events appears on.
     */
    
    self.data[date] = @[releaseUpdatedCalendarKit];
    self.data[date2] = @[mockingJay, integrationEvent];
    self.data[date3] = @[fixBug];
    self.data[today] = @[tryCalendarKit];
}

- (void)viewDidAppear:(BOOL)animated
{
    /**
     * Here's an example of setting min/max dates.
     */
    
    /*
     NSDate *min = [NSDate dateWithDay:1 month:4 year:2014];
     NSDate *max = [NSDate dateWithDay:31 month:12 year:2015];
     
     [[self calendarView] setMaximumDate:max];
     [[self calendarView] setMinimumDate:min];
     */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CKCalendarViewDataSource

- (NSArray *)calendarView:(CKCalendarView *)calendarView eventsForDate:(NSDate *)date
{
    return self.data[date];
}

#pragma mark - CKCalendarViewDelegate

// Called before the selected date changes
- (void)calendarView:(CKCalendarView *)CalendarView willSelectDate:(NSDate *)date
{
    
}

// Called after the selected date changes.
- (void)calendarView:(CKCalendarView *)CalendarView didSelectDate:(NSDate *)date
{
    
}

//  A row is selected in the events table. (Use to push a detail view or whatever.)
- (void)calendarView:(CKCalendarView *)CalendarView didSelectEvent:(CKCalendarEvent *)event
{
    
}
@end
