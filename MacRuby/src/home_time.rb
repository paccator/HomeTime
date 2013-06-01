#!/usr/bin/env macruby

framework 'Cocoa'

ZONE = ENV['HT_ZONE'] || 'CET'
FORMAT = ENV['HT_FORMAT'] || 'HH:mm'
INTERVAL = ENV['HT_INTERVAL'] || 1

def timeString
  @dateFormatter.stringFromDate(NSDate.date)
end

def update(sender)
  caption = timeString

  @statusItem.title = @caption = caption unless caption == @caption
end

# there is a shortcut NSApp, but we need to access sharedApplication first anyway,
# so we can have @app anyway, so after this NSApp == @app
@app = NSApplication.sharedApplication

# default for not bundled app, and can be set in info.plist for bundled, but what the hell
# (change to NSApplicationActivationPolicyRegular to force Dock/MenuBar even for unbundled app)
@app.activationPolicy = NSApplicationActivationPolicyProhibited

@dateFormatter = NSDateFormatter.new
@dateFormatter.dateFormat = FORMAT
@dateFormatter.timeZone = NSTimeZone.timeZoneWithAbbreviation(ZONE)

@statusBar = NSStatusBar.systemStatusBar

@statusItem = @statusBar.statusItemWithLength(NSVariableStatusItemLength)
@statusItem.title = timeString
@statusItem.enabled = false # also makes it gray ofc, which is what we want more then not clicking itself

@timer = NSTimer.scheduledTimerWithTimeInterval INTERVAL.to_f,
  target:self, selector:'update:', userInfo:nil, repeats:true

@app.run
