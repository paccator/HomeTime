Home Time
=========

Collection to be (and mostly just an exercise that satisfies my own need)
of very basic and simple apps that only have a single purpose,
that is to display home time during travel,
but without distraction and in similar way to system time.

For now there is only mac version - very simple MacRuby script.

## MacRuby script

Default time zone is UTC and time format is HH:mm.

Currently the only way to set them is via Info.plist or using environment, e.g:

    # /etc/launchd.conf
    setenv HomeTimeZone CET
    setenv HomeTimeFormat "HH:mm V"

## Time Format

#### hour

    h  1-12
    H  0-23
    hh 01-12
    HH 00-23
    a  AM/PM

#### minutes

    m  00-50
    mm 00-59

#### seconds

    s  0-59
    ss 0-59

#### zone

    v  short name
    V  acronym

Full format symbols table can be found at <http://www.unicode.org/reports/tr35/tr35-25.html#Date_Format_Patterns>.

## Time Zones

Time Zone abbreviations:

    GMT                               GMT
    UTC                               UTC
    Africa/Addis_Ababa                EAT
    Africa/Harare                     CAT
    Africa/Lagos                      WAT
    America/Argentina/Buenos_Aires    ART
    America/Bogota                    COT
    America/Chicago                   CST
    America/Chicago                   CDT
    America/Denver                    MDT
    America/Denver                    MST
    America/Halifax                   ADT
    America/Halifax                   AST
    America/Juneau                    AKST
    America/Juneau                    AKDT
    America/Lima                      PET
    America/Los_Angeles               PST
    America/Los_Angeles               PDT
    America/New_York                  EDT
    America/New_York                  EST
    America/Santiago                  CLT
    America/Santiago                  CLST
    America/Sao_Paulo                 BRST
    America/Sao_Paulo                 BRT
    Asia/Bangkok                      ICT
    Asia/Calcutta                     IST
    Asia/Dhaka                        BDT
    Asia/Dubai                        GST
    Asia/Hong_Kong                    HKT
    Asia/Jakarta                      WIT
    Asia/Karachi                      PKT
    Asia/Manila                       PHT
    Asia/Seoul                        KST
    Asia/Singapore                    SGT
    Asia/Tehran                       IRST
    Asia/Tokyo                        JST
    Europe/Istanbul                   EEST
    Europe/Istanbul                   EET
    Europe/Lisbon                     WET
    Europe/Lisbon                     WEST
    Europe/London                     BST
    Europe/Moscow                     MSK
    Europe/Moscow                     MSD
    Europe/Paris                      CET
    Europe/Paris                      CEST
    Pacific/Auckland                  NZST
    Pacific/Auckland                  NZDT
    Pacific/Honolulu                  HST

## License

Copyright (c) 2013 SIN-SOFT

HomeTime is released under the MIT license.

## Icon

Clock icon (on Freeware Non-commercial license) from: <http://findicons.com/icon/44775/clock?id=44775>
