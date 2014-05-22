#import <Preferences/PSSpecifier.h>
#import <Preferences/PSTableCell.h>
#import "PFHeaderCell.h"
//PFHeaderCell.mm by Pixel Fire http://pixelfire.baileyseymour.com

@interface PFHeaderCell()
{
	UIView *headerImageViewContainer;
	UIImageView *headerImageView;
}
- (void)prepareHeaderImage:(PSSpecifier *)specifier;
- (void)applyHeaderImage;
+ (UIColor *)colorFromHex:(NSString *)hexString;
@end

@implementation PFHeaderCell

+ (UIColor *)colorFromHex:(NSString *)hexString
{
    unsigned rgbValue = 0;
    if ([hexString hasPrefix:@"#"]) hexString = [hexString substringFromIndex:1];
    if (hexString) {
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:0]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
    }
    else return [UIColor grayColor];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)identifier specifier:(PSSpecifier *)specifier
{
	self = [super initWithStyle:style reuseIdentifier:identifier specifier:specifier];
 	
	[self prepareHeaderImage:specifier];
	[self applyHeaderImage];

	return self;
}

- (void)prepareHeaderImage:(PSSpecifier *)specifier
{
	headerImageViewContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	headerImageViewContainer.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) headerImageViewContainer.layer.cornerRadius = 5;

 	if(specifier.properties[@"image"] && specifier.properties[@"background"]) 
 	{
	headerImageView = [[UIImageView alloc] initWithImage:[[UIImage alloc] initWithContentsOfFile:specifier.properties[@"image"]]];
 	
	headerImageViewContainer.backgroundColor = [PFHeaderCell colorFromHex:specifier.properties[@"background"]];
 
	[headerImageViewContainer addSubview:headerImageView];
	}
}
 
- (void)applyHeaderImage
{
	[self addSubview:headerImageViewContainer];
}

@end