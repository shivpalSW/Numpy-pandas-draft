from flask import Flask,jsonify, request
import file2
app = Flask(__name__)
# app >> object

@app.route('/')  # route (URL binding with the function)
def welcome():
    print("Welcome to Flask")
    return 'Welcome to Flask'

@app.route('/name')  # route (URL binding with the function)
def name():
    print("Hello")
    name = 'Python'
    password = '12345678'
    return jsonify({'name':name,'password':password})

@app.route('/my_name/<name>')  # Default String
def my_name(name):
    return 'My Name is %s'%name

@app.route('/my_roll_number/<float:roll_no>')  # Default String
def roll_number(roll_no):
    string = f'My Roll Number is {roll_no}'
    print(string)
    return string

@app.route('/train_model')  # Default String
def train_model():
    try:
        # model_train()
        return {'messege':'Successful'}
    except:
        return {'messege':'Unsuccessful'}

@app.route('/login',methods=['POST'])  # Default String
def login():
    try:
        data = request.form
        if data is None:
            return jsonify({'message': 'Request has no body!'}), 201

        print('Data >>>>>>> \n',data)
        name = data["name"]
        print('Name of the user is ',name)
        password = data["password"]
    
        if name == 'Rahul' and password == '1234567':
            return {'messege':'User Login Successful'}
        else:
            return {"Messege": "User details not found"}
    except:
        return {'messege':'Unsuccessful'}

@app.route('/house_price',methods=['POST'])  # Default String
def house_price():
    try:
        data = request.form
        if data is None:
            return jsonify({'message': 'Request has no body!'}), 201

        print('Data >>>>>>> \n',data)
        name = data["name"]
        print('Name of the user is ',name)
        password = data["password"]
        predicted_house_price = model.predict() 
        return {'predicted house price is : ':predicted_house_price}
    except:
        pass

def test_model(user_inputs):
    # 1. Flat Size
    # 2. Location
    # 3. no of Balconies

    predicted_house_price = model.predict() 
    return predicted_house_price


@app.route('/credit/user_login', methods=['POST'])
def user_login():
    data = request.form

    print("login checking", data)
    name = data['name']
    password = data['password']

    if data is None:
        return jsonify({'message': 'Request has no body!'}), 201

    response,secret_key = credit_db.login_user(data)

    print("response,", response, secret_key)
    if response == -1:
        return jsonify({'message': 'Email ID or Password Missing!', 'secretkey': secret_key}), 201
    elif response == -2:
        return jsonify({'message': 'Incorrect Details!', 'secretkey': secret_key}), 201
    elif response == -3:
        return jsonify({'message': 'Company Inactive!', 'secretkey': secret_key}), 201
    token = jwt.encode({'public_id': data['emailid'], 'exp': datetime.datetime.now() +
                        datetime.timedelta(minutes=600)}, secret_key)
    first_name = response
    credit_db.update_token(data['emailid'], token.decode('UTF-8'), 'user_registration')

    return jsonify({'token': token.decode('UTF-8'), 'firstname': first_name, 'registration_type': 'user_registration'}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0",port = "5005" ,debug = False)
