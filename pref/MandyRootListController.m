#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import "SparkAppListTableViewController.h"
#import <UIKit/UIKit.h>

@interface MandyRootListController : PSListController
-(void)selectLightModeApps;
-(void)selectDarkModeApps;
@end

@implementation MandyRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(instancetype)init {
	self = [super init];
	return self;
}

-(void)selectDarkModeApps {
	SparkAppListTableViewController *darkModeOverrides = [[SparkAppListTableViewController alloc] initWithIdentifier:@"com.charliewhile.mandy" andKey:@"darkModeOverrides"];
	[self.navigationController pushViewController:darkModeOverrides animated:YES];
    self.navigationItem.hidesBackButton = FALSE;
}

-(void)selectLightModeApps {
	SparkAppListTableViewController *lightModeOverrides = [[SparkAppListTableViewController alloc] initWithIdentifier:@"com.charliewhile.mandy" andKey:@"lightModeOverrides"];
	[self.navigationController pushViewController:lightModeOverrides animated:YES];
    self.navigationItem.hidesBackButton = FALSE;
}

@end
