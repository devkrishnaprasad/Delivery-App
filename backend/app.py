import uuid
from flask import Flask, jsonify, request
from operations import DBOperations
import boto3
from dotenv import load_dotenv
import os

load_dotenv()

app = Flask(__name__)
operations_obj = DBOperations()


def generate_uuid():
    return str(uuid.uuid4())

def get_file_url(file):
    file_extension = get_file_extension(file.filename)
    image_id = generate_uuid() + file_extension
    s3_base_url = f"https://{os.getenv('S3_BUCKET')}.s3.amazonaws.com/"
    image_url = f"{s3_base_url}{image_id}"
    return image_id, image_url

def handle_add_request(data, *args):
    try:
        file = request.files['file']
        image_id, image_url = get_file_url(file)
        s3 = boto3.client('s3', aws_access_key_id=os.getenv("S3_ACCESS_KEY"), aws_secret_access_key=os.getenv("S3_SECRET_KEY"))
        s3.upload_fileobj(file, os.getenv("S3_BUCKET"), image_id)
        
        response = args[0](generate_uuid(), *args[1:], image_url)
        return response

    except Exception as e:
        return jsonify({"error": f"Error processing request: {e}"}), 500

@app.route('/get_user_details/all', methods=['POST'])
def get_all_user_data():
    data = operations_obj.get_user_details("select * from users")
    return data

@app.route('/get_user_details/filtered', methods=['POST'])
def get_filtered_user_data():
    data = request.json
    user_id = data.get("user_id")
    data = operations_obj.get_user_details(f"SELECT * FROM users WHERE user_id = '{user_id}'")
    return data

@app.route('/add_users', methods=['POST'])
def add_users():
    data = request.form
    full_name, email, phone_number = data.get("full_name"), data.get("email"), data.get("phone_number")
    return handle_add_request(data, operations_obj.add_users, full_name, email, phone_number)

@app.route('/get_restaurant_details/all', methods=['POST'])
def get_restaurant_data():
    data = operations_obj.get_restaurant_details("select * from restaurant_details")
    return data

@app.route('/get_restaurant_details/filtered', methods=['POST'])
def get_filtered_restaurant_data():
    data = request.json
    restaurant_id = data.get("restaurant_id")
    data = operations_obj.get_restaurant_details(f"SELECT * FROM restaurant_details WHERE restaurant_id = '{restaurant_id}'")
    return data

@app.route('/add_restaurant', methods=['POST'])
def add_restaurants():
    data = request.form
    restaurant_name, restaurant_rating, restaurant_contact_number, restaurant_description = \
        data.get("restaurant_name"), data.get("restaurant_rating"), data.get("restaurant_contact_number"), data.get("restaurant_description")
    return handle_add_request(data, operations_obj.add_restaurant, restaurant_name, restaurant_rating, restaurant_contact_number, restaurant_description)

@app.route('/add_restaurant_menu_item', methods=['POST'])
def add_restaurant_item():
    data = request.form
    restaurant_id, item_name, item_description, veg, item_rating, item_price = \
        data.get("restaurant_id"), data.get("item_name"), data.get("item_description"), data.get("veg"), data.get("item_rating"), data.get("item_price")
    return handle_add_request(data, operations_obj.add_restaurant_items, restaurant_id, item_name, item_description, veg, item_rating, item_price)

@app.route('/get_restaurant_menu_list/flitered', methods=['POST'])
def get_filtered_restaurant_menu_data():
    data = request.json
    restaurant_id = data.get("restaurant_id")
    data = operations_obj.get_restaurant_items(f"select * from restaurant_menu_details WHERE restaurant_id = '{restaurant_id}'")
    return data

def get_file_extension(file_name):
    _, file_extension = os.path.splitext(file_name)
    return file_extension

if __name__ == '__main__':
    app.run(debug=True, port=5000)
