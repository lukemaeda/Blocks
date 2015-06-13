//
//  ViewController.m
//  Blocks
//
//  Created by MAEDA HAJIME on 2014/03/27.
//  Copyright (c) 2014年 MAEDA HAJIME. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lbString;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
- (IBAction)doTest:(id)sender {
    
    /*
     構文：
     戻り値の型 (^名前)(引数の型, 引数の型, ...) = 
      ^(引数1の定義,引数2の定義, ...) { 処理 };
    */
    
    // パターン１　ブロック機構（ただの変数として認識）
    // 戻り値　引数
    void (^func01)(void) = ^(void) {
        
        NSLog(@"Hello!");
        
    };
    
    // パターン２　引数１個
    // 戻り値　引数
    void (^func02)(int) = ^(int arg01) {
        
        NSLog(@"消費税は%d%%", arg01);
    };
    
    // パターン３
    //
    void(^fun03)(NSString *) = ^(NSString  *arg02) {
        
        NSLog(@"%@", arg02);
    };
    
    // パターン４
    int (^fun04)(int, int) = ^(int arg01, int arg02) {
        
        return arg01 + arg02;

    };
    
    // パターン５
    int num00 = 100;
    
    int (^fun05)(int) = ^(int arg01) {
        
        return arg01 * num00;
    };
    
    // パターン１ 使用
    func01();
    
    // パターン２ 使用　消費税
    func02(8);
    
    // パターン3 使用　あいうえお
    fun03(@"あいうえお");
    
    // パターン4 使用 11
    int ret04 = fun04(10, 1);
    NSLog(@"%d", ret04);
    
    // パターン5 使用 300
    int ret05 = fun05(3);
    NSLog(@"%d", ret05);

}

// パターン１　ブロック機構（ただの変数として認識）
- (IBAction)proc01:(id)sender {
    
    /*
     構文：
     戻り値の型 (^名前)(引数の型, 引数の型, ...) =
     ^(引数1の定義,引数2の定義, ...) { 処理 };
     */
    
    // パターン１　ブロック機構（ただの変数として認識）
    // 戻り値　引数
    void (^func01)(void) = ^(void) {
        
        NSLog(@"Hello!");
        self.lbString.text = @"Hello!";
    };
    
    // パターン１ 使用
    func01();

}

// パターン２ 使用　消費税
- (IBAction)proc02:(id)sender {
    
    // パターン２　引数１個
    // 戻り値　引数
    void (^func02)(int) = ^(int arg01) {
        
        NSLog(@"消費税は%d%%", arg01);
        self.lbString.text = [NSString stringWithFormat:@"消費税は%d%%", arg01];
    };
    
    // パターン２ 使用　消費税
    func02(8);
}

// パターン３ fun03(@"あいうえお");
- (IBAction)proc03:(id)sender {
    
    // パターン３
    //
    void(^fun03)(NSString *) = ^(NSString  *arg02) {
        
        NSLog(@"%@", arg02);
        self.lbString.text = [NSString stringWithFormat:@"%@",arg02];
    };
    
    // パターン3 使用　あいうえお
    fun03(@"あいうえお");
    
}

// パターン４ A + B = C
- (IBAction)proc04:(id)sender {
    
    // パターン４
    int (^fun04)(int, int) = ^(int arg01, int arg02) {
        
        return arg01 + arg02;
    };
    
    // パターン4 使用 11
    int ret04 = fun04(10, 1);
    NSLog(@"%d", ret04);
    self.lbString.text = [NSString stringWithFormat:@"%d",ret04];
    
}

// パターン５ A * B = C
- (IBAction)proc05:(id)sender {
    
    // パターン５
    int num00 = 100;
    
    int (^fun05)(int) = ^(int arg01) {
        
        return arg01 * num00;
    };
    
    // パターン5 使用 300
    int ret05 = fun05(3);
    NSLog(@"%d", ret05);
    self.lbString.text = [NSString stringWithFormat:@"%d",ret05];
}

@end
