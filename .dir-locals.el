;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

(("SingletonDemo/SingletonDemoTests-Swift"
  . ((swift-mode
      . ((eval . (add-to-list
                  'flycheck-swift3-framework-search-paths
                  (expand-file-name
                   "Platforms/iPhoneOS.platform/Developer/Library/Frameworks"
                   (getenv "DEVELOPER_DIR"))))))))
 ("SingletonDemo/SingletonDemoTests-ObjC"
  . ((objc-mode
      . ((eval . (set (make-local-variable 'tests-objc-root)
                      (expand-file-name "SingletonDemo/SingletonDemoTests-ObjC"
                                        project-dir)))
         (eval . (set 'flycheck-objc-clang-include-paths
                      (list library-root example-root tests-objc-root)))
         (eval . (add-to-list
                  'flycheck-objc-clang-framework-paths
                  (expand-file-name
                   "Platforms/iPhoneOS.platform/Developer/Library/Frameworks"
                   (getenv "DEVELOPER_DIR"))))))))
 ("SingletonDemo/SingletonDemo"
  . ((objc-mode
      . ((eval . (set 'flycheck-objc-clang-include-paths
                      (list library-root example-root)))))))
 (swift-mode
  . ((flycheck-swift3-xcrun-sdk . "iphoneos")
     (flycheck-swift3-target . "arm64-apple-ios9")
     (eval . (set 'flycheck-swift3-import-objc-header
                  (expand-file-name "SingletonDemo-Bridging-Header.h"
                                    example-root)))))
 (objc-mode
  . ((flycheck-objc-clang-xcrun-sdk . "iphoneos")
     (flycheck-objc-clang-arc . t)
     (flycheck-objc-clang-modules . t)
     (flycheck-objc-clang-archs . ("arm64" "armv7"))
     (flycheck-objc-clang-ios-version-min . "9.0")))
 (nil
  . ((eval . (setenv "DEVELOPER_DIR"
                     "/Applications/Xcode.app/Contents/Developer"))
     (fill-column . 80)
     (whitespace-style . (face lines indentation:space))
     (eval . (set (make-local-variable 'project-dir)
                  (file-name-directory
                   (let ((d (or (dir-locals-find-file ".") default-directory)))
                     (if (stringp d) d (car d))))))
     (eval . (set (make-local-variable 'library-root)
                  (expand-file-name "GSLSynthesizeSingleton" project-dir)))
     (eval . (set (make-local-variable 'example-root)
                  (expand-file-name "SingletonDemo/SingletonDemo"
                                    project-dir))))))
