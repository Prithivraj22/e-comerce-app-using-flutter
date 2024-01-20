from flask import Flask, request, jsonify
import requests
import base64

app = Flask(__name__)

# Replace these with your Twilio credentials
ACCOUNT_SID = 'ACa424d064352b5fb6bafeb155a072cf0f'
AUTH_TOKEN = 'b0eb9cda369ae4240260a64157b9769f'
TWILIO_NUMBER = '+19893944672'


@app.route('/send_sms', methods=['POST'])
def send_sms():
    to_number = '+919361648407'
    message = 'message'

    if not to_number or not message:
        return jsonify({"error": "Invalid request. 'to_number' and 'message' are required."}), 400

    try:
        response = requests.post(
            f'https://api.twilio.com/2010-04-01/Accounts/{ACCOUNT_SID}/Messages.json',
            auth=(ACCOUNT_SID, AUTH_TOKEN),
            data={
                'From': TWILIO_NUMBER,
                'To': to_number,
                'Body': message,
            }
        )

        if response.status_code == 201:
            return jsonify({"message": "SMS sent successfully Now!"}), 200
        else:
            return jsonify({"error": f"Failed to send SMS. Error: {response.reason}"}), 500

    except Exception as e:
        return jsonify({"error": f"Failed to send SMS. Error: {e}"}), 500


if __name__ == '__main__':
    app.run(debug=True)
