
#import "MBEViewController.h"
#import "MBERenderer.h"

@implementation MBEViewController

- (MTKView *)mtkView {
    return (MTKView *)self.view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    id<MTLDevice> device = MTLCreateSystemDefaultDevice();
    self.mtkView.device = device;
    self.mtkView.sampleCount = 4;
    self.mtkView.clearColor = MTLClearColorMake(0.85, 0.85, 0.85, 1.0);
    self.mtkView.preferredFramesPerSecond = 120;

    self.renderer = [[MBERenderer alloc] initWithView:self.mtkView];

    [self.renderer mtkView:self.mtkView drawableSizeWillChange:self.mtkView.bounds.size];

    self.mtkView.delegate = self.renderer;
}

@end
