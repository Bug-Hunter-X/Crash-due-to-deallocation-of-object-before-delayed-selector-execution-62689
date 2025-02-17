To solve this, use a weak reference to `self` inside a block to prevent the crash.  This block can then call the appropriate selector.  If the object is deallocated, the block will not be executed. 

```objectivec
@implementation MyClass

- (void)myMethod {
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ 
        typeof(self) strongSelf = weakSelf; 
        if (strongSelf) {
            [strongSelf performSelector:@selector(someOtherMethod)];
        }
    });
}

- (void)someOtherMethod {
    // Method to be executed after the delay
}

@end
```
This ensures that the selector is only executed if the object is still alive.