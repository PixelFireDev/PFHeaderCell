#PFHeaderCell

With `PFHeaderCell` you can add a header or banner image to the top of your  PreferenceBundle's table view.
It's pretty easy to add to your project too.

1. Add `PFHeaderCell.mm` to your Makefile
2. Add the sample XML code below to your bundle's plist and modify it to your liking.


		<dict>
			<key>cell</key>
			<string>PSStaticTextCell</string>
			<key>cellClass</key>
			<string>PFHeaderCell</string>
			<key>background</key>
			<string>#2c3e50</string>
			<key>image</key>
			<string>/Library/PreferenceBundles/MyPrefs.bundle/header.png</string>
			<key>height</key>
			<integer>100</integer>
		</dict>
		
		
##Keys:
* __background__ is hex code like `#ffffff` for white and `#000000` for black.

* __image__ is the full absolute path to your header image. An example would be `/Library/PreferenceBundles/MyPrefs.bundle/header.png`

####Your header image should be 320x100 and 640x200 for @2x devices.
Use a clear png and set your background color for a professional look.
