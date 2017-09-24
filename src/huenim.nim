## Author: dkords@iotone.io
## See LICENSE.txt in project root for details
import asyncdispatch
import net
import httpclient
import json
import strutils

const moduleVersion* = "1.0.0"
const HUE_LIGHTS_API_URI = "http://$1/api/$2/lights"
const HUE_API_LIGHTS_STATE = "http://$1/api/$2/lights/$3/state"
const HUE_ONOFF_KEY = "on"
const HUE_LEVEL_KEY = "bri"
const HUE_HUE_KEY = "hue"
const HUE_SAT_KEY = "sat"
const HUE_ALERT_KEY = "alert"
const HUE_EFFECT_KEY = "effect"
const HUE_XY_KEY = "xy"
const HUE_COLOR_TEMP_KEY = "ct"
const HUE_RAMP_RATE_KEY = "transitiontime"
const HUE_DEFAULT_RAMP_RATE = 15
const HUE_DEFAULT_ALERT_TIME = 15
const HUE_HUB_IP_KEY* = "internalipaddress"
const HUE_HUB_ID_KEY* = "id"

# XXX Another garbage test function
proc fillString*(): string =
  result = ""
  echo("Generating string")
  for i in 0 .. 4:
    result.add($i)

proc toggleLights*(hubip: string, username: string, lightids: seq[string], state: bool): JsonNode =
  let client = newAsyncHttpClient()
  var buf = newString(256)

  echo(lightids)
  for i, elem in lightids:
    buf = format(HUE_API_LIGHTS_STATE, hubip, username, elem)
    echo(buf)
    client.headers = newHttpHeaders({ "Content-Type": "application/json" })

    let body = %*{
      HUE_ONOFF_KEY: state,
      HUE_RAMP_RATE_KEY: HUE_DEFAULT_RAMP_RATE
    }
    echo(body)
    # let response = waitFor client.put(buf, $body)
    let response = waitFor client.request(buf, httpMethod = HttpPut, body = $body)
    
    # echo(response.version)
    # echo(response.status)
    # echo(response.status==Http200)
    # echo(waitFor response.body)
    # echo(is3xx(response.code))
    # result = response.status
    result = parseJson(waitFor response.body)
    # echo(result)

proc updateColors*(hubip: string, username: string, lightids: seq[string], colorx:float, colory:float): JsonNode =
  let client = newAsyncHttpClient()
  var buf = newString(256)

  echo(lightids)
  for i, elem in lightids:
    buf = format(HUE_API_LIGHTS_STATE, hubip, username, elem)
    echo(buf)
    client.headers = newHttpHeaders({ "Content-Type": "application/json" })

    let body = %*{
      HUE_XY_KEY: [colorx, colory],
      HUE_RAMP_RATE_KEY: HUE_DEFAULT_RAMP_RATE
    }
    echo(body)
    # let response = waitFor client.put(buf, $body)
    let response = waitFor client.request(buf, httpMethod = HttpPut, body = $body)
    
    # echo(response.version)
    # echo(response.status)
    # echo(response.status==Http200)
    # echo(waitFor response.body)
    # echo(is3xx(response.code))
    # result = response.status
    result = parseJson(waitFor response.body)
    # echo(result)

proc updateColorTemps*(hubip: string, username: string, lightids: seq[string], colortemp:int): JsonNode =
  let client = newAsyncHttpClient()
  var buf = newString(256)

  echo(lightids)
  for i, elem in lightids:
    buf = format(HUE_API_LIGHTS_STATE, hubip, username, elem)
    echo(buf)
    client.headers = newHttpHeaders({ "Content-Type": "application/json" })

    let body = %*{
      HUE_COLOR_TEMP_KEY: colortemp,
      HUE_RAMP_RATE_KEY: HUE_DEFAULT_RAMP_RATE
    }
    echo(body)
    # let response = waitFor client.put(buf, $body)
    let response = waitFor client.request(buf, httpMethod = HttpPut, body = $body)
    
    # echo(response.version)
    # echo(response.status)
    # echo(response.status==Http200)
    # echo(waitFor response.body)
    # echo(is3xx(response.code))
    # result = response.status
    result = parseJson(waitFor response.body)
    # echo(result)

#
# Use nupnp to discover
# NOTE: this requires remote internet access and open tunnel for upnp
# https://www.meethue.com/api/nupnp
# example:
# [{"id":"001012012301235","internalipaddress":"10.1.1.25"}]
proc findHueHubs*(): JsonNode =
  let client = newAsyncHttpClient()
  let response = waitFor client.get("https://www.meethue.com/api/nupnp")
  # echo(response.version)
  # echo(response.status)
  # echo(response.status==Http200)
  # echo(waitFor response.body)
  # echo(is3xx(response.code))
  # result = response.status
  result = parseJson(waitFor response.body)
#
# Attribution: http://stackoverflow.com/q/36990902/796514
# See IoTone CLHueBridge for working implmentation
# This is also a good appraoch in JS: https://github.com/sqmk/huejay/blob/master/lib/DiscoveryStrategy/Upnp.js
# Seems like SSDP could be implemented: https://github.com/achingbrain/ssdp
# This doesn't work.  Would like to know why.  Reimplement later.
proc findHueHubsViaUPnP*(): seq[string] =
  echo("Implement findHueHubs")
  let upnpsearch: string = "M-SEARCH * HTTP/1.1/r/nST: ssdp:all\r\nMX: 10\r\nMan: ssdp:discover\r\nHOST: 239.255.255.250:1900\r\n\r\n"
  let upnpquery: string =
            "M-SEARCH * HTTP/1.1\r\n" &
            "HOST: 239.255.255.250:1900\r\n" &
            "ST: urn:schemas-upnp-org:device:basic:1\r\n" &
            "MX: 10\r\n" &
            "MAN: \"ssdp:discover\"\r\n" &
            "\r\n"
  # let socket = newSocket()
  let socket = newSocket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)
  # proc bindAddr(socket: Socket; port = Port(0); address = "") {..}
  
  # var socket = dial("239.255.255.250", Port(199), IPPROTO_UDP);
  # socket.setSockOpt(OptReuseAddr, true)
  bindAddr(socket, Port(1900), "239.255.255.250")
  
  let res = socket.sendTo("239.255.255.250", Port(1900), cstring(upnpquery), upnpquery.len.cint)
  # let res = trySend(socket, upnpquery)
  echo(res)
  # socket.send(upnpsearch)
  echo("sent upnp query\n")
  while true:
    var data = newString(1500)
    var recvaddr = newString(1500)
    var recvport: Port
    var recvlen: int
    # var data: string
    echo("blocking\n")
    # data = recvLine(socket)
    # recvL proc recvFrom(socket: Socket; data: var string; length: int; address: var string;
    #        port: var Port; flags = 0'i32): int {..}
    let len = recvFrom(socket, data, recvlen, recvaddr, recvport)
    
    echo(data)

  #[ var socket = newSocket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)

  for count in 1 ..< 5:
    var mystatus = "I'm sending for " & $count & " times"
    discard socket.sendTo("localhost", Port(3000), mystatus)
    var
      data = ""
      address = ""
      senderport: Port
      length = 64
    discard socket.recvFrom(data, length, address, senderport)
    echo data ]#

when isMainModule:
  echo("isMainModule")