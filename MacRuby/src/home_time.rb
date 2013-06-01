#!/usr/bin/env macruby

framework 'Cocoa'

def getSetting(key, default)
  @bundle.objectForInfoDictionaryKey(key) || ENV[key] || default
end

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

# default for not bundled app, and can be set in Info.plist for bundled,
# but that way we are bundle independant
# (change to NSApplicationActivationPolicyRegular to force Dock/MenuBar even for unbundled app)
@app.activationPolicy = NSApplicationActivationPolicyProhibited

@bundle = NSBundle.mainBundle

@_zone = getSetting("HomeTimeZone", "UTC")
@_format = getSetting("HomeTimeFormat", "HH:mm")
@_interval = getSetting("HomeTimeInterval", 1)

@dateFormatter = NSDateFormatter.new
@dateFormatter.timeZone = NSTimeZone.timeZoneWithAbbreviation(@_zone)
@dateFormatter.dateFormat = @_format

@statusBar = NSStatusBar.systemStatusBar

@statusItem = @statusBar.statusItemWithLength(NSVariableStatusItemLength)
@statusItem.title = timeString
@statusItem.enabled = false # also makes it gray ofc, which is what we want more then not clicking itself

@timer = NSTimer.scheduledTimerWithTimeInterval @_interval.to_f,
  target:self, selector:'update:', userInfo:nil, repeats:true

@app.run
