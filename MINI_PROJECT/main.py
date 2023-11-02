from flask import Flask, render_template, url_for, request
import mysql.connector 

app = Flask(__name__)

@app.route('/location', methods=['GET'])
def location_fetch():
  return render_template('location.html')



#database connection
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="root",
  database="Airport"
)

# Define route for the form
@app.route('/user_details')
def add_details():
  return render_template('user.html')

# Define function to handle the form submission
@app.route('/user_details', methods=['POST'])
def user_details_post():
  user_id = request.form['user_id']
  first_name = request.form['first_name']
  last_name = request.form['last_name']
  email = request.form['email']
  

  # Insert the data into the MySQL database
  mycursor = mydb.cursor()
  sql = "INSERT INTO users (user_id, first_name, last_name, email) VALUES (%s, %s,%s, %s)"
  val = (user_id,first_name,last_name,email)
  mycursor.execute(sql, val)
  mydb.commit()

  return 'Details added successfully!'
 

@app.route('/bookings')
def bookings():
  return render_template('booking.html')

# Define function to handle the form submission
@app.route('/bookings', methods=['POST'])
def bookings_post():
  schedule_id = request.form['schedule_id']
  departure_time = request.form['departure_time']
  arrival_time = request.form['arrival_time']
  day_of_week = request.form['day_of_week']
  

  # Insert the data into the MySQL database
  mycursor = mydb.cursor()
  sql = "INSERT INTO schedules (schedule_id, departure_time, arrival_time, day_of_week) VALUES (%s, %s,%s, %s)"
  val = (schedule_id, departure_time, arrival_time, day_of_week)
  mycursor.execute(sql, val)
  mydb.commit()

  return 'Your Shuttle is booked!'
if __name__ =="__main__":
    app.run(debug=True)

