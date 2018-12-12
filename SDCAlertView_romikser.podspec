Pod::Spec.new do |s|
  s.name             = "SDCAlertView_romikser"
  s.version          = "1.0.0"
  s.summary          = "The little alert that could. A bit modified by @romikser."
  s.homepage         = "https://github.com/romikser/SDCAlertView_romikser"
  s.license          = { :type => "MIT" }
  s.authors          = { "Scott Berrevoets" => "s.berrevoets@me.com" }
  s.source           = { :git => "https://github.com/romikser/SDCAlertView_romikser.git", :tag => "v_r#{s.version}" }
  s.social_media_url = "https://twitter.com/ScottBerrevoets"
  s.module_name      = "SDCAlertView"
  s.source_files     = "Source/**/*.{swift}"
  s.resource_bundles = { 'SDCAlertView' => ['Source/**/*.{xib}'] }

  s.ios.deployment_target = 9.0
  s.requires_arc = true
end
