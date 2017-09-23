import unittest, huenim
import json
import os

var hubip: string

# Don't forget to set up a new user: curl -X POST -d '{"devicetype":"myappname#myusername"}' http://myipaddress/api
const username = "xxx-somelongusername"
suite "tlkit test all":
  test "call findHueHubs":
    var hubs: JsonNode
    hubs = findHueHubs()
    echo(len(hubs))
    check len(hubs) > 0
    var hub = hubs[0]
    check hub["id"] != nil
    check hub["internalipaddress"] != nil
    hubip = hub["internalipaddress"].getStr()
  test "call toggleLights":
    var resp: JsonNode
    resp = toggleLights(hubip, username, @["1"], true)
    resp = toggleLights(hubip, username, @["2"], true)
    # Set back to something like a white
    resp = updateColors(hubip, username, @["1"], 0.3, 0.3)
    resp = updateColors(hubip, username, @["2"], 0.3, 0.3)
    # Walk through the color gamut
    # Borrow colors recommended here: https://github.com/gobo-ws/ola-trigger-hue-dmx/blob/master/philips_hue_color_gamut_b.conf
    sleep(2000)
    # 1		Alice Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321)
    sleep(2000)
    # 2		Antique White
    resp = updateColors(hubip, username, @["2"], 0.3548,0.3489)
    sleep(2000)
    # 3		Aqua
    resp = updateColors(hubip, username, @["1"], 0.2858,0.2747)
    sleep(2000)
    # 4		Aquamarine
    resp = updateColors(hubip, username, @["2"], 0.3237,0.3497)
    sleep(2000)
    # 5		Azure
    resp = updateColors(hubip, username, @["1"], 0.3123,0.3271) 
    sleep(2000)
    # 6		Beige
    resp = updateColors(hubip, username, @["1"], 0.3402,0.356) 
    sleep(2000)
    # 7		Bisque
    resp = updateColors(hubip, username, @["1"], 0.3806,0.3576) 
    sleep(2000)
    # 8		Black
    resp = updateColors(hubip, username, @["1"], 0.168,0.041) 
    sleep(2000)
    # 9		Blanched Almond
    resp = updateColors(hubip, username, @["1"], 0.3695,0.3584)
    sleep(2000)
    # 10		Blue
    resp = updateColors(hubip, username, @["1"], 0.168,0.041)
    sleep(2000)
    # 11		Blue Violet
    resp = updateColors(hubip, username, @["1"], 0.251,0.1056) 
    sleep(2000)
    # 12		Brown
    resp = updateColors(hubip, username, @["1"], 0.6399,0.3041) 
    sleep(2000)
    # 13		Burlywood
    resp = updateColors(hubip, username, @["1"], 0.4236,0.3811) 
    sleep(2000)
    # 14		Cadet Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 15		Chartreuse
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 16		Chocolate
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 17		Coral
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 18		Cornflower
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321)
    sleep(2000)
    # 19		Cornsilk
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321)
    sleep(2000)
    # 20		Crimson
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321)
    sleep(2000)
    # 21		Cyan
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321)
    sleep(2000)
    # 22		Dark Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321)
    sleep(2000)
    # 23		Dark Cyan
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321)
    sleep(2000)
    # 24		Dark Goldenrod
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 25		Dark Gray
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 26		Dark Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 27		Dark Khaki
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 28		Dark Magenta
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 29		Dark Olive Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 30		Dark Orange
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 31		Dark Orchid
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 32		Dark Red
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 33		Dark Salmon
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 34		Dark Sea Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 35		Dark Slate Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 36		Dark Slate Gray
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 37		Dark Turquoise
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 38		Dark Violet
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 39		Deep Pink
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 40		Deep Sky Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 41		Dim Gray
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 42		Dodger Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 43		Firebrick
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 44		Floral White
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 45		Forest Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 46		Fuchsia
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 47		Gainsboro
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 48		Ghost White
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 49		Gold
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 50		Goldenrod
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 51		Gray
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 52		Web Gray
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 53		Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 54		Web Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 55		Green Yellow
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 56		Honeydew
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 57		Hot Pink
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 58		Indian Red
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 59		Indigo
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 60		Ivory
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 61		Khaki
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 62		Lavender
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 63		Lavender Blush
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 64		Lawn Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 65		Lemon Chiffon
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 66		Light Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 67		Light Coral
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 68		Light Cyan
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 69		Light Goldenrod
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 70		Light Gray
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 71		Light Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 72		Light Pink
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 73		Light Salmon
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 74		Light Sea Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 75		Light Sky Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 76		Light Slate Gray
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 77		Light Steel Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 78		Light Yellow
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 79		Lime
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 80		Lime Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 81		Linen
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 82		Magenta
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 83		Maroon
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 84		Web Maroon
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 85		Medium Aquamarine
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 86		Medium Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 87		Medium Orchid
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 88		Medium Purple
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 89		Medium Sea Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 90		Medium Slate Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 91		Medium Spring Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 92		Medium Turquoise
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 93		Medium Violet Red
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 94		Midnight Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 95		Mint Cream
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 96		Misty Rose
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 97		Moccasin
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 98		Navajo White
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 99		Navy Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 100		Old Lace
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 101		Olive
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 102		Olive Drab
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 103		Orange
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 104		Orange Red
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 105		Orchid
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 106		Pale Goldenrod
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 107		Pale Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 108		Pale Turquoise
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 109		Pale Violet Red
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 110		Papaya Whip
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 111		Peach Puff
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 112		Peru
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 113		Pink
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 114		Plum
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 115		Powder Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 116		Purple
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 117		Web Purple
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 118		Rebecca Purple
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 119		Red
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 120		Rosy Brown
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 121		Royal Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 122		Saddle Brown
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 123		Salmon
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 124		Sandy Brown
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 125		Sea Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 126		Seashell
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 127		Sienna
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 128		Silver
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 129		Sky Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 130		Slate Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 131		Slate Gray
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 132		Snow
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 133		Spring Green
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 134		Steel Blue
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 135		Tan
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 136		Teal
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 137		Thistle
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 138		Tomato
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 139		Turquoise
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 140		Violet
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 141		Wheat
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 142		White
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 143		White Smoke
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321) 
    sleep(2000)
    # 144		Yellow
    resp = updateColors(hubip, username, @["1"], 0.3092,0.321)
    sleep(2000)
    # 145 Yellow Green
    resp = updateColors(hubip, username, @["1"], 0.3548,0.3489)
    sleep(2000)
    resp = updateColorTemps(hubip, username, @["1"], 500)
    resp = updateColorTemps(hubip, username, @["2"], 500)
    sleep(2000)
    resp = updateColorTemps(hubip, username, @["1"], 150)
    resp = updateColorTemps(hubip, username, @["2"], 150)
    sleep(15000)
    resp = toggleLights(hubip, username, @["1"], false)
    resp = toggleLights(hubip, username, @["2"], false)
    
    echo(resp)