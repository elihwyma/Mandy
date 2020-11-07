#import <Foundation/Foundation.h>
#import "SparkAppList.h"

%group forceDarkMode
%hook UITraitCollection
-(long long)userInterfaceStyle {
	// 1 = Light Mode, 2 = Dark Mode
	return 2;
}
%end
%end

%group forceLightMode
%hook UITraitCollection
-(long long)userInterfaceStyle {
	// 1 = Light Mode, 2 = Dark Mode
	return 1;
}
%end
%end

%ctor {
	//For forcing dark/light mode depending on app overrides 
	NSString *bundleID = [[NSBundle mainBundle] bundleIdentifier];
	if (bundleID) {
    	if (([SparkAppList doesIdentifier:@"com.charliewhile.mandy" andKey:@"darkModeOverrides" containBundleIdentifier:bundleID]) && !([SparkAppList doesIdentifier:@"com.charliewhile.mandy" andKey:@"lightModeOverrides" containBundleIdentifier:bundleID])){
			%init(forceDarkMode);
		} else if (([SparkAppList doesIdentifier:@"com.charliewhile.mandy" andKey:@"lightModeOverrides" containBundleIdentifier:bundleID]) && !([SparkAppList doesIdentifier:@"com.charliewhile.mandy" andKey:@"darkModeOverrides" containBundleIdentifier:bundleID])) {
			%init(forceLightMode)
		} 
	}
}