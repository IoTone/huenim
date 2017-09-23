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
    resp = updateColors(hubip, username, @["1"], 0.3, 0.3)
    resp = updateColors(hubip, username, @["2"], 0.3, 0.3)
    sleep(2000)
    resp = updateColors(hubip, username, @["1"], 0.3548,0.3489)
    resp = updateColors(hubip, username, @["2"], 0.3548,0.3489)
    sleep(2000)
    resp = updateColors(hubip, username, @["1"], 0.3511,0.3574)
    resp = updateColors(hubip, username, @["2"], 0.3511,0.3574)
    sleep(2000)
    resp = updateColors(hubip, username, @["1"], 0.5,0.2)
    resp = updateColors(hubip, username, @["2"], 0.5,0.2)
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