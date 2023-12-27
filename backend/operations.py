from flask import jsonify
import psycopg2
from dotenv import load_dotenv
import os

load_dotenv()

class DBOperations:

    def create_connection(self):
        try:
            conn = psycopg2.connect(
                dbname=os.getenv("DB_NAME"),
                user=os.getenv("DB_USER"),
                password=os.getenv("DB_PASSWORD"),
                host=os.getenv("DB_HOST"),
                port=os.getenv("DB_PORT")
            )
            return conn
        except Exception as e:
            print(f"Error connecting to the database: {e}")
            return None

    def get_user_details(self, query):
        print(f"User table Query {query}")
        try:
            conn = self.create_connection()
            if conn:
                cur = conn.cursor()     
                cur.execute(query)
                user_details = cur.fetchall()
                cur.close()
                conn.close()

                users_list = {
                    "response": {
                        "msg": "We have successfully fetched filtered records for User",
                        "records": [
                            {
                                'user_id': row[0],
                                'full_name': row[1],
                                'email': row[2],
                                'phone_number': row[3],
                                'image_url': row[4]
                            } for row in user_details
                        ],
                        "status": True,
                    }
                }

                return jsonify(users_list)

        except Exception as e:
            print(f"Error retrieving user details from the database: {e}")
            return jsonify({f"Error retrieving user details from the database: {e}"})

    def add_users(self, user_id, full_name, email, phone_number, image_url):
        try:
            db_connect = self.create_connection()
            if db_connect:
                cur = db_connect.cursor()
                query = """
                    INSERT INTO users (user_id, full_name, email, phone_number, image_url)
                    VALUES (%s, %s, %s, %s, %s)
                """
                data = (user_id, full_name, email, phone_number, image_url)

                cur.execute(query, data)
                db_connect.commit()

                return jsonify({"message": "User added sccessfully."}), 200

                cur.close()
        except Exception as e:
            print(f"Error inserting user: {e}")

    def get_restaurant_details(self, query):
        try:
            conn = self.create_connection()
            if conn:
                cur = conn.cursor()     
                cur.execute(query)
                restaurant_details = cur.fetchall()
                cur.close()
                conn.close()

                restaurant_list = {
                    "response": {
                        "msg": "We have successfully fetched records for Restaurant",
                        "records": [
                            {
                                'restaurant_id': row[0],
                                'restaurant_name': row[1],
                                'restauran_rating': row[2],
                                'restauran_contact_number': row[3],
                                'image_url': row[4],
                                'restaurant_description':row[5]
                            } for row in restaurant_details
                        ],
                        "status": True,
                    }
                }

                return jsonify(restaurant_list)

        except Exception as e:
            print(f"Error retrieving user details from the database: {e}")
            return jsonify({f"Error retrieving user details from the database: {e}"})

    def add_restaurant(self, restaurant_id,restaurant_name,restauran_rating,restauran_contact_number,image_url,restaurant_description):
        try:
            db_connect = self.create_connection()
            if db_connect:
                cur = db_connect.cursor()
                query = """
                    INSERT INTO restaurant_details (restaurant_id, restaurant_name, restauran_rating, restauran_contact_number, image_url,restaurant_description)
                    VALUES (%s, %s, %s, %s, %s, %s)
                """
                data = (restaurant_id, restaurant_name, restauran_rating, restauran_contact_number, image_url,restaurant_description)

                cur.execute(query, data)
                db_connect.commit()
                cur.close()
                return jsonify({"message": "Restaurant added successfully"}), 200

                
        except Exception as e:
            print(f"Error inserting user: {e}")

    def get_restaurant_items(self, query):
        try:
            conn = self.create_connection()
            if conn:
                cur = conn.cursor()     
                cur.execute(query)
                restaurant_details = cur.fetchall()
                cur.close()
                conn.close()

                restaurant_item_list = {
                    "response": {
                        "msg": "We have successfully fetched records for Restaurants item",
                        "records": [
                            {
                                'restaurant_id':row[0],
                                'item_id': row[1],
                                'item_name': row[2],
                                'item_description': row[3],
                                'veg': row[4],
                                'item_rating': row[5],
                                'item_price': row[6],
                                'image_url':row[7]
                                
                            } for row in restaurant_details
                        ],
                        "status": True,
                    }
                }

                return jsonify(restaurant_item_list)

        except Exception as e:
            print(f"Error retrieving user details from the database: {e}")
            return jsonify({f"Error retrieving user details from the database: {e}"})

    def add_restaurant_items(self, item_id,restaurant_id, item_name,item_description,veg,item_rating,item_price,image_url):
            
            try:
                db_connect = self.create_connection()
                if db_connect:
                    cur = db_connect.cursor()
                    query = """
                        INSERT INTO restaurant_menu_details (item_id,restaurant_id, item_name, item_description, veg, item_rating,item_price,image_url)
                        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                    """
                    data = (item_id ,restaurant_id, item_name, item_description, veg, item_rating,item_price,image_url)

                    cur.execute(query, data)
                    db_connect.commit()
                    return jsonify({"message": "Menu Item added sccessfully."}), 200

                    cur.close()
            except Exception as e:
                print(f"Error inserting user: {e}")
                
                return f"Error inserting user: {e}"