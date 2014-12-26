//
//  mobilappTableViewController.h
//  turkcellretail2
//
//  Created by ddalkanat on 12/11/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//

#import "mobilappTableViewController.h"
#import "mobilappTableCell.h"
#import "mobilapp.h"
#import "mobilappDetailViewController.h"
#import "UIImage+iPhone5.h"

@interface mobilappTableViewController ()


@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, assign) NSInteger itemCount;

//Tablewiew Array
@property (nonatomic, strong) NSArray *mobilapps;

@end

@implementation mobilappTableViewController
@synthesize mobilapps;

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
    UIImage* image = [UIImage imageNamed:@"sahne_5.png"];
    CGRect frameimg = CGRectMake(0, 0, 40, 41);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image forState:UIControlStateNormal];
    [someButton setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *button =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.rightBarButtonItem=button;

    
    // Initialize the recipes array
    mobilapp *mobilapp1 = [mobilapp new];
    mobilapp1.name = @"Turkcell Tv";
    mobilapp1.prepTime = @"Turkcell TV+ ile sevdiğiniz film,dizi,tv kanallarını izleme keyfi cebinizde ve tabletinizde";
    mobilapp1.image = @"turkcell_tv_kucuk.png";
    mobilapp1.imagedetail = @"turkcell_tv.png";
    mobilapp1.ingredients = [NSArray arrayWithObjects:@"- Zamana ve mekana bağlı olmayan, geleceğin TV deneyimi Turkcell TV+’ın çoklu ekran seçeneği ile sevdiğiniz film, dizi ve TV kanallarını izleme keyfi cebinizde, tabletinizde ve bilgisayarınızda!", @"- Turkcell TV+ yayınları kaydetme, 5 saate kadar geri alma ve gelişmiş kişiselleştirme özellikleri ile size eşsiz bir TV deneyimi sunuyor.", @"- Cep telefonu ve tabletinize Turkcell TV+ uygulamasını indirerek, bilgisayarınızda www.turkcelltvplus.com.tr'ye tıklayarak siz de bu keyfi yaşamaya başlayın!",  nil];
   
    
    mobilapp *mobilapp2 = [mobilapp new];
    mobilapp2.name = @"Turkcell Müzik";
    mobilapp2.prepTime = @"Turkcell Müzik, müzik dinlemenizi sağlayan yasal müzik platformudur.";
    mobilapp2.image = @"turkcell_muzik_kucuk.png";
    mobilapp2.imagedetail = @"turkcellmuzik.png";
    mobilapp2.ingredients = [NSArray arrayWithObjects:@"- Turkcell Müzik, müzik dinlemenizi sağlayan yasal müzik platformudur.", @"- iPhone ve Adroid cihazlarınızda uygulamalar üzerinden ulaşabilirsiniz.", @"- Turkcell Müzik’te; sevdiğiniz şarkıları, albümleri veya size özel hazırlanan listeleri dinleyebilir, şarkı listeleri oluşturabilir.", @"- Sevdiğiniz şarkıyı veya oluşturduğunuz listeleri paylaşabilir.", @"- Sevdiğiniz bir şarkıyı veya bir albümün tümünü satın alabilir",  @"- Cep telefonunuza, tabletinize ve bilgisayarınıza internet ücreti ödemeden indirebilir.", nil];
    
    
    mobilapp *mobilapp3 = [mobilapp new];
    mobilapp3.name = @"Turkcell Hesabım";
    mobilapp3.prepTime = @"Hattınızın kontrolü, Turkcell Hesabım Uygulamasıyla cebinizde.";
    mobilapp3.image = @"turkcell_hesabim_kucuk.png";
    mobilapp3.imagedetail = @"hesap.png";
    mobilapp3.ingredients = [NSArray arrayWithObjects:@"- Hat Özetim sayfasında, hattınızın kullanım durumunun özetini görebilirsiniz.", @"- ​Faturalarım sayfasında, güncel ve önceki dönemlere ait fatura tutarlarınızı inceleyebilir ve fatura kontrol uyarı limitinizi ayarlayabilirsiniz.", @"- Bu sayfadan TL durumunuzu görebilir, kredi transfer ve kredi isteme işlemlerini yapabilirsiniz.", @"- Fatura ödeme sayfasından, güncel ve geçmiş döneme ait ödenmemiş faturalarınızı veya ödemesini yapmak istediğiniz hattın faturasını kredi kartınızla kolaylıkla ödeyebilirsiniz.",  @"- Hat Özetim’e tıklayarak kalan kullanımlarınızı görüntüleyebilirsiniz.", nil];
    
    
    mobilapp *mobilapp4 = [mobilapp new];
    mobilapp4.name = @"AppMarket";
    mobilapp4.prepTime = @"Hayatınızı kolaylaştıracak, eğlenceli vakit geçirmenizi sağlayacak renkli uygulamalar,AppMarket ile cebinizde.";
    mobilapp4.image = @"app_market_kucuk.png";
    mobilapp4.imagedetail = @"appmarket.png";
    mobilapp4.ingredients = [NSArray arrayWithObjects:@"- Turkcell kalitesiyle binlerce uygulama sayesinde cep telefonunuz daha yetenekli, hayat daha keyifli!", @"- ​Turkcell AppMarket’i kullanmak için herhangi bir ayar yapmanız gerekmez.", @"- Turkcell AppMarket, data bağlantısı için Turkcell internet veya wap bağlantı noktasını kullanır.", @"- Uygulamayı her çalıştırdığınızda güncel bilgileri ve varsa uygulamadaki güncellemeleri otomatik olarak ücretsiz indirir ve günceller.", nil];
  
    
    mobilapp *mobilapp5 = [mobilapp new];
    mobilapp5.name = @"Turkcell Mobil Asistan";
    mobilapp5.prepTime = @"Turkcell Mobil Asistan, ilk ve tek operatör destekli sanal asistan uygulamasıdır.";
    mobilapp5.image = @"turkcell_mobil_asist_kucuk.png";
    mobilapp5.imagedetail = @"asistan.png";
    mobilapp5.ingredients = [NSArray arrayWithObjects:@"- Turkcell Mobil Asistan uygulamasını T-Market’ten indirmek ücretsizdir.", @"- ​Turkcell AppMarket’i kullanmak için herhangi bir ayar yapmanız gerekmez.", @"- Kullanım esnasında oluşan data, varsa data paketinizden, yoksa mevcut tarifenizden ücretlendirilir.", @"- Turkcell Mobil Asistan Servisi ile telefonunuza konuşarak, kalan tutarınızı, bakiyenizi, kampanya bilgilerinizi, SMS bilginizi öğrenebilirsiniz. Bunun yanında bulunduğunuz ilin hava durumunu öğrenebilir, en yakındaki eczane, hastane ve sağlık merkezlerinin adreslerine erişebilirsiniz.", nil];
    
    mobilapps = [NSArray arrayWithObjects:mobilapp1, mobilapp2, mobilapp3, mobilapp4, mobilapp5, nil];
    
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
    return [mobilapps count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        CGSize result = [[UIScreen mainScreen] bounds].size;
        CGFloat scale = [UIScreen mainScreen].scale;
        result = CGSizeMake(result.width * scale, result.height * scale);
        
        if(result.height == 1136){  // iPhone 5 Konfigurasyon
             return 100;
        }
        else {
        
             return 120;
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
    static NSString *CellIdentifier = @"CustomTableCell";
    mobilappTableCell *cell = (mobilappTableCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[mobilappTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display recipe in the table cell
    mobilapp *mobilapp = nil;
    mobilapp = [mobilapps objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = mobilapp.name;
    cell.thumbnailImageView.image = [UIImage imageNamed:mobilapp.image];
    cell.prepTimeLabel.text = mobilapp.prepTime;
    
    // Assign our own background image for the cell
    UIImage *background = [self cellBackgroundForRowAtIndexPath:indexPath];
    
    UIImageView *cellBackgroundView = [[UIImageView alloc] initWithImage:background];
    cellBackgroundView.image = background;
    cell.backgroundView = cellBackgroundView;
    
    return cell;
}

#pragma mark - DetailSegue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showmobilappsDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        mobilappDetailViewController *destViewController = segue.destinationViewController;
        destViewController.Mobilapp = [mobilapps objectAtIndex:indexPath.row];
        
        // Hide bottom tab bar in the detail view
        //   destViewController.hidesBottomBarWhenPushed = YES;
    }
}

@end
