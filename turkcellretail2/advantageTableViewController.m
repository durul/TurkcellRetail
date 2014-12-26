//
//  advantageTableViewController.h
//  turkcellretail2
//
//  Created by ddalkanat on 12/11/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import "advantageTableViewController.h"
#import "advantageTableCell.h"
#import "advantage.h"
#import "advantageDetailViewController.h"
#import "UIImage+iPhone5.h"

@interface advantageTableViewController ()

//Tableview Array
@property (nonatomic, strong) NSArray *advantages;

@end

@implementation advantageTableViewController
@synthesize advantages;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage tallImageNamed:@"1_00000.png"]];
    
    //navigation bar custom back button without title
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //Navbar Image
    UIImage* image = [UIImage imageNamed:@"sahne_3.png"];
    CGRect frameimg = CGRectMake(0, 0, 15, 23);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image forState:UIControlStateNormal];
    [someButton setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *button =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.rightBarButtonItem=button;
    
    // Initialize the recipes array
    advantage *advantage1 = [advantage new];
    advantage1.name = @"En Yeni Teknolojiler";
    advantage1.prepTime = @"Turkcell, en yeni fikirleri en ileri teknolojilerle birleştirerek abonelerine sunar.";
    advantage1.image = @"3G.png";
    advantage1.imagedetail = @"3Gbig.png";
    advantage1.ingredients = [NSArray arrayWithObjects:@"- Turkcell, diğer operatörlerin her birinden toplamda fazladan minimum 6000 istasyona, %85 oranında 3G nüfus kapsamasına, bu oranın %99’unda Çift Taşıyıcılı İnternet Teknolojisine sahiptir.", @"- Bir bağımsız ölçümleme şirketinin 7-10 Ekim 2013 tarihleri arasında, 16 büyük şehirde yaptığı testlerde Turkcell, ortalama 3G veri indirme hızında birinci olmuştur. 3G Kapsama oranları düzenli olarak BTK Spektrum İzleme Dairesi Başkanlığı’na bildirilmektedir.", @"- 3G sinyal seviyesi ve 3G veri indirme hızı kapsama alanına, coğrafi koşullara, şebeke yoğunluğuna, kullanılan cihaza ve bağlanılan siteye göre değişebilir.",  nil];
    
    advantage *advantage2 = [advantage new];
    advantage2.name = @"Turkcell'in Çekim Gücü";
    advantage2.prepTime = @"%99,17 nüfus kapsama oranı ve yaklaşık 30.500 baz istasyonu ile abonelerini hizmetleriyle buluşturur.";
    advantage2.image = @"cekim_gucu.png";
    advantage2.imagedetail = @"wireless.png";
    advantage2.ingredients = [NSArray arrayWithObjects:@"- En iyi kapsamaya ve en kaliteli çekim gücüne sahip olduğumuzu biliyoruz.", @"- Sevdiklerinizle adeta yanı başınızdaymış gibi konuşmanız için Turkcell çekim gücü sadece Turkcell’de.", @"- Çekim Gücü kapsama alanına, coğrafi koşullara, şebeke yoğunluğuna ve kullanılan cihaza göre değişebilir.",  nil];
    
    advantage *advantage3 = [advantage new];
    advantage3.name = @"Geniş Tarife Seçenekleri";
    advantage3.prepTime = @"Turkcell'de herkese ve her cebe uygun bir tarife seçeneği mutlaka vardır.";
    advantage3.image = @"tarife.png";
    advantage3.imagedetail = @"service.png";
    advantage3.ingredients = [NSArray arrayWithObjects:@"- Hazır Kart'lılar daha fazla konuştu, daha fazla kazandı.", @"- 2011'de yurtdışında da daha fazla avantaj.", @"- Gençler seçti, gnctrkcll yaptı.", @"- Turkcell'li çiftçiler üstün avantajlarla daha verimli", @" -Ev hanımlarını da unutmadık", @"- Profesyoneller kulübü lansmanını gerçekleştirdik, kamu çalışanlarına ve beyaz yakalı çalışanlara özel olanaklar ", nil];
    
    advantage *advantage4 = [advantage new];
    advantage4.name = @"Kolay Hesap Yönetimi";
    advantage4.prepTime = @"Turkcell'de herkes ve her cebe uygun tarife seçeneği mutlaka vardır.";
    advantage4.image = @"kolay_hesap.png";
    advantage4.imagedetail = @"manage.png";
    advantage4.ingredients = [NSArray arrayWithObjects:@"- Birbirinden avantajlı kampanyalarla Turkcell kalitesine geçmenin tam zamanı.", @"- Siz de hemen Hazırkart’tan Faturalı’ya geçin, hem avantajlı tekliflerden faydalanın hem de fatura kontrol özellikleriyle rahat edin.", @"- Yurt dışında arama yapma, aranma, mesajlaşma ve daha fazlası tüm avantajlarıyla Turkcell’de!​​​​​", nil];

    advantages = [NSArray arrayWithObjects:advantage1, advantage2, advantage3, advantage4, nil];

    // Remove table cell separator
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // Assign our own backgroud for the view
    //self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    // Add padding to the top of the table view
    UIEdgeInsets inset = UIEdgeInsetsMake(5, 0, 0, 0);
    self.tableView.contentInset = inset;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [advantages count];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize result = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [UIScreen mainScreen].scale;
    result = CGSizeMake(result.width * scale, result.height * scale);
    
    if(result.height == 1136){  // iPhone 5 Konfigurasyon
        return 130;
    }
    else {
        
        return 150;
    }
}

- (UIImage *)cellBackgroundForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowCount = [self tableView:[self tableView] numberOfRowsInSection:0];
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
    static NSString *CellIdentifier = @"CustomCell";
    advantageTableCell *cell = (advantageTableCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[advantageTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display recipe in the table cell
    advantage *recipe = nil;
    recipe = [advantages objectAtIndex:indexPath.row];
    
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

#pragma mark - DetailSegue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showadvantageDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        advantageDetailViewController *destViewController = segue.destinationViewController;
        destViewController.Advantage = [advantages objectAtIndex:indexPath.row];
        
        // Hide bottom tab bar in the detail view
        //   destViewController.hidesBottomBarWhenPushed = YES;
    }
}
@end
