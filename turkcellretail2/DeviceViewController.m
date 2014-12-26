//
//  DeviceViewController.m
//  turkcellretail2
//
//  Created by ddalkanat on 07/11/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import "DeviceViewController.h"
#import "DeviceTableCell.h"
#import "Device.h"
#import "DeviceDetailViewController.h"
#import "SDiPhoneVersion.h"
#import "UIImage+iPhone5.h"

@interface DeviceViewController ()

@property (nonatomic, strong) NSArray *Devices;

@end

@implementation DeviceViewController
@synthesize mytableView;
@synthesize Devices,image1,image2;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    image1.reflectionScale = 3.5f;
    image1.reflectionScale = 0.5f;
    image1.reflectionGap = 20.0f;
    image1.shadowOffset = CGSizeMake(0.0f, 4.0f);
    image1.shadowBlur = 5.0f;
    image1.cornerRadius = 10.0f;
    image1.customEffectsBlock = ^(UIImage *image){
        
        //create drawing context
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
        
        //draw image
        [image drawAtPoint:CGPointZero];
        
        //capture resultant image
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        //return image
        return image;};
    
    image2.reflectionScale = 3.5f;
    image2.reflectionScale = 0.5f;
    image2.reflectionGap = 20.0f;
    image2.shadowOffset = CGSizeMake(0.0f, 4.0f);
    image2.shadowBlur = 5.0f;
    image2.cornerRadius = 10.0f;
    image2.customEffectsBlock = ^(UIImage *image){
        
        //create drawing context
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
        
        //draw image
        [image drawAtPoint:CGPointZero];
        
        //capture resultant image
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        //return image
        return image;};
    
    //navigation bar custom back button without title
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //Navbar Image
    UIImage* image = [UIImage imageNamed:@"sahne_1.png"];
    CGRect frameimg = CGRectMake(0, 0, 15, 23);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image forState:UIControlStateNormal];
   [someButton setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *button =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.rightBarButtonItem=button;
  
    
    
    // Initialize the recipes array
    Device *Device1 = [Device new];
    Device1.name = @"İşletim Sistemi";
    Device1.prepTime = @"iOS 8.1";
    Device1.image = @"ios8.png";
    Device1.ingredients = [NSArray arrayWithObjects:@"- Seyahat Süresi Bildirimleri", @"- Kamerada Ayrı Odak ve Pozlama Özellikleri", @"- DuckDuckGo Arama Motoru", @"- Görme Engellilere Özel Klavye", @"- Wi-Fi ile Arama Özelliği", @"- İpucu Uygulaması", @"- Uygulamaların Pil Kullanım Oranları", @"- FaceTime Arama Bekletme Özelliği",  nil];
    
    Device *Device2 = [Device new];
    Device2.name = @"İşlemci";
    Device2.prepTime = @"Apple A7";
    Device2.image = @"processor.png";
    Device2.ingredients = [NSArray arrayWithObjects:@"- A6 işlemcisinden %31 daha hızlı", @"- 64-bit desteği", @"- 2'şer kat performans artışı", @"- Çok daha detaylı ve compleks öğelerle donatılmış oyun zevki", nil];
    
    Device *Device3 = [Device new];
    Device3.name = @"Dahili Hafıza";
    Device3.prepTime = @"16GB";
    Device3.image = @"Memory.png";
    Device3.ingredients = [NSArray arrayWithObjects:@"- A6 işlemcisinden %31 daha hızlı", @"- 64-bit desteği", @"- 2'şer kat performans artışı", @"- Çok daha detaylı ve compleks öğelerle donatılmış oyun zevki", nil];
    
    Device *Device4 = [Device new];
    Device4.name = @"Ekran Boyutu";
    Device4.prepTime = @"4' ";
    Device4.image = @"Screen.png";
    Device4.ingredients = [NSArray arrayWithObjects:@"- A6 işlemcisinden %31 daha hızlı", @"- 64-bit desteği", @"- 2'şer kat performans artışı", @"- Çok daha detaylı ve compleks öğelerle donatılmış oyun zevki", nil];

    Device *Device5 = [Device new];
    Device5.name = @"Arka Kamera";
    Device5.prepTime = @"8MP";
    Device5.image = @"backcam.png";
    Device5.ingredients = [NSArray arrayWithObjects:@"- 1.5µ pikselle 8 megapiksel", @"- ƒ/2.2 diyafram", @"- Safir kristal mercek kapağı", @"- True Tone flaş", @"- Arka aydınlatma sensörü", @"- Beş bileşenli mercek", @"- Hibrit kızılötesi filtre", @"- Otomatik netleme", nil];
    
    Device *Device6 = [Device new];
    Device6.name = @"Ön Kamera";
    Device6.prepTime = @"1.2MP";
    Device6.image = @"frontcamera.png";
    Device6.ingredients = [NSArray arrayWithObjects:@"- 1.2 MP fotoğraflar (1280 x 960)", @"- ƒ/2.4 diyafram", @"- Fotoğraflar için otomatik HDR", @"- 720p HD video kaydı", @"- Arka aydınlatma sensörü", @"- Beş bileşenli mercek", @"- Yüz algılama", @"- Pozlama denetimi", nil];
    
    Devices = [NSArray arrayWithObjects:Device1, Device2, Device3, Device4, Device5, Device6, nil];
    
    // Remove table cell separator
    [self.mytableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // Assign our own backgroud for the view
    // self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    self.mytableView.backgroundColor = [UIColor clearColor];
    
    // Add padding to the top of the table view
    UIEdgeInsets inset = UIEdgeInsetsMake(5, 0, 0, 0);
    self.mytableView.contentInset = inset;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Devices count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 51;
    
}

- (UIImage *)cellBackgroundForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowCount = [self tableView:[self mytableView] numberOfRowsInSection:0];
    NSInteger rowIndex = indexPath.row;
    UIImage *background = nil;
    
    if (rowIndex == 0) {
        background = [UIImage imageNamed:@"cell_top.png"];
    } else if (rowIndex == rowCount - 1) {
        background = [UIImage imageNamed:@"cell_bottom.png"];
    } else {
        background = [UIImage imageNamed:@"cell_middle.png"];
    }
    
    return background;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    DeviceTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[DeviceTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display recipe in the table cell
    Device *recipe = nil;
    
    recipe = [Devices objectAtIndex:indexPath.row];
    cell.nameLabel.text = recipe.name;
    cell.thumbnailImageView.image = [UIImage imageNamed:recipe.image];
    cell.prepTimeLabel.text = recipe.prepTime;
    
    
    // Assign our own background image for the cell
    UIImage *background = [self cellBackgroundForRowAtIndexPath:indexPath];
    
    UIImageView *cellBackgroundView = [[UIImageView alloc] initWithImage:background];
    cellBackgroundView.image = background;
    cell.backgroundView = cellBackgroundView;
    
    return cell;
}

#pragma mark - Message
- (IBAction)message:(id)sender {

    // Check for device model
    if ([SDiPhoneVersion deviceVersion] == iPhone6) {
        MFMessageComposeViewController *messageComposer = [[MFMessageComposeViewController alloc] init];
        messageComposer.body = @"iPhone6'in yeteneklerinin öğrenmek için tıklayın. http://bit.ly/ZT7Dg9";
        messageComposer.messageComposeDelegate = self;
        [self presentViewController:messageComposer animated:YES completion:nil];
    }

    else if ([SDiPhoneVersion deviceVersion] == iPhone5S)
    {
        MFMessageComposeViewController *messageComposer = [[MFMessageComposeViewController alloc] init];
        messageComposer.body = @"iPhone5s'in yeteneklerinin öğrenmek için tıklayın. http://bit.ly/1vwEoKP";
        messageComposer.messageComposeDelegate = self;
        [self presentViewController:messageComposer animated:YES completion:nil];
    }

    // Check for device screen size
    if ([SDiPhoneVersion deviceSize] == iPhone35inch) {
        MFMessageComposeViewController *messageComposer = [[MFMessageComposeViewController alloc] init];
        messageComposer.body = @"iPhone5s'in yeteneklerinin öğrenmek için tıklayın. http://bit.ly/1gCH5nP";
        messageComposer.messageComposeDelegate = self;
        [self presentViewController:messageComposer animated:YES completion:nil];
    }

    else if ([SDiPhoneVersion deviceSize] == iPhone4inch)
    {
        MFMessageComposeViewController *messageComposer = [[MFMessageComposeViewController alloc] init];
        messageComposer.body = @"iPhone5'in yeteneklerinin öğrenmek için tıklayın. http://bit.ly/1xxgaQQ";
        messageComposer.messageComposeDelegate = self;
        [self presentViewController:messageComposer animated:YES completion:nil];
    }
    else if([SDiPhoneVersion deviceSize] == iPhone47inch)
        NSLog(@"Your screen size is 4.7 inches");
    else if([SDiPhoneVersion deviceSize] == iPhone55inch)
        NSLog(@"Your screen size is 5.5 inches");
    }

-(void) messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    switch (result) {
        case MessageComposeResultCancelled:
            //cancelled
            break;
        case MessageComposeResultFailed:
            //failed
            break;
        case MessageComposeResultSent:
            //sent
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - DetailSegue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDeviceDetail"]) {
        NSIndexPath *indexPath = [self.mytableView indexPathForSelectedRow];
        DeviceDetailViewController *destViewController = segue.destinationViewController;
        destViewController.device = [Devices objectAtIndex:indexPath.row];
        
        // Hide bottom tab bar in the detail view
        //   destViewController.hidesBottomBarWhenPushed = YES;
    }
}


@end
