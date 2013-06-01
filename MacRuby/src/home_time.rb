#!/usr/bin/env macruby

framework 'Cocoa'

ZONE = ARGV.shift || "UTC"
FORMAT = ARGV.shift || "HH:mm"
INTERVAL = ARGV.shift || 1

def timeString
  @dateFormatter.stringFromDate(NSDate.date)
end

def update(sender)
  caption = timeString

  @statusItem.title = @caption = caption unless caption == @caption
end

@app = NSApplication.sharedApplication

@dateFormatter = NSDateFormatter.new
@dateFormatter.dateFormat = FORMAT
@dateFormatter.timeZone = NSTimeZone.timeZoneWithAbbreviation(ZONE)

@statusBar = NSStatusBar.systemStatusBar

@statusItem = @statusBar.statusItemWithLength(NSVariableStatusItemLength)
@statusItem.title = timeString
@statusItem.enabled = false # also makes it gray ofc, which is what we want more then not clicking itself

@timer = NSTimer.scheduledTimerWithTimeInterval INTERVAL.to_f,
  target:self, selector:"update:", userInfo:nil, repeats:true

@app.run
