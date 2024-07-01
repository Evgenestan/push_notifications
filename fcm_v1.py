import firebase_admin
import datetime

from sys import argv
from firebase_admin import messaging

# Don't forget to set GOOGLE_APPLICATION_CREDENTIALS
# https://firebase.google.com/docs/cloud-messaging/auth-server#provide-credentials-manually
# for launch:  python3 fcm_v1.py <token> title body

script, registration_token, title, body = argv

default_app = firebase_admin.initialize_app()
message = messaging.Message(
        notification=messaging.Notification(
                title=title,
                body=body,
            ),
        android=messaging.AndroidConfig(
            ttl=datetime.timedelta(seconds=3600),
            priority='normal',
            notification=messaging.AndroidNotification(
                title=title,
                body=body,
#                 image='https://foo.bar.pizza-monster.png'
            ),
        ),
        token=registration_token
    )

response = messaging.send(message)
print('Successfully sent message:', response)
