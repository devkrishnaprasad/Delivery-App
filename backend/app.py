import uuid
from flask import Flask, jsonify, request
from operations import DBOperations
import boto3
from dotenv import load_dotenv
import os
from flask_cors import CORS

load_dotenv()

app = Flask(__name__)
CORS(app)
operations_obj = DBOperations()

def generate_uuid():
    return str(uuid.uuid4())

def get_file_url(file):
    file_extension = get_file_extension(file.filename)
    image_id = generate_uuid() + file_extension
    s3_base_url = f"https://{os.getenv('S3_BUCKET')}.s3.amazonaws.com/"
    image_url = f"{s3_base_url}{image_id}"
    return image_id, image_url

def upload_image_s3(data):
    try:
        file = request.files['file']
        image_id, image_url = get_file_url(file)
        s3 = boto3.client('s3', aws_access_key_id=os.getenv("S3_ACCESS_KEY"), aws_secret_access_key=os.getenv("S3_SECRET_KEY"))
        s3.upload_fileobj(file, os.getenv("S3_BUCKET"), image_id)
        return image_url

    except Exception as e:
        return jsonify({"error": f"Error processing request: {e}"}), 500

def delete_image_from_s3(image_key):
    s3 = boto3.client('s3', aws_access_key_id=os.getenv("S3_ACCESS_KEY"), aws_secret_access_key=os.getenv("S3_SECRET_KEY"))
    filename = os.path.basename(image_key)
    try:
        # Delete the object
        s3.delete_object(Bucket=os.getenv("S3_BUCKET"), Key=filename)
        print(f"Image {filename} deleted successfully from {os.getenv("S3_BUCKET")}")
    except Exception as e:
        print(f"Error deleting image {filename} from {os.getenv("S3_BUCKET")}: {e}")

@app.route('/')
def home():
    return "Hello world"

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
    full_name, email, phone_number, date_of_birth, gender = data.get("full_name"), data.get("email"), data.get("phone_number"),data.get("date_of_birth"), data.get("gender")
    return operations_obj.add_users(user_id= generate_uuid(),full_name=full_name, email=email,phone_number=phone_number,date_of_birth=date_of_birth,gender=gender,image_url=upload_image_s3(data=data))
    
@app.route('/update_user_details', methods=['POST'])
def update_user_details():
    data = request.form

    full_name, email, phone_number, date_of_birth, gender,user_id, image_url = data.get("full_name"), data.get("email"), data.get("phone_number"),data.get("date_of_birth"), data.get("gender"), data.get("user_id"), data.get('image_url')
    if 'file' not in request.files:
        print("Normal API call.......")
        return operations_obj.update_user(
        user_id=user_id,
        full_name=full_name,
        email=email,
        phone_number=phone_number,
        image_url=image_url,
        date_of_birth=date_of_birth,
        gender=gender
    )
    else:
        print("Image Upload API call.....")
        delete_image_from_s3(image_url)
        return operations_obj.update_user( user_id=user_id,full_name=full_name,email=email,phone_number=phone_number,date_of_birth=date_of_birth,gender=gender,image_url=upload_image_s3(data=data))
        
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
    return operations_obj.add_restaurant(restaurant_id= generate_uuid(),restaurant_name=restaurant_name,restauran_rating=restaurant_rating,restauran_contact_number=restaurant_contact_number,image_url=upload_image_s3(data=data),restaurant_description=restaurant_description)

@app.route('/add_restaurant_menu_item', methods=['POST'])
def add_restaurant_item():
    data = request.form
    restaurant_id, item_name, item_description, veg, item_rating, item_price = \
    data.get("restaurant_id"), data.get("item_name"), data.get("item_description"), data.get("veg"), data.get("item_rating"), data.get("item_price")
    return operations_obj.add_restaurant_items(item_id=generate_uuid(),restaurant_id=restaurant_id,item_name=item_name,item_description=item_description,veg=veg,item_rating=item_rating,item_price=item_price,image_url=upload_image_s3(data=data))

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
    app.run(debug=True, port=4000)
