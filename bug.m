In Objective-C, a rare but impactful bug can arise from the misuse of `performSelector:withObject:afterDelay:`. If the object whose selector is being performed deallocates before the delay expires, a crash may occur. This is because the selector is still scheduled for execution, but the target object no longer exists.