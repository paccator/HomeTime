#!/usr/bin/env macruby
#
# Copyright (c) 2013 SIN-SOFT
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

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
@_format = getSetting("HomeTimeFormat", "HH:mm V")
@_interval = getSetting("HomeTimeInterval", 1)

@dateFormatter = NSDateFormatter.new
@dateFormatter.timeZone = NSTimeZone.timeZoneWithAbbreviation(@_zone)
@dateFormatter.dateFormat = @_format

@statusBar = NSStatusBar.systemStatusBar

@statusItem = @statusBar.statusItemWithLength(NSVariableStatusItemLength)
@statusItem.title = timeString
@statusItem.toolTip = "Home Time - #{@_zone}"
@statusItem.enabled = false # also makes it gray ofc, which is what we want more then not clicking itself

@timer = NSTimer.scheduledTimerWithTimeInterval @_interval.to_f,
  target:self, selector:'update:', userInfo:nil, repeats:true

NSLog("Home Time - #{@_zone} (#{@_format} at #{@_interval.to_f}s)") # also stderr

@app.run
