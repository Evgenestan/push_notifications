curl -v \
-d '
{
  "aps": {
    "alert": {
      "title": "Game Request",
      "subtitle": "Five Card Draw",
      "body": "Bob wants to play poker"
    },
    "mutable-content": 0
  }
}
' \
-H "apns-push-type: alert" \
-H "apns-expiration: 0" \
-H "apns-priority: 0" \
-H "apns-topic: <bundle ID>" \
--http2 \
--cert ./push_cert.pem \
https://api.sandbox.push.apple.com/3/device/<apns-token> # for locally built versions
#https://api.push.apple.com/3/device/<apns-token> # for versions from app store
